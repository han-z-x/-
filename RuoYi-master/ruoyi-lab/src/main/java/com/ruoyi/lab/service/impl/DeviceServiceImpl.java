package com.ruoyi.lab.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.lab.mapper.DeviceMapper;
import com.ruoyi.lab.domain.Device;
import com.ruoyi.lab.service.IDeviceService;
import com.ruoyi.common.core.text.Convert;

/**
 * 设备管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
@Service
public class DeviceServiceImpl implements IDeviceService 
{
    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询设备管理
     * 
     * @param dvId 设备管理主键
     * @return 设备管理
     */
    @Override
    public Device selectDeviceByDvId(Long dvId)
    {
        return deviceMapper.selectDeviceByDvId(dvId);
    }

    /**
     * 查询设备管理列表
     * 
     * @param device 设备管理
     * @return 设备管理
     */
    @Override
    public List<Device> selectDeviceList(Device device)
    {
        return deviceMapper.selectDeviceList(device);
    }

    /**
     * 新增设备管理
     * 
     * @param device 设备管理
     * @return 结果
     */
    @Override
    public int insertDevice(Device device)
    {
        return deviceMapper.insertDevice(device);
    }

    /**
     * 修改设备管理
     * 
     * @param device 设备管理
     * @return 结果
     */
    @Override
    public int updateDevice(Device device)
    {
        return deviceMapper.updateDevice(device);
    }

    /**
     * 批量删除设备管理
     * 
     * @param dvIds 需要删除的设备管理主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDvIds(String dvIds)
    {
        return deviceMapper.deleteDeviceByDvIds(Convert.toStrArray(dvIds));
    }

    /**
     * 删除设备管理信息
     * 
     * @param dvId 设备管理主键
     * @return 结果
     */
    @Override
    public int deleteDeviceByDvId(Long dvId)
    {
        return deviceMapper.deleteDeviceByDvId(dvId);
    }
}
