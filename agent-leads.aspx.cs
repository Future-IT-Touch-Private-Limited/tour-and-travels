using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_agent_leads : System.Web.UI.Page
{
    string EncryptionKey = "@#future#@touch_!123~!admin@@";
    string EncryptionKey2 = "future@123@adm";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    PagedDataSource pgsource = new PagedDataSource();
    int findex, lindex;
    DataRow dr;
    DataTable GetData()
    {
        DataTable dtable = new DataTable();
        SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        string strcon = "select * from leads where agent_username_3des=@agent_username_3des ORDER BY sr DESC";
        SqlCommand cmd = new SqlCommand(strcon, con);
        cmd.Parameters.AddWithValue("@agent_username_3des", EncDec.EncryptString(Request.QueryString["agent_id"].ToString(), EncryptionKey));
        //cmd.Parameters.AddWithValue("@reffer_by_3des", Request.Cookies["agun"].Value.ToString());
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(dtable);
        con.Close();
        con.Dispose();
        return dtable;
    }

    private void BindDataList()
    {
        //try
        //{
        DataTable dt = GetData();
        pgsource.DataSource = dt.DefaultView;
        pgsource.AllowPaging = true;
        pgsource.PageSize = 10;
        pgsource.CurrentPageIndex = CurrentPage;
        ViewState["totpage"] = pgsource.PageCount;
        lblpage.Text = "Page " + (CurrentPage + 1) + " of " + pgsource.PageCount;
        lnkPrevious.Enabled = !pgsource.IsFirstPage;
        lnkNext.Enabled = !pgsource.IsLastPage;
        lnkFirst.Enabled = !pgsource.IsFirstPage;
        lnkLast.Enabled = !pgsource.IsLastPage;
        Repeater1.DataSource = pgsource;
        Repeater1.DataBind();
        doPaging();
        RepeaterPaging.ItemStyle.HorizontalAlign = HorizontalAlign.Center;
        //}
        //catch (Exception ex)
        //{

        //}
    }

    private void doPaging()
    {
        //try
        //{
        DataTable dt = new DataTable();
        dt.Columns.Add("PageIndex");
        dt.Columns.Add("PageText");
        findex = CurrentPage - 5;
        if (CurrentPage > 5)
        {
            lindex = CurrentPage + 5;
        }
        else
        {
            lindex = 10;
        }
        if (lindex > Convert.ToInt32(ViewState["totpage"]))
        {
            lindex = Convert.ToInt32(ViewState["totpage"]);
            findex = lindex - 10;
        }
        if (findex < 0)
        {
            findex = 0;
        }
        for (int i = findex; i < lindex; i++)
        {
            DataRow dr = dt.NewRow();
            dr[0] = i;
            dr[1] = i + 1;
            dt.Rows.Add(dr);
        }
        RepeaterPaging.DataSource = dt;
        RepeaterPaging.DataBind();
        //}
        //catch (Exception ex)
        //{
        //}
    }

    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
            {
                return 0;
            }
            else
            {
                return ((int)ViewState["CurrentPage"]);
            }
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }
    protected void lnkFirst_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage = 0;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkLast_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage = (Convert.ToInt32(ViewState["totpage"]) - 1);
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkPrevious_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage -= 1;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void lnkNext_Click(object sender, EventArgs e)
    {
        //try
        //{
        CurrentPage += 1;
        BindDataList();
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void RepeaterPaging_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //try
        //{
        if (e.CommandName.Equals("newpage"))
        {
            CurrentPage = Convert.ToInt32(e.CommandArgument.ToString());
            BindDataList();
        }
        //}
        //catch (Exception ex)
        //{
        //}
    }
    protected void RepeaterPaging_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        //try
        //{
        LinkButton lnkPage = (LinkButton)e.Item.FindControl("Pagingbtn");
        if (lnkPage.CommandArgument.ToString() == CurrentPage.ToString())
        {
            lnkPage.Enabled = false;
            lnkPage.BackColor = System.Drawing.Color.FromName("#FFCC01");
        }
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
    }

    public void all_count()
    {
        try
        {
            SqlConnection con01 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            string myScalarQuery01 = "select count(*) from leads where agent_username_3des=@agent_username_3des";
            SqlCommand myCommand01 = new SqlCommand(myScalarQuery01, con01);
            myCommand01.Parameters.AddWithValue("@agent_username_3des",EncDec.EncryptString(Request.QueryString["agent_id"].ToString(),EncryptionKey));
            myCommand01.Connection.Open();
            int countuser01 = (int)myCommand01.ExecuteScalar();
            con01.Close();
            con01.Dispose();
            total_lbl.Text = countuser01.ToString();
        }
        catch (Exception ex)
        {
            total_lbl.Text = "0";
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                BindDataList();
                all_count();
            }
            catch (Exception ex)
            {
            }
        }
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        Label agent_username_3des = (Label)e.Item.FindControl("agent_username_3des");
        Label status_lbl = (Label)e.Item.FindControl("status_lbl");
        try
        {
            agent_username_3des.Text = EncDec.DecryptString(agent_username_3des.Text, EncryptionKey);
        }
        catch (Exception ex)
        { }
        if (status_lbl.Text == "Submitted")
        {
            status_lbl.ForeColor = System.Drawing.Color.Black;
        }
        if (status_lbl.Text == "Read")
        {
            status_lbl.ForeColor = System.Drawing.Color.Blue;
        }
        if (status_lbl.Text == "Pending")
        {
            status_lbl.ForeColor = System.Drawing.Color.DarkViolet;
        }
        if (status_lbl.Text == "Approved")
        {
            status_lbl.ForeColor = System.Drawing.Color.Green;
        }
        if (status_lbl.Text == "Cancelled")
        {
            status_lbl.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void filter_between_date_btn_Click(object sender, EventArgs e)
    {
        try
        {
            string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
            string sqlQuery = "SELECT * FROM leads where (query_generated_date>= @start_date and query_generated_date<=@end_date) and agent_username_3des=@agent_username_3des order by sr desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sqlQuery, connection);
            command.Parameters.AddWithValue("@start_date", start_date.Text.Replace("-", ""));
            command.Parameters.AddWithValue("@end_date", end_date.Text.Replace("-", ""));
            command.Parameters.AddWithValue("@agent_username_3des", EncDec.EncryptString(Request.QueryString["agent_id"].ToString(),EncryptionKey));
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            connection.Close();
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }
        catch (Exception ex)
        { }
    }

    protected void searchbtn_Click(object sender, EventArgs e)
    {
        try
        {
            string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
            string sqlQuery = "SELECT * FROM leads where (name like '%'+@searchtxt+'%' or mobile like '%'+@searchtxt+'%' or email like '%'+@searchtxt+'%' or package like '%'+@searchtxt+'%' or journey_date like '%'+@searchtxt+'%' or return_date like '%'+@searchtxt+'%' or locations_to_explore like '%'+@searchtxt+'%' or status like '%'+@searchtxt+'%' or lead_final_status like '%'+@searchtxt+'%') and agent_username_3des=@agent_username_3des order by sr desc";
            SqlConnection connection = new SqlConnection(connectionString);
            SqlCommand command = new SqlCommand(sqlQuery, connection);
            command.Parameters.AddWithValue("@searchtxt", searchtxt.Text.Trim());
            command.Parameters.AddWithValue("@agent_username_3des", EncDec.EncryptString(Request.QueryString["agent_id"].ToString(), EncryptionKey));
            SqlDataAdapter adapter = new SqlDataAdapter(command);
            DataTable dataTable = new DataTable();
            adapter.Fill(dataTable);
            connection.Close();
            Repeater1.DataSource = dataTable;
            Repeater1.DataBind();
        }
        catch (Exception ex)
        { }
    }

}