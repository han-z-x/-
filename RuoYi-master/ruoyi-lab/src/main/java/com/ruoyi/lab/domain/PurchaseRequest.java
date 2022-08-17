package com.ruoyi.lab.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 购买申请管理对象 purchase_request
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public class PurchaseRequest extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 购买申请编号 */
    private Long prId;

    /** 申请购买设备名称 */
    @Excel(name = "申请购买设备名称")
    private String prTitle;

    /** 申请购买数量 */
    @Excel(name = "申请购买数量")
    private Long prNumber;

    /** 申请购买原因 */
    @Excel(name = "申请购买原因")
    private String prReason;

    /** 申请人 */
    @Excel(name = "申请人")
    private Long prRequester;

    /** 申请时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "申请时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date prRequestDate;

    /** 申请状态 */
    @Excel(name = "申请状态")
    private Long prStatus;

    public void setPrId(Long prId) 
    {
        this.prId = prId;
    }

    public Long getPrId() 
    {
        return prId;
    }
    public void setPrTitle(String prTitle) 
    {
        this.prTitle = prTitle;
    }

    public String getPrTitle() 
    {
        return prTitle;
    }
    public void setPrNumber(Long prNumber) 
    {
        this.prNumber = prNumber;
    }

    public Long getPrNumber() 
    {
        return prNumber;
    }
    public void setPrReason(String prReason) 
    {
        this.prReason = prReason;
    }

    public String getPrReason() 
    {
        return prReason;
    }
    public void setPrRequester(Long prRequester) 
    {
        this.prRequester = prRequester;
    }

    public Long getPrRequester() 
    {
        return prRequester;
    }
    public void setPrRequestDate(Date prRequestDate) 
    {
        this.prRequestDate = prRequestDate;
    }

    public Date getPrRequestDate() 
    {
        return prRequestDate;
    }
    public void setPrStatus(Long prStatus) 
    {
        this.prStatus = prStatus;
    }

    public Long getPrStatus() 
    {
        return prStatus;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("prId", getPrId())
            .append("prTitle", getPrTitle())
            .append("prNumber", getPrNumber())
            .append("prReason", getPrReason())
            .append("prRequester", getPrRequester())
            .append("prRequestDate", getPrRequestDate())
            .append("prStatus", getPrStatus())
            .toString();
    }
}
