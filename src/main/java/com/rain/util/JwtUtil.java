package com.rain.util;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;

public class  JwtUtil {

    // 秘钥（建议从配置文件读取，不要硬编码）
    private static final String SECRET = "mySecretKeyForPetSystem_2025!@#shdjfhsfhsafhasj347&^^&^&";

    // Token 有效期：30 分钟（毫秒）
    private static final long EXPIRATION = 30 * 60 * 1000L; // 1800000 ms

    /**
     * 生成 JWT Token（仅用于登录成功后签发）
     * @param username 用户名
     * @param role     角色（0=普通用户, 1=管理员）
     * @return JWT 字符串
     */
    public static String generateToken(String username, int role) {
        Date now = new Date();
        Date expiryDate = new Date(now.getTime() + EXPIRATION);

        return Jwts.builder() // 使用建造者模式构建 JWT
                .setSubject(username) // 设置 JWT 主体（用户名）
                .claim("role", role) // 添加自定义声明（角色）
                .setIssuedAt(now) // 设置签发时间
                .setExpiration(expiryDate) // 设置过期时间
                .signWith(getSigningKey(), SignatureAlgorithm.HS256) // 签名算法（HS256）
                .compact(); // 生成 JWT 字符串
    }

    // 辅助方法：将字符串秘钥转为 Key 对象
    public static Key getSigningKey() {
        byte[] keyBytes = SECRET.getBytes(StandardCharsets.UTF_8);
        return new SecretKeySpec(keyBytes, SignatureAlgorithm.HS256.getJcaName());
    }
}
