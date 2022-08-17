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
import com.ruoyi.lab.domain.Device;
import com.ruoyi.lab.service.IDeviceService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 设备管理Controller
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Controller
@RequestMapping("/lab/device")
public class DeviceController extends BaseController
{
    private String prefix = "lab/device";

    @Autowired
    private IDeviceService deviceService;

    @RequiresPermissions("lab:device:view")
    @GetMapping()
    public String device()
    {
        return prefix + "/device";
    }

    /**
     * 查询设备管理列表
     */
    @RequiresPermissions("lab:device:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Device device)
    {
        startPage();
        List<Device> list = deviceService.selectDeviceList(device);
        return getDataTable(list);
    }

    /**
     * 导出设备管理列表
     */
    @RequiresPermissions("lab:device:export")
    @Log(title = "设备管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Device device)
    {
        List<Device> list = deviceService.selectDeviceList(device);
        ExcelUtil<Device> util = new ExcelUtil<Device>(Device.class);
        return util.exportExcel(list, "设备管理数据");
    }

    /**
     * 新增设备管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存设备管理
     */
    @RequiresPermissions("lab:device:add")
    @Log(title = "设备管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Device device)
    {
        return toAjax(deviceService.insertDevice(device));
    }

    /**
     * 修改设备管理
     */
    @RequiresPermissions("lab:device:edit")
    @GetMapping("/edit/{dvId}")
    public String edit(@PathVariable("dvId") Long dvId, ModelMap mmap)
    {
        Device device = deviceService.selectDeviceByDvId(dvId);
        mmap.put("device", device);
        return prefix + "/edit";
    }

    /**
     * 修改保存设备管理
     */
    @RequiresPermissions("lab:device:edit")
    @Log(title = "设备管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Device device)
    {
        return toAjax(deviceService.updateDevice(device));
    }

    /**
     * 删除设备管理
     */
    @RequiresPermissions("lab:device:remove")
    @Log(title = "设备管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(deviceService.deleteDeviceByDvIds(ids));
    }
}
