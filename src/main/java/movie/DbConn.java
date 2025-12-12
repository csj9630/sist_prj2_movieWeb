package movie;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConn {
	private static DbConn dbCon;
	private String jndiName;
	
	private DbConn() {
		
	}
	
	public static DbConn getInstance(String jndiName) {
		if(dbCon==null) {
			dbCon=new DbConn();
			dbCon.jndiName=jndiName;
		}//end if
		
		return dbCon;
	}
	
	public Connection getConn() throws SQLException {
		Connection con=null;
		//1.JNDI 사용객체 생성
		try {
			Context ctx=new InitialContext();
			//2.DBCP DataSource 얻기
			DataSource ds=(DataSource)ctx.lookup("java:comp/env/"+jndiName);
			//3.DataSource에서 Connection 얻기 
			con=ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		}
		
		return con;
	}//getConn
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		try {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		} finally {
			if(con!=null) {con.close();}
		}//end finally
	}//dbClose
	
}//class