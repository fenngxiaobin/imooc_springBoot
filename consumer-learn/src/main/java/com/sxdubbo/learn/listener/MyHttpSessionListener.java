package com.sxdubbo.learn.listener;

import java.util.ArrayList;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class MyHttpSessionListener implements HttpSessionListener{
    private int userCounts=0;
    @Override
    public void sessionCreated(HttpSessionEvent se) {
        userCounts++;
        //重新在servletContext中保存userCounts
        se.getSession().getServletContext().setAttribute("userCounts", userCounts);
//        int count=((Integer)se.getSession().getServletContext().getAttribute("userCounts")).intValue();
//        System.out.println(count+"listener");
        System.out.println("listen");
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        userCounts--;
        //重新在servletContext中保存userCounts
        se.getSession().getServletContext().setAttribute("userCounts", userCounts);
    }
}
