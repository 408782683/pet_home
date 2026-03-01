package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.service.PortalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/appointment/*")
public class AppointmentServlet extends BaseServlet {
    private final PortalService service = new PortalService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path = req.getPathInfo();
        JSONObject body = JSONObject.parseObject(req.getReader().readLine());
        try {
            if ("/add".equals(path)) {
                String sql = "insert into appointment(user_id,hospital_id,hospital_name,pet_name,pet_type,condition_description,images,appointment_date,appointment_time,contact_phone,status,create_time) values(?,?,?,?,?,?,?,?,?,?,?,now())";
                service.update(sql, List.of(body.getInteger("userId"), body.getInteger("hospitalId"), body.getString("hospitalName"), body.getString("petName"), body.getString("petType"), body.getString("conditionDescription"), body.getString("images"), body.getString("appointmentDate"), body.getString("appointmentTime"), body.getString("contactPhone"), "待赴约"));
                writeJson(resp, success("预约成功"));
            } else if ("/findByPage".equals(path)) {
                int page=body.getIntValue("page",1), size=body.getIntValue("size",10); Integer userId=body.getInteger("userId");
                String status=body.getString("status");
                StringBuilder where=new StringBuilder(" where user_id=? "); List<Object> params=new ArrayList<>(List.of(userId));
                if(status!=null&&!status.isBlank()){ where.append(" and status=? "); params.add(status);} 
                List<Object> lp=new ArrayList<>(params); lp.add((page-1)*size); lp.add(size);
                var list=service.queryList("select * from appointment"+where+" order by id desc limit ?,?", lp);
                int total=service.queryCount("select count(*) from appointment"+where, params);
                JSONObject data=new JSONObject(); data.put("appointmentList", list); data.put("total", total);
                writeJson(resp, success(data));
            } else if ("/status".equals(path)) {
                int n=service.update("update appointment set status=? where id=? and user_id=?", List.of(body.getString("status"), body.getLong("id"), body.getInteger("userId")));
                writeJson(resp, n>0?success("更新成功"):error("更新失败"));
            } else if (path!=null && path.startsWith("/cancel/")) {
                long id=Long.parseLong(path.substring("/cancel/".length()));
                int n=service.update("update appointment set status='已取消' where id=?", List.of(id));
                writeJson(resp, n>0?success("取消成功"):error("取消失败"));
            } else writeJson(resp,error("接口不存在"));
        } catch (Exception e) { writeJson(resp,error("系统繁忙")); }
    }
}
