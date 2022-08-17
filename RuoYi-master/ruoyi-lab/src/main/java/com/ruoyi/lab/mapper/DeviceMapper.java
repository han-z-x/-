package com.ruoyi.lab.mapper;

import java.util.List;
import com.ruoyi.lab.domain.Device;

/**
 * 设备管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public interface DeviceMapper 
{
    /**
     * 查询设备管理
     * 
     * @param dvId 设备管理主键
     * @return 设备管理
     */
    public Device selectDeviceByDvId(Long dvId);

    /**
     * 查询设备管理列表
     * 
     * @param device 设备管理
     * @return 设备管理集合
     */
    public List<Device> selectDeviceList(Device device);

    /**
     * 新增设备管理
     * 
     * @param device 设备管理
     * @return 结果
     */
    public int insertDevice(Device device);

    /**
     * 修改设备管理
     * 
     * @param device 设备管理
     * @return 结果
     */
    public int updateDevice(Device device);

    /**
     * 删除设备管理
     * 
     * @param dvId 设备管理主键
     * @return 结果
     */
    public int deleteDeviceByDvId(Long dvId);

    /**
     * 批量删除设备管理
     * 
     * @param dvIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteDeviceByDvIds(String[] dvIds);
}
