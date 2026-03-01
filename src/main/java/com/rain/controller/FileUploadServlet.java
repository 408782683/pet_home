package com.rain.controller;
import com.alibaba.fastjson2.JSONObject;
import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClient;
import com.aliyun.oss.OSSClientBuilder;
import com.aliyun.oss.model.CannedAccessControlList;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletInputStream;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.UUID;
@WebServlet("/api/file/*")
//配置上传文件的基本限制信息
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 10,
        fileSizeThreshold = 1024 * 1024 * 2
)
public class FileUploadServlet extends BaseServlet{
    private static final String ENDPOINT = "oss-cn-beijing.aliyuncs.com"; // 你的地域
    private static final String ACCESS_KEY_ID = "";//keyid
    private static final String ACCESS_KEY_SECRET = "";//secret
    private static final String BUCKET_NAME = "5h1gure-bucket";//bucket的名称

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(111111);
        //设置请求的中文编码--上传一些中文的名称的图片
        req.setCharacterEncoding("UTF-8");
        //获取所有的Part内容
        Collection<Part> parts = req.getParts();
        //遍历集合parts
        for (Part part : parts) {
            if("file".equals(part.getName())){
                //获取上传的文件名称
                String fileName = extractFileName(part);
                if(fileName==null || fileName.isEmpty()){
                    continue;
                }
                //判断你是否上传的是图片类型  MIME ----> image
                String contentType = part.getContentType();
                System.out.println(contentType);
                if(contentType==null || !contentType.startsWith("image/") ){
                    writeJson(resp,error("只能上传图片文件!!!"));
                    return;
                }
                // 处理图片文件名称   xxxxxx.jpeg  ----> q74q8785wq7874837837q8.jpeg
                int index = fileName.lastIndexOf(".");
                //文件后缀名
                String express = fileName.substring(index);
                // 处理上传文件：我们尽量分类存放，可以按照时间来分类
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
                Date date = new Date();//当前系统时间
                String format = sdf.format(date); // 2026/01/22
                //重新构造一下文件上传的目录以及文件的名称
                fileName = format+"/"+
                        UUID.randomUUID().toString().replace("-","") +express;
                //通过part可以获取输入流
                InputStream inputStream = part.getInputStream();
                try {
                    //调用文件上传的方法
                    String imgUrl = uploadFile(fileName, inputStream);
                    JSONObject result = new JSONObject();
                    result.put("imgUrl", imgUrl);
                    writeJson(resp,success(result));
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
        }
    }

    //上传文件的方法
    public String uploadFile(String fileName, InputStream inputStream){
        //创建OSS对象，尝试去和阿里云OSS进行服务的连接
        OSS ossClient = new OSSClientBuilder().build(ENDPOINT,ACCESS_KEY_ID,ACCESS_KEY_SECRET);
        //开始来进行文件上传
        ossClient.putObject(BUCKET_NAME,fileName,inputStream);
        //OSS具备保护效果，不允许外界的人来随意访问我们资源
        //我们可以设置在上传完之后设置为public访问
        ossClient.setObjectAcl(BUCKET_NAME,fileName, CannedAccessControlList.PublicRead);
        //一定要拿到OSS给你返回的图片资源地址 imgUrl
        // https://wangtao208bucket.oss-cn-beijing.aliyuncs.com/dameinv%20%281%29.jpeg
        // https + BUCKET_NAME + . + ENDPOINT+ / + fileName
        return "https://"+BUCKET_NAME+"."+ENDPOINT+"/"+fileName;
    }


    // 提取文件名---基本上都是固定的代码---获取我们上传的文件名称
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        if (contentDisp != null) {
            for (String token : contentDisp.split(";")) {
                token = token.trim();
                if (token.startsWith("filename")) {
                    return token.substring(token.indexOf("=") + 2, token.length() - 1);
                }
            }
        }
        return null;
    }

}
