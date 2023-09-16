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

public partial class admin_view_vehicle : System.Web.UI.Page
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
        SqlCommand myCommand = new SqlCommand("select * from vehicles where sr=@sr", con1);
        myCommand.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
        myReader = myCommand.ExecuteReader();
        if (myReader.HasRows)
        {
            while (myReader.Read())
            {
                brand_name.Text = myReader["brand_name"].ToString();
                model_name.Text = myReader["model_name"].ToString();
                fuel_type.Text = myReader["fuel_type"].ToString();
                vehicle_model_year.Text = myReader["vehicle_model_year"].ToString();
                regd_number.Text = myReader["regd_number"].ToString();
                chassis_number.Text = myReader["chassis_number"].ToString();
                engine_no.Text = myReader["engine_no"].ToString();
                seater.Text = myReader["seater"].ToString();
                vehicle_type.Text = myReader["vehicle_type"].ToString();
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
            SqlCommand cmd2 = new SqlCommand("update vehicles set brand_name=@brand_name,model_name=@model_name,fuel_type=@fuel_type,vehicle_model_year=@vehicle_model_year,chassis_number=@chassis_number,engine_no=@engine_no,seater=@seater,vehicle_type=@vehicle_type where sr=@sr", con2);
            cmd2.Parameters.AddWithValue("@brand_name", brand_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@model_name", model_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@fuel_type", fuel_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@vehicle_model_year", vehicle_model_year.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@chassis_number", chassis_number.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@engine_no", engine_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@seater", seater.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@vehicle_type", vehicle_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
            con2.Open();
            int count = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            successdiv.Visible = true;
            successlbl.Text = "Vehicle Details Updated Sucessfully";
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
            using (SqlConnection connection = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2)))
            {
                connection.Open();
                string deleteQuery = "DELETE FROM vehicles WHERE sr=@sr";
                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    command.Parameters.AddWithValue("@sr", Request.QueryString["sr"].ToString());
                    command.ExecuteNonQuery();
                }
                connection.Close();
            }
            Response.Redirect("vehicles.aspx");
        }
        catch (Exception ex)
        {
        }

    }

}
