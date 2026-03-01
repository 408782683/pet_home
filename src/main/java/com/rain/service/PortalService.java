package com.rain.service;

import com.alibaba.fastjson2.JSONObject;
import com.rain.mapper.PortalMapper;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PortalService {
    private final PortalMapper mapper = new PortalMapper();

    public JSONObject pageQuery(String table, JSONObject query, int page, int size, String orderBy) throws SQLException {
        StringBuilder where = new StringBuilder(" where 1=1 ");
        List<Object> params = new ArrayList<>();
        appendLike(where, params, "breed", query.getString("breed"));
        appendEq(where, params, "pet_type", query.getString("petType"));
        appendEq(where, params, "pet_gender", query.getString("petGender"));
        appendEq(where, params, "status", query.getString("status"));

        String publisher = query.getString("publisher");
        Integer currentUserId = query.getInteger("currentUserId");
        if (currentUserId == null) {
            currentUserId = query.getInteger("userId");
        }
        if ("my".equals(publisher) && currentUserId != null) {
            where.append(" and user_id = ? ");
            params.add(currentUserId);
        } else if ("other".equals(publisher) && currentUserId != null) {
            where.append(" and user_id <> ? ");
            params.add(currentUserId);
        }

        String sql = "select * from " + table + where + " order by " + orderBy + " limit ?,?";
        List<Object> listParams = new ArrayList<>(params);
        listParams.add((page - 1) * size);
        listParams.add(size);
        List<JSONObject> list = mapper.queryList(sql, listParams);

        int total = mapper.queryCount("select count(*) from " + table + where, params);
        JSONObject r = new JSONObject();
        r.put("list", list);
        r.put("total", total);
        return r;
    }

    public JSONObject getById(String table, long id) throws SQLException {
        return mapper.queryOne("select * from " + table + " where id=?", List.of(id));
    }

    public int savePost(String table, JSONObject body, boolean update, Integer userId) throws SQLException {
        if (update) {
            String sql = "update " + table + " set title=?,description=?,pet_type=?,pet_gender=?,pet_name=?,breed=?,vaccine_status=?,photos=?,location=?,owner_info=?,status=?,"
                    + (table.equals("breeding_post") ? "breeding_requirement" : table.equals("adoption_post") ? "adoption_requirement" : "foster_requirement")
                    + "=? where id=? and user_id=?";
            return mapper.update(sql, List.of(body.getString("title"), body.getString("description"), body.getString("petType"), body.getString("petGender"),
                    body.getString("petName"), body.getString("breed"), body.getString("vaccineStatus"), body.getString("photos"), body.getString("location"),
                    body.getString("ownerInfo"), body.getString("status"),
                    body.getString(table.equals("breeding_post") ? "breedingRequirement" : table.equals("adoption_post") ? "adoptionRequirement" : "fosterRequirement"),
                    body.getLong("id"), userId));
        }
        String requirementColumn = table.equals("breeding_post") ? "breeding_requirement" : table.equals("adoption_post") ? "adoption_requirement" : "foster_requirement";
        String requirementVal = body.getString(table.equals("breeding_post") ? "breedingRequirement" : table.equals("adoption_post") ? "adoptionRequirement" : "fosterRequirement");
        String sql = "insert into " + table + "(user_id,title,description,pet_type,pet_gender,pet_name,breed,vaccine_status,photos," + requirementColumn + ",location,owner_info,status,create_time) values(?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
        return mapper.update(sql, List.of(userId, body.getString("title"), body.getString("description"), body.getString("petType"), body.getString("petGender"),
                body.getString("petName"), body.getString("breed"), body.getString("vaccineStatus"), body.getString("photos"), requirementVal,
                body.getString("location"), body.getString("ownerInfo"), body.getString("status")));
    }



    public java.util.List<com.alibaba.fastjson2.JSONObject> queryList(String sql, java.util.List<Object> params) throws SQLException {
        return mapper.queryList(sql, params);
    }

    public com.alibaba.fastjson2.JSONObject queryOne(String sql, java.util.List<Object> params) throws SQLException {
        return mapper.queryOne(sql, params);
    }

    public int queryCount(String sql, java.util.List<Object> params) throws SQLException {
        return mapper.queryCount(sql, params);
    }

    public int update(String sql, java.util.List<Object> params) throws SQLException {
        return mapper.update(sql, params);
    }

    public long insertAndReturnId(String sql, java.util.List<Object> params) throws SQLException {
        return mapper.insertAndReturnId(sql, params);
    }
    private void appendLike(StringBuilder where, List<Object> params, String column, String value) {
        if (value != null && !value.isBlank()) {
            where.append(" and ").append(column).append(" like ? ");
            params.add("%" + value + "%");
        }
    }

    private void appendEq(StringBuilder where, List<Object> params, String column, String value) {
        if (value != null && !value.isBlank()) {
            where.append(" and ").append(column).append("=? ");
            params.add(value);
        }
    }
}
