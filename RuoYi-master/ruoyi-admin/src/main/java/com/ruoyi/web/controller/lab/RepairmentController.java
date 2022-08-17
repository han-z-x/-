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
import com.ruoyi.lab.domain.Repairment;
import com.ruoyi.lab.service.IRepairmentService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 修理记录管理Controller
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Controller
@RequestMapping("/lab/repairment")
public class RepairmentController extends BaseController
{
    private String prefix = "lab/repairment";

    @Autowired
    private IRepairmentService repairmentService;

    @RequiresPermissions("lab:repairment:view")
    @GetMapping()
    public String repairment()
    {
        return prefix + "/repairment";
    }

    /**
     * 查询修理记录管理列表
     */
    @RequiresPermissions("lab:repairment:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Repairment repairment)
    {
        startPage();
        List<Repairment> list = repairmentService.selectRepairmentList(repairment);
        return getDataTable(list);
    }

    /**
     * 导出修理记录管理列表
     */
    @RequiresPermissions("lab:repairment:export")
    @Log(title = "修理记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Repairment repairment)
    {
        List<Repairment> list = repairmentService.selectRepairmentList(repairment);
        ExcelUtil<Repairment> util = new ExcelUtil<Repairment>(Repairment.class);
        return util.exportExcel(list, "修理记录管理数据");
    }

    /**
     * 新增修理记录管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存修理记录管理
     */
    @RequiresPermissions("lab:repairment:add")
    @Log(title = "修理记录管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Repairment repairment)
    {
        return toAjax(repairmentService.insertRepairment(repairment));
    }

    /**
     * 修改修理记录管理
     */
    @RequiresPermissions("lab:repairment:edit")
    @GetMapping("/edit/{rpId}")
    public String edit(@PathVariable("rpId") Long rpId, ModelMap mmap)
    {
        Repairment repairment = repairmentService.selectRepairmentByRpId(rpId);
        mmap.put("repairment", repairment);
        return prefix + "/edit";
    }

    /**
     * 修改保存修理记录管理
     */
    @RequiresPermissions("lab:repairment:edit")
    @Log(title = "修理记录管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Repairment repairment)
    {
        return toAjax(repairmentService.updateRepairment(repairment));
    }

    /**
     * 删除修理记录管理
     */
    @RequiresPermissions("lab:repairment:remove")
    @Log(title = "修理记录管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(repairmentService.deleteRepairmentByRpIds(ids));
    }
}
