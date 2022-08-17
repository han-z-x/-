package com.ruoyi.lab.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 报废记录管理对象 scrap
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public class Scrap extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 报废记录编号 */
    private Long scId;

    /** 报废设备 */
    @Excel(name = "报废设备")
    private Long scDevice;

    /** 报废状态确认 */
    @Excel(name = "报废状态确认")
    private Long scStatus;

    /** 报废日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "报废日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date scDate;

    public void setScId(Long scId) 
    {
        this.scId = scId;
    }

    public Long getScId() 
    {
        return scId;
    }
    public void setScDevice(Long scDevice) 
    {
        this.scDevice = scDevice;
    }

    public Long getScDevice() 
    {
        return scDevice;
    }
    public void setScStatus(Long scStatus) 
    {
        this.scStatus = scStatus;
    }

    public Long getScStatus() 
    {
        return scStatus;
    }
    public void setScDate(Date scDate) 
    {
        this.scDate = scDate;
    }

    public Date getScDate() 
    {
        return scDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("scId", getScId())
            .append("scDevice", getScDevice())
            .append("scStatus", getScStatus())
            .append("scDate", getScDate())
            .toString();
    }
}
