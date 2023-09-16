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

public partial class admin_vehicles : System.Web.UI.Page
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
            SqlCommand cmd2 = new SqlCommand("Insert into vehicles (brand_name,model_name,fuel_type,vehicle_model_year,regd_number,chassis_number,engine_no,seater,vehicle_type) values(@brand_name,@model_name,@fuel_type,@vehicle_model_year,@regd_number,@chassis_number,@engine_no,@seater,@vehicle_type)", con2);
            cmd2.Parameters.AddWithValue("@brand_name", brand_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@model_name", model_name.Text.ToString());
            cmd2.Parameters.AddWithValue("@fuel_type", fuel_type.Text.ToString());
            cmd2.Parameters.AddWithValue("@vehicle_model_year", vehicle_model_year.Text.ToString());
            cmd2.Parameters.AddWithValue("@regd_number", regd_number.Text.Trim().ToUpper().ToString());
            cmd2.Parameters.AddWithValue("@chassis_number", chassis_number.Text.ToString());
            cmd2.Parameters.AddWithValue("@engine_no", engine_no.Text.ToString());
            cmd2.Parameters.AddWithValue("@seater", seater.Text.ToString());
            cmd2.Parameters.AddWithValue("@vehicle_type", vehicle_type.Text.ToString());
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            Response.Redirect("vehicles.aspx");
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
        }
    }

}