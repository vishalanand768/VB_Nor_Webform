<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="VBWebForm1.aspx.vb" Inherits="VB_Nor_Webform.VBWebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"/> 

     <script type ="text/javascript">
         function validation() {
             var dabba = "";
             dabba += checkName();
             dabba += checkAge();
             dabba += checkSalary();
             if (dabba == "") {
                 return true;
             }
             else {
                 alert(dabba);
                 return false;
             }
         }
         {
             function checkName() {
                 var TB = document.getElementById('txtname');
                 if (TB.value == "") {
                     return 'Plz enter your name!!\n';
                 }
                 else {
                     return "";
                 }
             }
             function checkAge() {
                 var TB = document.getElementById('txtage');
                 if (TB.value == "") {
                     return 'Plz enter your age!!\n';

                 }
                 else {
                     return "";
                 }
             }
             function checkSalary() {
                 var TB = document.getElementById('txtsalary');
                 if (TB.value == "") {
                     return 'Plz enter your salary!!\n';
                 }
                 else {
                     return "";
                 }
             }

         }
    </script>


    <title></title>
</head>
<body>
    <form id="form1" runat="server" class ="ui form">
    <div class="field">
           <table>
               <tr>
                   <td>Name : </td>
                   <td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td>
               </tr>

                <tr>
                   <td>Age : </td>
                   <td><asp:TextBox ID="txtage" runat="server"></asp:TextBox></td>
               </tr>

                <tr>
                   <td>Salary : </td>
                   <td><asp:TextBox ID="txtsalary" runat="server"></asp:TextBox></td>
               </tr>

                <tr>
                   <td></td>
                   <td><asp:Button ID="sbtn" runat="server" Text="Save" OnClientClick="return validation()" OnClick="sbtn_Click" class="ui button"></asp:Button></td>
               </tr>

                <tr>
                   <td></td>
                   <td><asp:GridView ID="grd" runat="server" OnRowCommand="grd_RowCommand" AutoGenerateColumns="false">
                          <Columns>
                          <asp:TemplateField HeaderText="EmpId">
                              <ItemTemplate>
                                  <%#Eval("Id")%>
                              </ItemTemplate>
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="EmpName">
                              <ItemTemplate>
                                  <%#Eval("Name")%>
                              </ItemTemplate>
                          </asp:TemplateField>

                          <asp:TemplateField HeaderText="Age">
                              <ItemTemplate>
                                  <%#Eval("Age")%>
                              </ItemTemplate>
                          </asp:TemplateField>

                              <asp:TemplateField HeaderText="Salary(Rs.)">
                                  <ItemTemplate>
                                      <%#Eval("Salary")%>
                                  </ItemTemplate>
                              </asp:TemplateField>

                           <asp:TemplateField HeaderText="Action">
                              <ItemTemplate>
                                  <asp:linkButton ID="btndelete" runat="server"  Text="Delete" CommandArgument='<%#Eval("Id")%>'></asp:linkButton> /
                                      <asp:LinkButton ID="btnEdit" runat="server" Text="Edit"></asp:LinkButton>
                                  
                              </ItemTemplate>
                          </asp:TemplateField>

                        </Columns>
                       </asp:GridView></td>
               </tr>
           </table>
    </div>
    </form>
</body>
</html>
