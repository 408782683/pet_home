package com.rain.controller;

import com.alibaba.fastjson2.JSONObject;
import com.rain.service.PortalService;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/api/insurance/*")
public class InsuranceServlet extends BaseServlet {
    private final PortalService service = new PortalService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String path=req.getPathInfo();
        JSONObject body=JSONObject.parseObject(req.getReader().readLine());
        try {
            if("/findByPage".equals(path)){
                int page=body.getIntValue("page",1), size=body.getIntValue("size",10);
                List<Object> params=new ArrayList<>(); String where=" where status='上架' ";
                if(body.getString("petType")!=null&&!body.getString("petType").isBlank()){ where+=" and pet_type=? "; params.add(body.getString("petType")); }
                if(body.getString("name")!=null&&!body.getString("name").isBlank()){ where+=" and name like ? "; params.add("%"+body.getString("name")+"%"); }
                List<Object> lp=new ArrayList<>(params); lp.add((page-1)*size); lp.add(size);
                var list=service.queryList("select * from insurance"+where+" order by id desc limit ?,?",lp);
                int total=service.queryCount("select count(*) from insurance"+where,params);
                JSONObject data=new JSONObject(); data.put("insuranceList",list); data.put("total",total); writeJson(resp,success(data));
            } else if("/detail".equals(path)){
                writeJson(resp,success(service.getById("insurance", body.getLong("id"))));
            } else if("/orderListPage".equals(path)){
                int page=body.getIntValue("page",1),size=body.getIntValue("size",10); Integer userId=body.getInteger("userId");
                String sql="select io.*,i.name insuranceName,i.logo insuranceLogo,i.coverage from insurance_order io left join insurance i on io.insurance_id=i.id where io.user_id=? order by io.id desc limit ?,?";
                var list=service.queryList(sql,List.of(userId,(page-1)*size,size));
                int total=service.queryCount("select count(*) from insurance_order where user_id=?", List.of(userId));
                JSONObject data=new JSONObject(); data.put("policyList",list); data.put("total",total); writeJson(resp,success(data));
            } else if("/claimListPage".equals(path)){
                int page=body.getIntValue("page",1),size=body.getIntValue("size",10); Integer userId=body.getInteger("userId");
                String sql="select c.*,io.policy_no,i.name insuranceName from insurance_claim c left join insurance_order io on c.insurance_order_id=io.id left join insurance i on io.insurance_id=i.id where c.user_id=? order by c.id desc limit ?,?";
                var list=service.queryList(sql,List.of(userId,(page-1)*size,size));
                int total=service.queryCount("select count(*) from insurance_claim where user_id=?",List.of(userId));
                JSONObject data=new JSONObject(); data.put("claimList",list); data.put("total",total); writeJson(resp,success(data));
            } else if("/claim/submit".equals(path)){
                String sql="insert into insurance_claim(insurance_order_id,user_id,claim_amount,description,images,status,create_time) values(?,?,?,?,?,'待审核',now())";
                service.update(sql,List.of(body.getLong("insuranceOrderId"),body.getInteger("userId"),body.getBigDecimal("claimAmount"),body.getString("description"),body.getString("images")));
                writeJson(resp,success("提交成功"));
            } else {
                writeJson(resp,error("接口不存在"));
            }
        } catch (Exception e){ writeJson(resp,error("系统繁忙")); }
    }
}
