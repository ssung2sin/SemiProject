<%@page import="org.json.simple.JSONObject"%>
<%@page import="mail.Mail"%>
<%
	String recipient1=request.getParameter("recipient1");
	String recipient2=request.getParameter("recipient2");
	
	String recipient=recipient1+"@"+recipient2;
	String codenumber=request.getParameter("codenumber");
	System.out.println(codenumber);
	if(codenumber==null){
		int [] ranNum=new int[4];
		for(int i=0;i<ranNum.length;i++){
		       ranNum[i]=(int)(Math.random()*10);
		    }
		    
		    codenumber=ranNum[0]+""+ranNum[1]+""+ranNum[2]+""+ranNum[3];
	}
	
	Mail.send(recipient, codenumber);
	
	JSONObject ob=new JSONObject();
	
	ob.put("ranNum", codenumber);
%>
<%=ob.toString() %>