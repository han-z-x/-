package com.ruoyi.lab.service;

import java.util.List;
import com.ruoyi.lab.domain.Scrap;

/**
 * 报废记录管理Service接口
 * 
 * @author ruoyi
 * @date 2022-06-18
 */
public interface IScrapService 
{
    /**
     * 查询报废记录管理
     * 
     * @param scId 报废记录管理主键
     * @return 报废记录管理
     */
    public Scrap selectScrapByScId(Long scId);

    /**
     * 查询报废记录管理列表
     * 
     * @param scrap 报废记录管理
     * @return 报废记录管理集合
     */
    public List<Scrap> selectScrapList(Scrap scrap);

    /**
     * 新增报废记录管理
     * 
     * @param scrap 报废记录管理
     * @return 结果
     */
    public int insertScrap(Scrap scrap);

    /**
     * 修改报废记录管理
     * 
     * @param scrap 报废记录管理
     * @return 结果
     */
    public int updateScrap(Scrap scrap);

    /**
     * 批量删除报废记录管理
     * 
     * @param scIds 需要删除的报废记录管理主键集合
     * @return 结果
     */
    public int deleteScrapByScIds(String scIds);

    /**
     * 删除报废记录管理信息
     * 
     * @param scId 报废记录管理主键
     * @return 结果
     */
    public int deleteScrapByScId(Long scId);
}
