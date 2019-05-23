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
            String citta = request.getParameter("citta");
        
            String connectionUrl = "jdbc:sqlserver://213.140.22.237\\SQLEXPRESS:1433;databaseName=XFactor;user=bellati.samuele;password=xxx123#";

            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            Connection connection = DriverManager.getConnection(connectionUrl);
			
			//preparedStatement
			String sql = "SELECT nome, prezzoPerNotte FROM Appartamento WHERE citta = ? ORDER BY prezzoPerNotte DESC ";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setString(1, citta);
			ResultSet rs = pstmt.executeQuery();
	            
	            
	         %>
	        <form method="post" action="/jsp/EsercizioC31.jsp">
            <%
            
	            
	        if(rs.next()){
	            out.println("<select name'citta'>");
    	            while(rs.next()){
    	                out.println("<option value'" + rs.getString("nome") + "'>nome: "+ rs.getString("nome") + " - prezzo per notte: " + rs.getString("prezzoPerNotte") + "</option>");
                    }
                out.println("</select><br>");
                
                out.println("<input type='date' name='dataI' required/><br>");
                out.println("<input type='date' name='dataF' required/><br>");
                out.println("<input type='submit' value='Invia'/>");
	           }
	           
	        %> 
	        </form>
	        <%
	        connection.close();
        %>
    </body>
</html>