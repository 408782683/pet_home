package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.service.PortalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/hospital/*")
public class HospitalServlet extends BaseServlet {
    private final PortalService service = new PortalService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path = req.getPathInfo();
        JSONObject body = JSONObject.parseObject(req.getReader().readLine());
        try {
            if ("/findByPage".equals(path)) {
                int page = body.getIntValue("page", 1), size = body.getIntValue("size", 10);
                StringBuilder where = new StringBuilder(" where 1=1 ");
                List<Object> params = new ArrayList<>();
                if (body.getString("name") != null && !body.getString("name").isBlank()) {
                    where.append(" and name like ? "); params.add("%"+body.getString("name")+"%");
                }
                if (body.getString("category") != null && !body.getString("category").isBlank()) {
                    where.append(" and category=? "); params.add(body.getString("category"));
                }
                List<Object> lp = new ArrayList<>(params); lp.add((page-1)*size); lp.add(size);
                var list = service.queryList("select * from hospital"+where+" order by id desc limit ?,?", lp);
                int total = service.queryCount("select count(*) from hospital"+where, params);
                JSONObject data = new JSONObject(); data.put("hospitalList", list); data.put("total", total);
                writeJson(resp, success(data));
            } else if ("/detail".equals(path)) {
                Long id = body.getLong("id");
                writeJson(resp, success(service.getById("hospital", id)));
            } else writeJson(resp, error("接口不存在"));
        } catch (Exception e) { writeJson(resp, error("系统繁忙")); }
    }
}
