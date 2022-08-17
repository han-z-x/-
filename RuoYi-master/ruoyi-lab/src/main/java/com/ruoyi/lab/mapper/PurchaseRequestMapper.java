package com.ruoyi.lab.mapper;

import java.util.List;
import com.ruoyi.lab.domain.PurchaseRequest;

/**
 * 购买申请管理Mapper接口
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public interface PurchaseRequestMapper 
{
    /**
     * 查询购买申请管理
     * 
     * @param prId 购买申请管理主键
     * @return 购买申请管理
     */
    public PurchaseRequest selectPurchaseRequestByPrId(Long prId);

    /**
     * 查询购买申请管理列表
     * 
     * @param purchaseRequest 购买申请管理
     * @return 购买申请管理集合
     */
    public List<PurchaseRequest> selectPurchaseRequestList(PurchaseRequest purchaseRequest);

    /**
     * 新增购买申请管理
     * 
     * @param purchaseRequest 购买申请管理
     * @return 结果
     */
    public int insertPurchaseRequest(PurchaseRequest purchaseRequest);

    /**
     * 修改购买申请管理
     * 
     * @param purchaseRequest 购买申请管理
     * @return 结果
     */
    public int updatePurchaseRequest(PurchaseRequest purchaseRequest);

    /**
     * 删除购买申请管理
     * 
     * @param prId 购买申请管理主键
     * @return 结果
     */
    public int deletePurchaseRequestByPrId(Long prId);

    /**
     * 批量删除购买申请管理
     * 
     * @param prIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deletePurchaseRequestByPrIds(String[] prIds);
}
