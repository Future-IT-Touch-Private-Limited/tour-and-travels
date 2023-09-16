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

public partial class admin_add_review : System.Web.UI.Page
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
            SqlCommand cmd2 = new SqlCommand("Insert into reviews (title,review,review_by,designation,review_star) values(@title,@review,@review_by,@designation,@review_star)", con2);
            cmd2.Parameters.AddWithValue("@title", title.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@review", review.Text.ToString());
            cmd2.Parameters.AddWithValue("@review_by", review_by.Text.ToString());
            cmd2.Parameters.AddWithValue("@designation", designation.Text.ToString());
            cmd2.Parameters.AddWithValue("@review_star", review_star.Text.ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            Response.Redirect("reviews.aspx");
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
        }
    }

}