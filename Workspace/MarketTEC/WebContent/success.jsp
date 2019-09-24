<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="553838659224-v4i0ehjeblhe4v10bh38cj52oi6ihnrd.apps.googleusercontent.com">



<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<script src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
<!-- 
<script src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
 -->
<script src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script src="js/codigos.js" type="text/javascript"></script>
<%
	String id = (String) request.getParameter("id");
	String name = (String) request.getParameter("name");
	String email = (String) request.getParameter("email");
%><br>
<img id="myImg">
<%=id%>
<br>
<%=name%>
<br>
<%=email%>
<br>

<button onclick="myFunction()">Sign Out</button>

<script>
	function myFunction() {
		gapi.auth2.getAuthInstance().disconnect();
		//location.reload();

		window.location.href = 'login.jsp';
	}
</script>

