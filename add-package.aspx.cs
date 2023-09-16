using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_add_package : System.Web.UI.Page
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

    public static string CreateSlug(string input)
    {
        if (string.IsNullOrEmpty(input))
            return string.Empty;
        input = input.ToLowerInvariant().Trim();
        input = Regex.Replace(input, @"[^a-z0-9\s-]", string.Empty);
        input = Regex.Replace(input, @"\s+", "-").Trim();
        input = Regex.Replace(input, @"-+", "-");
        return input;
    }

    protected void addbtn_Click(object sender, EventArgs e)
    {
        //try
        //{
            SqlConnection con = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            con.Open();
            SqlCommand cmdd = new SqlCommand("select * from packages where package_slug=@package_slug", con);
            cmdd.Parameters.AddWithValue("@package_slug", CreateSlug(package_title.Text.Trim().ToString()));
            SqlDataReader reader = cmdd.ExecuteReader();
            if (reader.HasRows)
            {
                con.Close();
                con.Dispose();
                reader.Close();
                //errordiv.Visible = true;
                //errorlbl.Text = "Package already exist";
            }
            else
            {
                SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
                SqlCommand cmd2 = new SqlCommand("Insert into packages (location,package_title,package_slug,tour_locations,tour_time_period,package_price,pickup_location,package_added_date,status,package_image,body) values(@location,@package_title,@package_slug,@tour_locations,@tour_time_period,@package_price,@pickup_location,@package_added_date,@status,@package_image,@body)", con2);
                cmd2.Parameters.AddWithValue("@location", location.Text.Trim().ToString());
                cmd2.Parameters.AddWithValue("@package_title", package_title.Text.ToString());
                cmd2.Parameters.AddWithValue("@package_slug", CreateSlug(package_title.Text.Trim().ToString()));
                cmd2.Parameters.AddWithValue("@tour_locations", tour_locations.Text.ToString());
                cmd2.Parameters.AddWithValue("@tour_time_period", tour_time_period.Text.ToString());
                cmd2.Parameters.AddWithValue("@package_price", package_price.Text.ToString());
                cmd2.Parameters.AddWithValue("@pickup_location", pickup_location.Text.ToString());
                cmd2.Parameters.AddWithValue("@package_added_date", indianTime.ToString("dd MMM yyyy hh:mm:ss tt"));
                cmd2.Parameters.AddWithValue("@status", "Active");
                cmd2.Parameters.AddWithValue("@package_image", "no-photo.png");
                cmd2.Parameters.AddWithValue("@body", body.Text.ToString());
            con2.Open();
                int count2 = cmd2.ExecuteNonQuery();
                con2.Close();
                con2.Dispose();

                con.Close();
                con.Dispose();
                reader.Close();
                Response.Redirect("packages.aspx");
            }
        //}
        //catch (Exception ex)
        //{
        //    Response.Write(ex.Message);
        //}
    }

}