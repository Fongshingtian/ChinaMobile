package common;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class CommonUtils {
	private static ApplicationContext bf = null;

	//获取spring中注入的bean的方法
	public static Object getBean(String beanid) {
		if (bf == null) {
			bf = new ClassPathXmlApplicationContext(
					"classpath:config-resource/aplicationContext.xml");
		}
		
		return  bf.getBean(beanid);
	}
}
