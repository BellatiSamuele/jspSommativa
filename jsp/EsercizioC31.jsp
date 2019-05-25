<!-- BELLATI SAMUELE -->
<%@ page contentType="text/html"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*,java.text.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html>
    <head>
        <title>AIRBNB</title>
    </head>
    <body>
     <% 
     %>
        <% 
            String id = request.getParameter("list");
            String dataI = request.getParameter("dataI");
            String dataF = request.getParameter("dataF");
        
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "SELECT COUNT(IDAppartamento) AS cont FROM Affitto WHERE IDAppartamento = ? AND ((dataCheckIn <= ?) AND (dataCheckOut >= ?))";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, dataF);
			pstmt.setString(3, dataI);
			
			ResultSet rs = pstmt.executeQuery();
	            
	        rs.next();
	        
	        if(rs.getInt("cont") == 0){
	            out.println("libero");
	           }else{
	              out.println("occupato"); 
	           }
	        connection.close();
        %>
    </body>
</html>