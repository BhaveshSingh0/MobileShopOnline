
package com.test.config;

import java.util.Properties;
import javax.sql.DataSource;
import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;



@Configuration
@ComponentScan(basePackages = { "com.test" })
@EnableTransactionManagement

public class HibernateConfig {
// Database Configuration
	private final static String DATABASE_URL = "jdbc:h2:tcp://localhost/~/mobilestore";
	private final static String DATABASE_DRIVER = "org.h2.Driver";
	private final static String DATABASE_DIALECT = "org.hibernate.dialect.H2Dialect";
	private final static String DATABASE_USERNAME = "sa";
	private final static String DATABASE_PASSWORD = "";

	@Bean("dataSource")
	public DataSource getDataSource() {
		BasicDataSource datasource = new BasicDataSource();

		
		datasource.setDriverClassName(DATABASE_DRIVER);
		datasource.setUrl(DATABASE_URL);
		datasource.setPassword(DATABASE_PASSWORD);
		datasource.setUsername(DATABASE_USERNAME);
		return datasource;
	}
	

	@Bean("sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("com.test");
		return builder.buildSessionFactory();

	}

	public Properties getHibernateProperties() {
		Properties p = new Properties();
		p.put("hibernate.dialect", DATABASE_DIALECT);
		p.put("hibernate.show_sql", "true");
		p.put("hibernate.format_sql", "true");
		return p;
	}
	
	@Bean("transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
		
		
		
	}

}
