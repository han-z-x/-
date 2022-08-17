package com.ruoyi.web.controller.lab;

import java.util.List;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.lab.domain.PurchaseRequest;
import com.ruoyi.lab.service.IPurchaseRequestService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 购买申请管理Controller
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Controller
@RequestMapping("/lab/request")
public class PurchaseRequestController extends BaseController
{
    private String prefix = "lab/request";

    @Autowired
    private IPurchaseRequestService purchaseRequestService;

    @RequiresPermissions("lab:request:view")
    @GetMapping()
    public String request()
    {
        return prefix + "/request";
    }

    /**
     * 查询购买申请管理列表
     */
    @RequiresPermissions("lab:request:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(PurchaseRequest purchaseRequest)
    {
        startPage();
        List<PurchaseRequest> list = purchaseRequestService.selectPurchaseRequestList(purchaseRequest);
        return getDataTable(list);
    }

    /**
     * 导出购买申请管理列表
     */
    @RequiresPermissions("lab:request:export")
    @Log(title = "购买申请管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(PurchaseRequest purchaseRequest)
    {
        List<PurchaseRequest> list = purchaseRequestService.selectPurchaseRequestList(purchaseRequest);
        ExcelUtil<PurchaseRequest> util = new ExcelUtil<PurchaseRequest>(PurchaseRequest.class);
        return util.exportExcel(list, "购买申请管理数据");
    }

    /**
     * 新增购买申请管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存购买申请管理
     */
    @RequiresPermissions("lab:request:add")
    @Log(title = "购买申请管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(PurchaseRequest purchaseRequest)
    {
        return toAjax(purchaseRequestService.insertPurchaseRequest(purchaseRequest));
    }

    /**
     * 修改购买申请管理
     */
    @RequiresPermissions("lab:request:edit")
    @GetMapping("/edit/{prId}")
    public String edit(@PathVariable("prId") Long prId, ModelMap mmap)
    {
        PurchaseRequest purchaseRequest = purchaseRequestService.selectPurchaseRequestByPrId(prId);
        mmap.put("purchaseRequest", purchaseRequest);
        return prefix + "/edit";
    }

    /**
     * 修改保存购买申请管理
     */
    @RequiresPermissions("lab:request:edit")
    @Log(title = "购买申请管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(PurchaseRequest purchaseRequest)
    {
        return toAjax(purchaseRequestService.updatePurchaseRequest(purchaseRequest));
    }

    /**
     * 删除购买申请管理
     */
    @RequiresPermissions("lab:request:remove")
    @Log(title = "购买申请管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(purchaseRequestService.deletePurchaseRequestByPrIds(ids));
    }
}
