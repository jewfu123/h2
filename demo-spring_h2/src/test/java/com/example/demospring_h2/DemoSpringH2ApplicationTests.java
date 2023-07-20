package com.example.demospring_h2;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import java.sql.*;

@SpringBootTest
class DemoSpringH2ApplicationTests {

	@Test
	void contextLoads() {
	}

	@Test
	public void testDatabaseNoMem() throws SQLException {
	    testDatabase("jdbc:h2:keycloak");
	}
	@Test
	public void testDatabaseMem() throws SQLException {
	    testDatabase("jdbc:h2:mem:keycloak");
	}

	private void testDatabase(String url) throws SQLException {
	    Connection connection= DriverManager.getConnection(url);
	    Statement s=connection.createStatement();
	    try {
	    	s.execute("select * from test");
	    } catch(SQLException sqle) {
	        System.out.println("Table not found, not dropping");
	    }
//	    s.execute("CREATE TABLE PERSON (ID INT PRIMARY KEY, FIRSTNAME VARCHAR(64), LASTNAME VARCHAR(64))");
//	    PreparedStatement ps=connection.prepareStatement("select * from PERSON");
//	    ResultSet r=ps.executeQuery();
//	    if(r.next()) {
//	        System.out.println("data?");
//	    }
//	    r.close();
//	    ps.close();
	    s.close();
	    connection.close();
	}


}
