package com.lnho.easyorder.service;

import com.lnho.easyorder.dao.OrderDAO;
import com.lnho.easyorder.vo.OverviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * com.lnho.easyorder.service
 *
 * @author lnho
 * @date 14-7-23 上午10:29
 */
@Service
public class OverviewService {
    @Autowired
    private OrderDAO orderDAO;

    public List<OverviewVo> queryMonthsCount() {
        return orderDAO.queryMonthsCount();
    }
    public List<OverviewVo> queryYearsCount() {
        return orderDAO.queryYearsCount();
    }
}
