package com.rsv.orm;

import java.io.IOException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class DBConnector {
	private static Logger logger = LoggerFactory.getLogger(DBConnector.class);
	private static SqlSessionFactory factory;
	
	static {
		try {
			factory = new SqlSessionFactoryBuilder()
					.build(Resources.getResourceAsReader("com/rsv/orm/MybatisConfig.xml")); //DB접속연결!
		} catch (IOException e) {
			logger.error("MybatisConfig 파일 오류! 체크해보세요!");
			e.printStackTrace();
		}
	}
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
