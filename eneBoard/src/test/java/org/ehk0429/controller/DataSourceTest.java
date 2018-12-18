package org.ehk0429.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DataSourceTest {
	
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	
	@Setter(onMethod_ = {@Autowired})
	private SqlSessionFactory sqlSessionFactory;
	

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	@Test
	public void testMyBatis() {
		try(SqlSession session = sqlSessionFactory.openSession();
				Connection con = session.getConnection();
				) {
			log.info(session);
			log.info(con);
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
	}
	
	@Test
	public void testConection() throws Exception {
		try(Connection con = DriverManager.getConnection(
				"jdbc:mysql://54.180.38.87:3306/study?verifyServerCertificate=false&useSSL=false",
				"ehk0429",
				"ehk0429"
				)) {
			log.info(con);
			System.out.println(con);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
}
