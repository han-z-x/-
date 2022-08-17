package com.ruoyi.lab.service.impl;

import java.util.List;

import com.ruoyi.lab.domain.Device;
import com.ruoyi.lab.mapper.DeviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.lab.mapper.RepairmentMapper;
import com.ruoyi.lab.domain.Repairment;
import com.ruoyi.lab.service.IRepairmentService;
import com.ruoyi.common.core.text.Convert;

/**
 * 修理记录管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Service
public class RepairmentServiceImpl implements IRepairmentService
{
    @Autowired
    private RepairmentMapper repairmentMapper;

    @Autowired
    private DeviceMapper deviceMapper;

    /**
     * 查询修理记录管理
     *
     * @param rpId 修理记录管理主键
     * @return 修理记录管理
     */
    @Override
    public Repairment selectRepairmentByRpId(Long rpId)
    {
        return repairmentMapper.selectRepairmentByRpId(rpId);
    }

    /**
     * 查询修理记录管理列表
     *
     * @param repairment 修理记录管理
     * @return 修理记录管理
     */
    @Override
    public List<Repairment> selectRepairmentList(Repairment repairment)
    {
        return repairmentMapper.selectRepairmentList(repairment);
    }

    /**
     * 新增修理记录管理
     *
     * @param repairment 修理记录管理
     * @return 结果
     */
    @Override
    public int insertRepairment(Repairment repairment)
    {
        // 查询修理记录对应的设备，并将其状态改为"修理中"
        Device device = deviceMapper.selectDeviceByDvId(repairment.getRpDevice());
        device.setDvStatus(1L);
        deviceMapper.updateDevice(device);
        return repairmentMapper.insertRepairment(repairment);
    }

    /**
     * 修改修理记录管理
     *
     * @param repairment 修理记录管理
     * @return 结果
     */
    @Override
    public int updateRepairment(Repairment repairment)
    {
        // 查询修理记录对应的设备，并将其状态改为"正常"
        Device device = deviceMapper.selectDeviceByDvId(repairment.getRpDevice());
        device.setDvStatus(0L);
        deviceMapper.updateDevice(device);
        // 将修理记录的状态也改为“已修复”
        repairment.setRpStatus(1L);
        return repairmentMapper.updateRepairment(repairment);
    }

    /**
     * 批量删除修理记录管理
     *
     * @param rpIds 需要删除的修理记录管理主键
     * @return 结果
     */
    @Override
    public int deleteRepairmentByRpIds(String rpIds)
    {
        return repairmentMapper.deleteRepairmentByRpIds(Convert.toStrArray(rpIds));
    }

    /**
     * 删除修理记录管理信息
     *
     * @param rpId 修理记录管理主键
     * @return 结果
     */
    @Override
    public int deleteRepairmentByRpId(Long rpId)
    {
        return repairmentMapper.deleteRepairmentByRpId(rpId);
    }
}
