package com.ruoyi.lab.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.lab.mapper.PurchaseRequestMapper;
import com.ruoyi.lab.domain.PurchaseRequest;
import com.ruoyi.lab.service.IPurchaseRequestService;
import com.ruoyi.common.core.text.Convert;

/**
 * 购买申请管理Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
@Service
public class PurchaseRequestServiceImpl implements IPurchaseRequestService 
{
    @Autowired
    private PurchaseRequestMapper purchaseRequestMapper;

    /**
     * 查询购买申请管理
     * 
     * @param prId 购买申请管理主键
     * @return 购买申请管理
     */
    @Override
    public PurchaseRequest selectPurchaseRequestByPrId(Long prId)
    {
        return purchaseRequestMapper.selectPurchaseRequestByPrId(prId);
    }

    /**
     * 查询购买申请管理列表
     * 
     * @param purchaseRequest 购买申请管理
     * @return 购买申请管理
     */
    @Override
    public List<PurchaseRequest> selectPurchaseRequestList(PurchaseRequest purchaseRequest)
    {
        return purchaseRequestMapper.selectPurchaseRequestList(purchaseRequest);
    }

    /**
     * 新增购买申请管理
     * 
     * @param purchaseRequest 购买申请管理
     * @return 结果
     */
    @Override
    public int insertPurchaseRequest(PurchaseRequest purchaseRequest)
    {
        return purchaseRequestMapper.insertPurchaseRequest(purchaseRequest);
    }

    /**
     * 修改购买申请管理
     * 
     * @param purchaseRequest 购买申请管理
     * @return 结果
     */
    @Override
    public int updatePurchaseRequest(PurchaseRequest purchaseRequest)
    {
        return purchaseRequestMapper.updatePurchaseRequest(purchaseRequest);
    }

    /**
     * 批量删除购买申请管理
     * 
     * @param prIds 需要删除的购买申请管理主键
     * @return 结果
     */
    @Override
    public int deletePurchaseRequestByPrIds(String prIds)
    {
        return purchaseRequestMapper.deletePurchaseRequestByPrIds(Convert.toStrArray(prIds));
    }

    /**
     * 删除购买申请管理信息
     * 
     * @param prId 购买申请管理主键
     * @return 结果
     */
    @Override
    public int deletePurchaseRequestByPrId(Long prId)
    {
        return purchaseRequestMapper.deletePurchaseRequestByPrId(prId);
    }
}
