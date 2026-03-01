package com.rain.service;

import java.sql.SQLException;
import java.util.List;
import com.rain.mapper.SystemConfigMapper;
import com.rain.entity.SystemConfig;


public class SystemConfigService {

    private SystemConfigMapper systemConfigMapper = new SystemConfigMapper();


    // 获取系统配置
    public List<SystemConfig> getAllSystemcConfig() throws SQLException, SQLException {
        return systemConfigMapper.getAllSystemConfig();
    }
}
