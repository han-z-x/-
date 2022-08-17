package com.ruoyi.lab.mapper;

import java.util.List;
import com.ruoyi.lab.domain.Repairment;

/**
 * 修理记录管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public interface RepairmentMapper 
{
    /**
     * 查询修理记录管理
     * 
     * @param rpId 修理记录管理主键
     * @return 修理记录管理
     */
    public Repairment selectRepairmentByRpId(Long rpId);

    /**
     * 查询修理记录管理列表
     * 
     * @param repairment 修理记录管理
     * @return 修理记录管理集合
     */
    public List<Repairment> selectRepairmentList(Repairment repairment);

    /**
     * 新增修理记录管理
     * 
     * @param repairment 修理记录管理
     * @return 结果
     */
    public int insertRepairment(Repairment repairment);

    /**
     * 修改修理记录管理
     * 
     * @param repairment 修理记录管理
     * @return 结果
     */
    public int updateRepairment(Repairment repairment);

    /**
     * 删除修理记录管理
     * 
     * @param rpId 修理记录管理主键
     * @return 结果
     */
    public int deleteRepairmentByRpId(Long rpId);

    /**
     * 批量删除修理记录管理
     * 
     * @param rpIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteRepairmentByRpIds(String[] rpIds);
}
