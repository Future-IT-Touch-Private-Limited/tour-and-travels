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

public partial class admin_add_driver : System.Web.UI.Page
{
    string EncryptionKey = "@#future#@touch_!123~!admin@@";
    string EncryptionKey2 = "future@123@adm";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    public void fillDetails()
    {
        
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDetails();
        }
    }

    protected void add_btn_Click(object sender, EventArgs e)
    {

        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("Insert into drivers (driver_name,primary_mobile,secondary_mobile,email,address,city,state,country,account_date,pan_card_no,aadhar_card_no,dl_no,pan_card_img,aadhar_card_img,dl_img,driver_type,status) values(@driver_name,@primary_mobile,@secondary_mobile,@email,@address,@city,@state,@country,@account_date,@pan_card_no,@aadhar_card_no,@dl_no,@pan_card_img,@aadhar_card_img,@dl_img,@driver_type,@status)", con2);
            cmd2.Parameters.AddWithValue("@driver_name", driver_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@primary_mobile", primary_mobile.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@secondary_mobile", secondary_mobile.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@email", email.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@address", address.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@city", city.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@state", state.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@country", country.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@account_date", indianTime.ToString("dd MMM yyyy hh:mm:ss tt"));
            cmd2.Parameters.AddWithValue("@pan_card_no", pan_card_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@aadhar_card_no", aadhar_card_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@dl_no", dl_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@pan_card_img", "");
            cmd2.Parameters.AddWithValue("@aadhar_card_img", "");
            cmd2.Parameters.AddWithValue("@dl_img", "");
            cmd2.Parameters.AddWithValue("@driver_type", driver_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@status", "");
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            Response.Redirect("drivers.aspx");
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
        }
    }

}