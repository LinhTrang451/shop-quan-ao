<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SE1436_Group4_Assigment.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="~/Styles/login1.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="wrapper">
        <div class="title">
            Login Form</div>
        <form action="#" runat="server">
            <div class="field">
                <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                <label>Email Address</label>
            </div>
            <div class="field">
                <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                <label>Password</label>
            </div>
            <div class="content">
                <div class="checkbox">
                    <asp:CheckBox ID="CheckBox1" runat="server" />
                    <label for="remember-me">Remember me</label>
                </div>
                <div class="pass-link">
                    <a href="#">Forgot password?</a></div>
            </div>
            <div class="field">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click"/>
            </div>
            <div class="signup-link">
                Not a member? <a href="CreateAccount.aspx">Signup now</a></div>
            <div class="signup-link">
                <a href="Home.aspx">Back To Home</a></div>
        </form>
    </div>
</body>
</html>
