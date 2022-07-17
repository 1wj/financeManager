
package com.iweb.service;

import com.iweb.domain.CompareVo;
import com.iweb.domain.TbFinanceInfo;
import com.iweb.vo.FinanceInfoVo;
import com.iweb.vo.R;
import java.util.List;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 16:02
 */
public interface TbFinanceInfoService {

    //查询全部
    List<TbFinanceInfo> selectFinanceInfoList();

    //条件查询带分页
    R selectFinanceInfoByConditon(FinanceInfoVo financeInfoVo);

    //增加数据
    int addFinanceInfo(TbFinanceInfo tbFinanceInfo);

    //删除数据
    int deleteFinanceInfoById(Integer id);

    //修改数据
    int editFinanceInfo(TbFinanceInfo tbFinanceInfo);

    //获取图表历史日期
    List<String> selectChartsDataHistory();

    //获取图表历史数据
    List<String> selectChartsBalanceHistory();

    //获取图表对比数据
    List<CompareVo> selectChartsFinanceInfoCompare();
}
