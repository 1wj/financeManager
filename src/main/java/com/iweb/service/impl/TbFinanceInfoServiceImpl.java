
package com.iweb.service.impl;

import com.iweb.domain.CompareVo;
import com.iweb.service.TbFinanceInfoService;
import com.iweb.vo.FinanceInfoVo;
import com.iweb.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import com.iweb.dao.TbFinanceInfoDao;
import com.iweb.domain.TbFinanceInfo;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 16:04
 */
@Service
public class TbFinanceInfoServiceImpl implements TbFinanceInfoService {

    @Autowired
    private TbFinanceInfoDao financeInfoDao;

    //修改数据
    @Override
    public int editFinanceInfo(TbFinanceInfo tbFinanceInfo) {
        return financeInfoDao.editFinanceInfo(tbFinanceInfo);
    }

    //删除数据
    @Override
    public int deleteFinanceInfoById(Integer id) {
        return financeInfoDao.deleteFinanceInfoById(id);
    }

    //增加数据
    @Override
    public int addFinanceInfo(TbFinanceInfo tbFinanceInfo) {
        return financeInfoDao.addFinanceInfo(tbFinanceInfo);
    }

    //查询全部
    @Override
    public List<TbFinanceInfo> selectFinanceInfoList() {
        return financeInfoDao.selectFinanceInfoList();
    }

    //条件查询带分页
    @Override
    public R selectFinanceInfoByConditon(FinanceInfoVo financeInfoVo) {
        //查类别对象
        List<TbFinanceInfo> list=financeInfoDao.selectFinanceInfoByConditon(financeInfoVo);
        //查总条数
        int count=financeInfoDao.selectCount(financeInfoVo);
        R r = new R();
        //设置总条数
        r.data("count",count);
        //设置总页数
        int total =(count % financeInfoVo.getLimit() == 0) ?(count / financeInfoVo.getLimit()) : (count / financeInfoVo.getLimit() +1);
        r.data("total",total);
        r.data("rows",list);
        return r;
    }

    //获取图表历史日期
    @Override
    public List<String> selectChartsDataHistory() {
        return financeInfoDao.selectChartsDataHistory();
    }

    //获取图表历史数据
    @Override
    public List<String> selectChartsBalanceHistory() {
        return financeInfoDao.selectChartsBalanceHistory();
    }

    //获取图表对比数据
    @Override
    public List<CompareVo> selectChartsFinanceInfoCompare() {
        return  financeInfoDao.selectChartsFinanceInfoCompare();
    }


}
