package common;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class Hibernate_Util  extends CommonUtils{
	//获取session工厂
	private static SessionFactory sessionf=null;
	public static SessionFactory getSessionFactory(){
		if(sessionf==null){
			sessionf=(SessionFactory)getBean("sFactory");
		}
		return sessionf;
	}
	public static Session getSession(){
		return getSessionFactory().openSession();
	}
}
