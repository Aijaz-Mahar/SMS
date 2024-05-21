<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Servlet onClick Example</title>
        <style type="text/css">
            .paddingBtm {
                padding-bottom: 12px;
            }
        </style>
        <script type="text/javascript">
            function callServlet() {
                document.forms[0].action = "Welcome";
                document.forms[0].submit();
            }
             function callServlet1() {
                document.forms[1].action = "Welcome";
                document.forms[1].submit();
            }
        </script>
    </head>
    <body>
        <center>
            <h2>Servlet onClick Example</h2>
            <form id="loginFormId" name="loginForm" method="post">
                <div id="usernameDiv" class="paddingBtm">
                    <span id="user">Username: </span><input type="text" name="username" />
                </div>
                <div id="loginBtn">
                    <input id="btn" type="submit" value="Login" onclick="callServlet();" />
                </div>
            </form>
            
            <form id="loginFormId1" name="loginForm1" method="post">
                <div id="usernameDiv" class="paddingBtm">
                    <span id="user">Username: </span><input type="text" name="username" />
                </div>
                <div id="loginBtn">
                    <input id="btn" type="submit" value="Login" onclick="callServlet1();" />
                </div>
            </form>
        </center>
    </body>
</html>