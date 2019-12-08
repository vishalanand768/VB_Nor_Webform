Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

Public Class VBWebForm1
    Inherits System.Web.UI.Page
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("xyz").ConnectionString)

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bindgrid()
    End Sub

    Protected Sub sbtn_Click(sender As Object, e As EventArgs)
        con.Open()
        Dim cmd As New SqlCommand("insert into VBHW201119(Name,Age,Salary)values('" + txtname.Text + "','" + txtage.Text + "','" + txtsalary.Text + "')", con)
        cmd.ExecuteNonQuery()
        con.Close()
        bindgrid()
    End Sub

    Public Sub bindgrid()

        con.Open()
        Dim cmd As New SqlCommand("select * from VBHW201119", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        con.Close()
        grd.DataSource = (dt)
        grd.DataBind()
    End Sub


    Protected Sub grd_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        con.Open()
        Dim cmd As New SqlCommand("delete from VBHW201119 where id = '" + e.CommandArgument + "'", con)
        cmd.ExecuteNonQuery()
        con.Close()
        bindgrid()
    End Sub
End Class