<%@page import="mail.Mail"%>
<%
	String recipient1=request.getParameter("recipient1");
	String recipient2=request.getParameter("recipient2");
	
	String recipient=recipient1+"@"+recipient2;
	String codenumber=request.getParameter("codenumber");
	
	Mail.Send(recipient, codenumber);

%>