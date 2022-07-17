
package com.iweb.controller;

import com.iweb.domain.CompareVo;
import com.iweb.service.TbFinanceInfoService;
import com.iweb.utils.DateTimeUtil;
import com.iweb.utils.UUIDUtil;
import com.iweb.vo.FinanceInfoVo;
import com.iweb.vo.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.iweb.domain.TbFinanceInfo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @file: TbFinanceInfoController
 * @version: 2021.1
 * @Description: TODO
 * @Author: Wj
 * @Date: 2022/4/8 15:59
 */
@Controller
@RequestMapping("/financeInfo")
public class TbFinanceInfoController {

    @Autowired
    private TbFinanceInfoService financeInfoService;

    //修改数据
    @PostMapping("/editFinanceInfo")
    @ResponseBody
    public R editFinanceInfo(TbFinanceInfo tbFinanceInfo ){
        //tbFinanceInfo.setId(4091450);
        int flag=financeInfoService.editFinanceInfo(tbFinanceInfo);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;

    }


    //删除数据
    @PostMapping("/deleteFinanceInfo")
    @ResponseBody
    public R deleteFinanceInfoById( Integer id){
        int flag=financeInfoService.deleteFinanceInfoById(id);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;
    }

    //增加数据
    @PostMapping("/addFinanceInfo")
    @ResponseBody
    public R addFinanceInfo(TbFinanceInfo tbFinanceInfo ){
        //设置随机id
        Integer uuid3 = UUIDUtil.getUUID3();
        tbFinanceInfo.setId(uuid3);
        //设置创建时间和修改时间
        String sysTime = DateTimeUtil.getSysTime();
       // tbFinanceInfo.setCreate_time(sysTime);
        tbFinanceInfo.setUpdateTime(sysTime);
        //设置记录人id
        tbFinanceInfo.setRecorderUserId(1);
        //设置默认余额
        if (tbFinanceInfo.getType()==1){
            Integer i=3000-Integer.valueOf(tbFinanceInfo.getSum());
            tbFinanceInfo.setBalance(i.toString());
        }else {
            Integer i=2000+Integer.valueOf(tbFinanceInfo.getSum());
            tbFinanceInfo.setBalance(i.toString());
        }

        //设置默认不删除
        tbFinanceInfo.setIsDeleted(0);
        int flag=financeInfoService.addFinanceInfo(tbFinanceInfo);
        R r = new R();
        if (flag==1){
            r.data("flag","success");
        }else {
            r.data("flag","error");
        }
        return r;
    }

    //查询全部
    @GetMapping("/selectFinanceInfoList")
    @ResponseBody
    public List<TbFinanceInfo> selectFinanceInfoList(){
        return financeInfoService.selectFinanceInfoList();
    }

    //条件查询带分页
    @PostMapping("/selectFinanceInfoByConditon")
    @ResponseBody
    public R selectFinanceInfoByConditon(FinanceInfoVo financeInfoVo,
                                         String current, String limit){

        int pageNo=Integer.valueOf(current);                      //当前页
        int skipCount=(pageNo-1)*Integer.valueOf(limit);          //略过的条数
        financeInfoVo.setSkipCount(skipCount);
        financeInfoVo.setLimit(Integer.valueOf(limit));
        return financeInfoService.selectFinanceInfoByConditon(financeInfoVo);
    }


    //图表查询收支历史
    @PostMapping("/selectChartsFinanceInfoHistory")
    @ResponseBody
    public Map selectChartsFinanceInfoHistory(){
        Map map=new HashMap();
        List<String> dataList=financeInfoService.selectChartsDataHistory();
        List<String> balaceList=financeInfoService.selectChartsBalanceHistory();
        map.put("dataList",dataList);
        map.put("balaceList",balaceList);
        return map;
    }

    //图表查询收支对比
    @PostMapping("/selectChartsFinanceInfoCompare")
    @ResponseBody
    public List<CompareVo> selectChartsFinanceInfoCompare(){
        List<CompareVo> dataList=financeInfoService.selectChartsFinanceInfoCompare();
        for (int i = 0; i < dataList.size(); i++) {
            if ("1".equals(dataList.get(i).getName())){
                dataList.get(i).setName("支出金额");
            }else {
                dataList.get(i).setName("收入金额");
            }
        }
        return dataList;
    }
}
