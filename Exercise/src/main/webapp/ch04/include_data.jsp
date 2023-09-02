<%
	int num = Integer.parseInt(request.getParameter("num"));
	for (int i = 1; i <= 9; i++) {
		out.print(num + "*" + i + "=" + num * i + "<br>");
}
%>
