package com.rain.mapper;

import com.alibaba.fastjson2.JSONObject;
import com.rain.util.JdbcUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PortalMapper {

    public List<JSONObject> queryList(String sql, List<Object> params) throws SQLException {
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setParams(ps, params);
            try (ResultSet rs = ps.executeQuery()) {
                return mapRows(rs);
            }
        }
    }

    public JSONObject queryOne(String sql, List<Object> params) throws SQLException {
        List<JSONObject> list = queryList(sql, params);
        return list.isEmpty() ? null : list.get(0);
    }

    public int queryCount(String sql, List<Object> params) throws SQLException {
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setParams(ps, params);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next() ? rs.getInt(1) : 0;
            }
        }
    }

    public int update(String sql, List<Object> params) throws SQLException {
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            setParams(ps, params);
            return ps.executeUpdate();
        }
    }

    public long insertAndReturnId(String sql, List<Object> params) throws SQLException {
        try (Connection conn = JdbcUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            setParams(ps, params);
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                return rs.next() ? rs.getLong(1) : 0L;
            }
        }
    }

    private void setParams(PreparedStatement ps, List<Object> params) throws SQLException {
        for (int i = 0; i < params.size(); i++) {
            ps.setObject(i + 1, params.get(i));
        }
    }

    private List<JSONObject> mapRows(ResultSet rs) throws SQLException {
        List<JSONObject> rows = new ArrayList<>();
        ResultSetMetaData md = rs.getMetaData();
        int count = md.getColumnCount();
        while (rs.next()) {
            JSONObject row = new JSONObject();
            for (int i = 1; i <= count; i++) {
                String key = md.getColumnLabel(i);
                row.put(toCamel(key), rs.getObject(i));
            }
            rows.add(row);
        }
        return rows;
    }

    private String toCamel(String snake) {
        StringBuilder sb = new StringBuilder();
        boolean upper = false;
        for (char c : snake.toCharArray()) {
            if (c == '_') {
                upper = true;
            } else if (upper) {
                sb.append(Character.toUpperCase(c));
                upper = false;
            } else {
                sb.append(c);
            }
        }
        return sb.toString();
    }
}
