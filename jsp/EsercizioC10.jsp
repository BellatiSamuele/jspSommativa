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
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "SELECT DISTINCT citta FROM Appartamento ORDER BY citta";
			Statement stmt = connection.createStatement();
			
			ResultSet rs = stmt.executeQuery(sql);
	            
	        while(rs.next()){
	            String citta = rs.getString("citta");
	            out.println("<ul><li><input type='radio' name='citta' value=" + rs.getString("citta") + ">" + citta + "</li></ul>");
	           }
	        connection.close();
        %>
    </body>
</html>