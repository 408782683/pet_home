// 检查 token 是否存在且未过期
function isTokenValid() {
    const token = localStorage.getItem('authToken');
    if (!token) return false;
    try {
        // JWT 结构: header.payload.signature
        const payloadBase64 = token.split('.')[1];
        const payloadJson = atob(payloadBase64.replace(/-/g, '+').replace(/_/g, '/'));
        const payload = JSON.parse(payloadJson);

        const now = Math.floor(Date.now() / 1000); // 当前时间（秒）
        return payload.exp > now; // exp 是过期时间戳（秒）
    } catch (e) {
        console.error('Token 解析失败', e);
        return false;
    }

}
// 页面加载时检查
if (!isTokenValid()) {
    // Token 无效或过期，清除并跳转
    localStorage.removeItem('authToken');
    localStorage.removeItem('userInfo');
    alert('登录已过期，请重新登录');
    //this.$message.err("登录已过期，请重新登录")
    window.location.href = '/index.html'; // 或 '/index.html'
}