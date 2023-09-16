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

public partial class admin_view_review : System.Web.UI.Page
{
    string EncryptionKey = "@#future#@touch_!123~!admin@@";
    string EncryptionKey2 = "future@123@adm";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    public void fillDetails()
    {
        //try
        //{
        SqlConnection con1 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
        DataTable dt = new DataTable();
        con1.Open();
        SqlDataReader myReader = null;
        SqlCommand myCommand = new SqlCommand("select * from reviews where sr=@sr", con1);
        myCommand.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                title.Text = myReader["title"].ToString();
                review.Text = myReader["review"].ToString();
                review_by.Text = myReader["review_by"].ToString();
                designation.Text = myReader["designation"].ToString();
                review_star.Text = myReader["review_star"].ToString();
            }
        }
        else
        {
            //Response.Redirect("dashboard");
        }
        con1.Close();
        con1.Dispose();
        myReader.Close();
        //}
        //catch (Exception ex)
        //{
        //    //Response.Write(ex.Message);
        //}
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillDetails();
        }
    }

    protected void update_btn_Click(object sender, EventArgs e)
    {
        try
        {
            successdiv.Visible = false;
            errordiv.Visible = false;
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("update reviews set title=@title,review=@review,review_by=@review_by,designation=@designation,review_star=@review_star where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@title", title.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@review", review.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@review_by", review_by.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@designation", designation.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@review_star", review_star.Text.Trim().ToString());
            
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            successdiv.Visible = true;
            successlbl.Text = "Review Details Updated Sucessfully";
            errordiv.Visible = false;
            successdiv.Focus();
            fillDetails();
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
            errordiv.Focus();
        }
    }


    protected void deletebtn_Click(object sender, EventArgs e)
    {
        try
        {
            // Step 1: Establish a connection to the database
            using (SqlConnection connection = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2)))
            {
                connection.Open();
                string deleteQuery = "DELETE FROM reviews WHERE sr=@sr";
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            Response.Redirect("reviews.aspx");
        }
        catch (Exception ex)
        {
        }


    }

}
