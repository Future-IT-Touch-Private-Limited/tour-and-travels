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

public partial class admin_add_lead : System.Web.UI.Page
{
    string EncryptionKey = "@#future#@touch_!123~!admin@@";
    string EncryptionKey2 = "future@123@adm";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }

    protected void add_btn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("Insert into leads (name,mobile,email,package,pickup_point,journey_date,return_date,locations_to_explore,agent_username_3des,agent_id,username_3des,lead_generated_time,subject,message,status,query_generated_date,note,lead_final_status,booking_id,total_travlers) values(@name,@mobile,@email,@package,@pickup_point,@journey_date,@return_date,@locations_to_explore,@agent_username_3des,@agent_id,@username_3des,@lead_generated_time,@subject,@message,@status,@query_generated_date,@note,@lead_final_status,@booking_id,@total_travlers)", con2);
            cmd2.Parameters.AddWithValue("@name", name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@mobile", mobile.Text.ToString());
            cmd2.Parameters.AddWithValue("@email", email.Text.ToString());
            cmd2.Parameters.AddWithValue("@package", "");
            cmd2.Parameters.AddWithValue("@pickup_point", pickup_point.Text.ToString());
            cmd2.Parameters.AddWithValue("@journey_date", journey_date.Text.ToString());
            cmd2.Parameters.AddWithValue("@return_date", return_date.Text.ToString());
            cmd2.Parameters.AddWithValue("@locations_to_explore", "");
            cmd2.Parameters.AddWithValue("@agent_username_3des", "");
            cmd2.Parameters.AddWithValue("@agent_id", "");
            cmd2.Parameters.AddWithValue("@username_3des", "");
            cmd2.Parameters.AddWithValue("@lead_generated_time", indianTime.ToString("dd MMM yyyy hh:mm:ss tt"));
            cmd2.Parameters.AddWithValue("@subject", "");
            cmd2.Parameters.AddWithValue("@message", "");
            cmd2.Parameters.AddWithValue("@status", "");
            cmd2.Parameters.AddWithValue("@query_generated_date", indianTime.ToString("yyyyMMdd"));
            cmd2.Parameters.AddWithValue("@note", note.Text.ToString());
            cmd2.Parameters.AddWithValue("@lead_final_status", "Pending");
            cmd2.Parameters.AddWithValue("@booking_id", "");
            cmd2.Parameters.AddWithValue("@total_travlers", total_travlers.Text.ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            Response.Redirect("leads.aspx");
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
        }
    }

}