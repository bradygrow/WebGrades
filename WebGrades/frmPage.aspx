<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmPage.aspx.cs" Inherits="WebGrades.frmPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #frmPage {
            height: 662px;
            z-index: 1;
            left: 10px;
            top: 15px;
            position: absolute;
            width: 1217px;
        }
    </style>
</head>
<body style="height: 741px">
    <form id="frmPage" runat="server">
            <asp:Label ID="Label1" runat="server" style="position: relative" Text="Username"></asp:Label>
        <div style="z-index: 1; left: 10px; top: 15px; position: absolute; height: 19px; width: 1192px">
        </div>
        <asp:TextBox ID="txtUsername" runat="server" style="position: relative; top: 36px; left: -61px; height: 21px;"></asp:TextBox>
        
        <asp:Label ID="Label2" runat="server" style="position: relative" Text="Password"></asp:Label>
        
        <asp:TextBox ID="txtPassword" runat="server" style="position: relative; top: 39px; left: -58px;"></asp:TextBox>
        <asp:Button ID="butLogin" runat="server" AutoPostBack="True" style="position: relative; top: 36px; left: -11px; height: 25px;" Text="Login" OnClick="butLogin_Click" />
        <br />
        <br />
        <p>
            &nbsp;</p>
        <p>
        <asp:Label ID="lbllogin" runat="server" style="position: relative"></asp:Label>
        </p>
        <asp:TextBox ID="txtSearch" style="position: relative; top: 42px; left: 124px; height: 17px;" runat="server"></asp:TextBox>
        <hr />
        <asp:Label ID="lblSearchInfo" runat="server" Text="Search by SID"></asp:Label>
         <asp:Button ID="butSearch" runat="server" style="position: relative; top: 2px; left: 213px; height: 20px;" Text="Search" OnClick="butSearch_Click" />



            
       


    <hr />
            <asp:DropDownList ID="ddlclasses" style="position: relative; top: 90px; left: 12px;" runat="server" OnSelectedIndexChanged="ddlclasses_SelectedIndexChanged">
            </asp:DropDownList>
            <asp:Label ID="lblsearchedStudent" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="gridGradeSummary" AutoGenerateColumns="true" style="position: relative; top: 117px; left: 14px;" runat="server">
            </asp:GridView>



            <asp:Button ID="butSubmit" style="position: relative; top: 6px; left: 474px; height: 75px; width: 66px;" runat="server" Text="Submit" OnClick="butSubmit_Click" />



            <asp:GridView ID="gridgradedetail" style="position: relative; top: 162px; left: 87px;" runat="server">
            </asp:GridView>



    </form>
    </body>
</html>
