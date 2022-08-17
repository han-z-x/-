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
import com.ruoyi.lab.domain.Scrap;
import com.ruoyi.lab.service.IScrapService;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 报废记录管理Controller
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Controller
@RequestMapping("/lab/scrap")
public class ScrapController extends BaseController
{
    private String prefix = "lab/scrap";

    @Autowired
    private IScrapService scrapService;

    @RequiresPermissions("lab:scrap:view")
    @GetMapping()
    public String scrap()
    {
        return prefix + "/scrap";
    }

    /**
     * 查询报废记录管理列表
     */
    @RequiresPermissions("lab:scrap:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(Scrap scrap)
    {
        startPage();
        List<Scrap> list = scrapService.selectScrapList(scrap);
        return getDataTable(list);
    }

    /**
     * 导出报废记录管理列表
     */
    @RequiresPermissions("lab:scrap:export")
    @Log(title = "报废记录管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(Scrap scrap)
    {
        List<Scrap> list = scrapService.selectScrapList(scrap);
        ExcelUtil<Scrap> util = new ExcelUtil<Scrap>(Scrap.class);
        return util.exportExcel(list, "报废记录管理数据");
    }

    /**
     * 新增报废记录管理
     */
    @GetMapping("/add")
    public String add()
    {
        return prefix + "/add";
    }

    /**
     * 新增保存报废记录管理
     */
    @RequiresPermissions("lab:scrap:add")
    @Log(title = "报废记录管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(Scrap scrap)
    {
        return toAjax(scrapService.insertScrap(scrap));
    }

    /**
     * 修改报废记录管理
     */
    @RequiresPermissions("lab:scrap:edit")
    @GetMapping("/edit/{scId}")
    public String edit(@PathVariable("scId") Long scId, ModelMap mmap)
    {
        Scrap scrap = scrapService.selectScrapByScId(scId);
        mmap.put("scrap", scrap);
        return prefix + "/edit";
    }

    /**
     * 修改保存报废记录管理
     */
    @RequiresPermissions("lab:scrap:edit")
    @Log(title = "报废记录管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(Scrap scrap)
    {
        return toAjax(scrapService.updateScrap(scrap));
    }

    /**
     * 删除报废记录管理
     */
    @RequiresPermissions("lab:scrap:remove")
    @Log(title = "报废记录管理", businessType = BusinessType.DELETE)
    @PostMapping( "/remove")
    @ResponseBody
    public AjaxResult remove(String ids)
    {
        return toAjax(scrapService.deleteScrapByScIds(ids));
    }
}
