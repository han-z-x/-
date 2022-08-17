package com.ruoyi.lab.service.impl;

import java.util.List;

import com.ruoyi.lab.domain.Device;
import com.ruoyi.lab.domain.Repairment;
import com.ruoyi.lab.mapper.DeviceMapper;
import com.ruoyi.lab.mapper.RepairmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.lab.mapper.ScrapMapper;
import com.ruoyi.lab.domain.Scrap;
import com.ruoyi.lab.service.IScrapService;
import com.ruoyi.common.core.text.Convert;

/**
 * 报废记录管理Service业务层处理
 *
 * @author ruoyi
 * @date 2022-06-18
 */
@Service
public class ScrapServiceImpl implements IScrapService {
    @Autowired
    private ScrapMapper scrapMapper;

    @Autowired
    private DeviceMapper deviceMapper;

    @Autowired
    private RepairmentMapper repairmentMapper;

    /**
     * 查询报废记录管理
     *
     * @param scId 报废记录管理主键
     * @return 报废记录管理
     */
    @Override
    public Scrap selectScrapByScId(Long scId) {
        return scrapMapper.selectScrapByScId(scId);
    }

    /**
     * 查询报废记录管理列表
     *
     * @param scrap 报废记录管理
     * @return 报废记录管理
     */
    @Override
    public List<Scrap> selectScrapList(Scrap scrap) {
        return scrapMapper.selectScrapList(scrap);
    }

    /**
     * 新增报废记录管理
     *
     * @param scrap 报废记录管理
     * @return 结果
     */
    @Override
    public int insertScrap(Scrap scrap) {
        return scrapMapper.insertScrap(scrap);
    }

    /**
     * 修改报废记录管理
     *
     * @param scrap 报废记录管理
     * @return 结果
     */
    @Override
    public int updateScrap(Scrap scrap) {
        // 找到该设备的最后一条在维修中的维修记录，将其状态更改为“已报废”
        Repairment repairment = new Repairment();
        // 符合条件的维修记录中，设备ID与报废ID相同，且修理状态为“修理中”
        repairment.setRpDevice(scrap.getScDevice());
        repairment.setRpStatus(0L);
        List<Repairment> repairments = repairmentMapper.selectRepairmentList(repairment);
        for(Repairment rp : repairments) {
            rp.setRpStatus(2L);
            repairmentMapper.updateRepairment(rp);
        }
        // 将该设备的状态改为“已报废”
        Device device = deviceMapper.selectDeviceByDvId(scrap.getScDevice());
        device.setDvStatus(2L);
        deviceMapper.updateDevice(device);
        // 将该报废记录的状态改为“已报废”
        scrap.setScStatus(1L);
        return scrapMapper.updateScrap(scrap);
    }

    /**
     * 批量删除报废记录管理
     *
     * @param scIds 需要删除的报废记录管理主键
     * @return 结果
     */
    @Override
    public int deleteScrapByScIds(String scIds) {
        return scrapMapper.deleteScrapByScIds(Convert.toStrArray(scIds));
    }

    /**
     * 删除报废记录管理信息
     *
     * @param scId 报废记录管理主键
     * @return 结果
     */
    @Override
    public int deleteScrapByScId(Long scId) {
        return scrapMapper.deleteScrapByScId(scId);
    }
}
