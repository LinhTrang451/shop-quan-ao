<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateAccount.aspx.cs" Inherits="SE1436_Group4_Assigment.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Styles/Register.css" rel="stylesheet" />
</head>
<body>
    <form runat="server">

        <h1>Sign Up</h1>

        <fieldset>
            <legend><span class="number">1</span>Your basic info</legend>
            <label for="name">Name:</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            <label for="mail">Account:</label>
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>

            <label for="password">Password:</label>
            <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>

            <label>Gender:</label>
            <asp:RadioButton ID="rdbMale" runat="server" GroupName="gender" /><label for="under_13" class="light">Male</label>
            <asp:RadioButton ID="rdbFemale" runat="server"  GroupName="gender"/><label for="over_13" class="light">Female</label>
        </fieldset>

        <fieldset>
            <legend><span class="number">2</span>Your profile</legend>
            <label for="password">Ngay Sinh:</label>
            <asp:TextBox ID="txtDate"  runat="server"></asp:TextBox>
            <label for="password">Dia chi</label>
            <asp:TextBox ID="txtAddress"  runat="server"></asp:TextBox>
            <label for="password">Sdt</label>
            <asp:TextBox ID="txtSdt"  runat="server"></asp:TextBox>
        </fieldset>
        <asp:Button ID="btnSingup" CssClass="btn" runat="server" Text="Register" OnClick="btnSingup_Click" />
    </form>
</body>
</html>
