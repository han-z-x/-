package com.ruoyi.lab.service;

import java.util.List;
import com.ruoyi.lab.domain.PurchaseRequest;

/**
 * 购买申请Service接口
 *
 * @author ruoyi
 * @date 2022-06-18
 */
public interface IPurchaseRequestService
{
    /**
     * 查询购买申请
     *
     * @param prId 购买申请主键
     * @return 购买申请
     */
    public PurchaseRequest selectPurchaseRequestByPrId(Long prId);

    /**
     * 查询购买申请列表
     *
     * @param purchaseRequest 购买申请
     * @return 购买申请集合
     */
    public List<PurchaseRequest> selectPurchaseRequestList(PurchaseRequest purchaseRequest);

    /**
     * 新增购买申请
     *
     * @param purchaseRequest 购买申请
     * @return 结果
     */
    public int insertPurchaseRequest(PurchaseRequest purchaseRequest);

    /**
     * 修改购买申请
     *
     * @param purchaseRequest 购买申请
     * @return 结果
     */
    public int updatePurchaseRequest(PurchaseRequest purchaseRequest);

    /**
     * 批量删除购买申请
     *
     * @param prIds 需要删除的购买申请主键集合
     * @return 结果
     */
    public int deletePurchaseRequestByPrIds(String prIds);

    /**
     * 删除购买申请信息
     *
     * @param prId 购买申请主键
     * @return 结果
     */
    public int deletePurchaseRequestByPrId(Long prId);
}
