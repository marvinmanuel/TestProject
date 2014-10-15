<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="WEB-INF/tld/ns.tld" prefix="ns" %>
 
<!-- Subversion $Revision: 2120 $ by $Author: Marvin.Manuel $ on $Date: 2013-04-18 14:13:57 +0800 (Thu, 18 Apr 2013) $ -->

<%
response.setHeader("Cache-Control","no-cache"); //HTTP 1.1
response.setHeader("Pragma","no-cache"); //HTTP 1.0
response.setDateHeader ("Expires", 0); //prevents caching at the proxy server
// response.sendRedirect("Default2Top.html");
// response.sendRedirect("newspage.jsp?txtLogin=kaye&txtPassword=manila");
%>
<html>
	<head>
		<title>DealWatch</title>
		<script type="text/javascript">
		
			function login() {
				// calculate offset for the news timestamp
				var oDate = new Date();
				var intOffset = oDate.getTimezoneOffset() * -1;
				
				// calculate cookie expiration
				var exp = new Date();
				var oneYearFromNow = exp.getTime() + (365 * 24 * 60 * 60 * 1000);
				exp.setTime(oneYearFromNow);
		 	
				var exp2 = new Date();
				var oneMinute = exp2.getTime() + (60 * 1000);
				exp2.setTime(oneMinute);   	
						
				// save userid in cookies
				document.cookie= "CL=" + window.document.frmIndex.txtLogin.value + "; expires=" + exp.toGMTString();
				document.cookie= "Method=" + "POST" + "; expires=" + exp2.toGMTString();						
		  		document.cookie= "log=" + "yes" + "; expires=" + exp.toGMTString();				
			
				// submit to newspage
				document.frmIndex.action = "newspage.jsp?offset=" + intOffset;
				document.frmIndex.method = "post";
				document.frmIndex.submit();			
			}

			function checkLoginDetails() {
				if (document.frmIndex.txtLogin.value == "") {
					// if no account details, submit to processor to get
					// username and password
					document.frmIndex.action = "processor";
					document.frmIndex.method = "post";
					document.frmIndex.submit();
				} else {
					login();
				}
			}

		</script>
	</head>
	<body onload="checkLoginDetails()">
		<form name="frmIndex" id="frmIndex">
			<input type="hidden" name="txtLogin" id="txtLogin" value="${txtLogin}"/>
			<input type="hidden" name="txtPassword" id="txtPassword" value="${txtPassword}"/>
			
			<!-- Eikon User Details -->
			<input type="hidden" name="txtUUID" id="txtUUID" value="${txtUUID}"/>
			<input type="hidden" name="txtEmailAdd" id="txtEmailAdd" value="${txtEmailAdd}"/>
			<input type="hidden" name="txtCompany" id="txtCompany" value="${txtCompany}"/>
			<input type="hidden" name="txtCountry" id="txtCountry" value="${txtCountry}"/>
			<input type="hidden" name="txtLanguage" id="txtLanguage" value="${txtLanguage}"/>
			<input type="hidden" name="txtFirstName" id="txtFirstName" value="${txtFirstName}"/>
			<input type="hidden" name="txtLastName" id="txtLastName" value="${txtLastName}"/>
			<input type="hidden" name="txtTheme" id="txtTheme" value="${txtTheme}"/>
			<input type="hidden" name="txtVariant" id="txtVariant" value="${txtVariant}"/>
		</form>
	</body>
</html>