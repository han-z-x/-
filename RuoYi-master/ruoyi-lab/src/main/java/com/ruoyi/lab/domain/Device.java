package com.ruoyi.lab.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 设备管理对象 device
 *
 * @author ruoyi
 * @date 2022-06-18
 */
public class Device extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 设备编号 */
    private Long dvId;

    /** 设备类别 */
    @Excel(name = "设备类别")
    private String dvSort;

    /** 设备名称 */
    @Excel(name = "设备名称")
    private String dvTitle;

    /** 设备型号 */
    @Excel(name = "设备型号")
    private String dvType;

    /** 设备规格 */
    @Excel(name = "设备规格")
    private String dvSpecification;

    /** 设备单价 */
    @Excel(name = "设备单价")
    private Long dvPrice;

    /** 数量 */
    @Excel(name = "数量")
    private Long dvNumber;

    /** 购置日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "购置日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date dvPurchaseDate;

    /** 生产厂商 */
    @Excel(name = "生产厂商")
    private String dvProducer;

    /** 经办人 */
    @Excel(name = "经办人")
    private Long dvManager;

    /** 设备状态 */
    @Excel(name = "设备状态")
    private Long dvStatus;

    public void setDvId(Long dvId)
    {
        this.dvId = dvId;
    }

    public Long getDvId()
    {
        return dvId;
    }
    public void setDvSort(String dvSort)
    {
        this.dvSort = dvSort;
    }

    public String getDvSort()
    {
        return dvSort;
    }
    public void setDvTitle(String dvTitle)
    {
        this.dvTitle = dvTitle;
    }

    public String getDvTitle()
    {
        return dvTitle;
    }
    public void setDvType(String dvType)
    {
        this.dvType = dvType;
    }

    public String getDvType()
    {
        return dvType;
    }
    public void setDvSpecification(String dvSpecification)
    {
        this.dvSpecification = dvSpecification;
    }

    public String getDvSpecification()
    {
        return dvSpecification;
    }
    public void setDvPrice(Long dvPrice)
    {
        this.dvPrice = dvPrice;
    }

    public Long getDvPrice()
    {
        return dvPrice;
    }
    public void setDvNumber(Long dvNumber)
    {
        this.dvNumber = dvNumber;
    }

    public Long getDvNumber()
    {
        return dvNumber;
    }
    public void setDvPurchaseDate(Date dvPurchaseDate)
    {
        this.dvPurchaseDate = dvPurchaseDate;
    }

    public Date getDvPurchaseDate()
    {
        return dvPurchaseDate;
    }
    public void setDvProducer(String dvProducer)
    {
        this.dvProducer = dvProducer;
    }

    public String getDvProducer()
    {
        return dvProducer;
    }
    public void setDvManager(Long dvManager)
    {
        this.dvManager = dvManager;
    }

    public Long getDvManager()
    {
        return dvManager;
    }
    public void setDvStatus(Long dvStatus)
    {
        this.dvStatus = dvStatus;
    }

    public Long getDvStatus()
    {
        return dvStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("dvId", getDvId())
            .append("dvSort", getDvSort())
            .append("dvTitle", getDvTitle())
            .append("dvType", getDvType())
            .append("dvSpecification", getDvSpecification())
            .append("dvPrice", getDvPrice())
            .append("dvNumber", getDvNumber())
            .append("dvPurchaseDate", getDvPurchaseDate())
            .append("dvProducer", getDvProducer())
            .append("dvManager", getDvManager())
            .append("dvStatus", getDvStatus())
            .toString();
    }
}
