package com.ruoyi.lab.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 修理记录管理对象 repairment
 *
 * @author ruoyi
 * @date 2022-06-18
 */
public class Repairment extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 修理记录编号 */
    private Long rpId;

    /** 待修理设备 */
    @Excel(name = "待修理设备")
    private Long rpDevice;

    /** 待修理设备名称 */
    @Excel(name = "设备名称")
    private String dvTitle;

    /** 责任人 */
    @Excel(name = "责任人")
    private Long rpLiablePerson;

    /** 修理厂家 */
    @Excel(name = "修理厂家")
    private String rpFactory;

    /** 修理费用 */
    @Excel(name = "修理费用")
    private Long rpPrice;

    /** 修理状态 */
    @Excel(name = "修理状态")
    private Long rpStatus;

    /** 修理完成日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "修理完成日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date rpDate;

    public void setRpId(Long rpId)
    {
        this.rpId = rpId;
    }

    public Long getRpId()
    {
        return rpId;
    }

    public void setRpDevice(Long rpDevice)
    {
        this.rpDevice = rpDevice;
    }

    public Long getRpDevice()
    {
        return rpDevice;
    }

//    public Device getRpDevice() {
//        return rpDevice;
//    }
//
//    public void setRpDevice(Device rpDevice) {
//        this.rpDevice = rpDevice;
//    }

    public void setRpLiablePerson(Long rpLiablePerson)
    {
        this.rpLiablePerson = rpLiablePerson;
    }

    public Long getRpLiablePerson()
    {
        return rpLiablePerson;
    }
    public void setRpFactory(String rpFactory)
    {
        this.rpFactory = rpFactory;
    }

    public String getRpFactory()
    {
        return rpFactory;
    }
    public void setRpPrice(Long rpPrice)
    {
        this.rpPrice = rpPrice;
    }

    public Long getRpPrice()
    {
        return rpPrice;
    }
    public void setRpStatus(Long rpStatus)
    {
        this.rpStatus = rpStatus;
    }

    public Long getRpStatus()
    {
        return rpStatus;
    }
    public void setRpDate(Date rpDate)
    {
        this.rpDate = rpDate;
    }

    public Date getRpDate()
    {
        return rpDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("rpId", getRpId())
            .append("rpDevice", getRpDevice())
            .append("rpLiablePerson", getRpLiablePerson())
            .append("rpFactory", getRpFactory())
            .append("rpPrice", getRpPrice())
            .append("rpStatus", getRpStatus())
            .append("rpDate", getRpDate())
            .toString();
    }


    public String getDvTitle() {
        return dvTitle;
    }

    public void setDvTitle(String dvTitle) {
        this.dvTitle = dvTitle;
    }
}
