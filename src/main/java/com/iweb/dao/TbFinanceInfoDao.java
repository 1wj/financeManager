
package com.iweb.dao;

import com.iweb.domain.CompareVo;
import com.iweb.vo.FinanceInfoVo;
import org.apache.ibatis.annotations.Mapper;
import com.iweb.domain.TbFinanceInfo;
import java.util.List;

/**
 * @file: financeManager
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 16:10
 */
@Mapper
public interface TbFinanceInfoDao {
    //查询全部
    List<TbFinanceInfo> selectFinanceInfoList();

    //条件查询带分页
    List<TbFinanceInfo> selectFinanceInfoByConditon(FinanceInfoVo financeInfoVo);

    //查数量
    int selectCount(FinanceInfoVo financeInfoVo);

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
