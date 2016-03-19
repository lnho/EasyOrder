package com.lnho.easyorder.dao;

import com.lnho.easyorder.bean.CountResult;
import com.lnho.easyorder.bean.Log;
import com.lnho.easyorder.commons.mybatis.dao.BaseDAO;

import java.util.List;

/**
 * com.lnho.easyorder.dao
 *
 * @author lnho
 * @date 14-7-23 上午10:30
 */
public interface LogDAO extends BaseDAO<Log> {
    public List<CountResult> queryMonthsCount(Integer userId);
}
