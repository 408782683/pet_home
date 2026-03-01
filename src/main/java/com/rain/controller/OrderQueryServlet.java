package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.service.PortalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/order/*")
public class OrderQueryServlet extends BaseServlet {
    private final PortalService service = new PortalService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path=req.getPathInfo();
        JSONObject body=JSONObject.parseObject(req.getReader().readLine());
        try {
            if ("/listByPage".equals(path)) {
                int page=body.getIntValue("page",1),size=body.getIntValue("size",10); Integer userId=body.getInteger("userId");
                StringBuilder where=new StringBuilder(" where o.user_id=? "); List<Object> params=new ArrayList<>(List.of(userId));
                if(body.getString("status")!=null&&!body.getString("status").isBlank()){ where.append(" and o.status=? "); params.add(body.getString("status")); }
                List<Object> lp=new ArrayList<>(params); lp.add((page-1)*size); lp.add(size);
                String sql="select o.* from orders o"+where+" order by o.id desc limit ?,?";
                var list=service.queryList(sql,lp);
                for (JSONObject order : list) {
                    Long oid=order.getLong("id");
                    var details=service.queryList("select * from order_detail where order_id=?", List.of(oid));
                    order.put("productList", details);
                }
                int total=service.queryCount("select count(*) from orders o"+where, params);
                JSONObject data=new JSONObject(); data.put("orderList",list); data.put("total",total);
                writeJson(resp,success(data));
            } else {
                writeJson(resp,error("接口不存在"));
            }
        } catch (Exception e){ writeJson(resp,error("系统繁忙")); }
    }
}
