package com.innovation.service;

import com.innovation.entity.Travels;

import java.util.List;

/**
 * @Auther: Innovation
 * @Date: 2018/6/8 11:28
 * @Vison: 1.0
 * @Description:
 */
public interface ITravelsService {

    //查询Travels表总行数
    public int queryTravelsRows();
    //查找游记
    public List<Travels> findAllTravels(final int offset, final int length);
    public Travels findTravelsById(int id) throws Exception;
    public Travels findTravelsByName(String travelsName) throws Exception;
    public List<Travels> findTravelsByCityID(int cityId);

    List<Travels> findTravelsByUserID(int userId);

    //插入更新和删除
    public boolean saveTravels(Travels travels) throws Exception;
    public void deleteTravelsById(int id) throws Exception;
    public boolean updateTravels(Travels travels) throws Exception;
}
