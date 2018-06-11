package com.innovation.dao.impl;

import com.innovation.dao.IUserDao;
import com.innovation.entity.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @Auther: Innovation
 * @Date: 2018/5/19 16:21
 * @Vison: 1.0
 * @Description:
 */
@Repository
public class UserDao implements IUserDao {

    @Autowired
    private HibernateTemplate ht;

    /** 
     * @description: user表总行数
     * @author: li  
     * @date: 2018/6/6 19:13  
     * @param: []  
     * @return: int
     */ 
    public int queryUserRows() {
        String hql = "select count(*) from User as user";
        Session session = ht.getSessionFactory().openSession();
        Query query = session.createQuery(hql);
        int count = ((Long) query.iterate().next()).intValue();
        //用完session一定要关闭
        session.close();
        return count;
    }

    /**
     * @description: 查询所有用户
     * @author: li
     * @date: 2018/6/2 16:21
     * @param: []
     * @return: java.util.List<com.innovation.entity.User>
     */
    @Override
    public List<User> findAllUser(final int offset, final int length) {
       /*
        *  hql分页显示所采用的方法
        *  回调函数 执行execute的同时也要执行HibernateCallback中的方法
        *  使用了HibernateTemplate的情况下，仍然需要直接访问Session的需求而来的
        *  它提供了在HibernateTemplate里面直接访问Session的能力
        *  这个就是为什么要使用HibernateCallback.
        *
        **/
        List<User> list = (List<User>) ht.execute(new HibernateCallback() {
            public Object doInHibernate(Session session)
                    throws HibernateException {
            Query query = session.createQuery("from com.innovation.entity.User ");
            query.setFirstResult(offset);
            query.setMaxResults(length);
            List list = query.list();
            return list;
            }
        });
        return list;
    }

    @Override
    public User findUserById(int id) throws Exception {
        User user = ht.get(User.class,id);
        return user;
    }

    @Override
    public User findUserByUserName(String userName) throws Exception {
        return null;
    }

    @Override
    public User findUserByEmail(String email) throws Exception {
        List<User> userList = (List<User>) ht.find("from User where email=?", email);
        return userList.get(0);
    }

    @Override
    public User findUserByPhone(String phone) throws Exception {
        return null;
    }

    /**
     * 功能描述: 向数据库中插入user数据
     *
     * @param: user
     * @return:
     * @auther: Innovation
     * @date: 2018/5/25 16:53
     */
    @Override
    public void saveUser(User user) throws Exception {
        ht.save(user);
    }
    /** 
     * @description: 
     * @author: li  
     * @date: 2018/6/2 17:01
     * @param: [id]  
     * @return: java.lang.String  
     */
    @Override
    public String deleteUserById(int id) throws Exception {
        //book为标记
        String book = "Ok";
        User user = ht.get(User.class,id);
        if (user != null) {
            ht.delete(user);
        } else {
            book = "No";
        }
        return book;
    }

    @Override
    public int midifyPassWord(String userName, String newPassWord) throws Exception {
        return 0;
    }

    @Override
    public int midifyPhone(String userName, String newPhone) throws Exception {
        return 0;
    }

    @Override
    public int activateUser(String email) throws Exception {
        return 0;
    }
}
