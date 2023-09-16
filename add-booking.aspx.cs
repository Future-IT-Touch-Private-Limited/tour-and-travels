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

public partial class admin_generate_booking : System.Web.UI.Page
{
    string EncryptionKey = "@#future#@touch_!123~!admin@@";
    string EncryptionKey2 = "future@123@adm";
    EncDec EncDec = new EncDec();
    private static TimeZoneInfo INDIAN_ZONE = TimeZoneInfo.FindSystemTimeZoneById("India Standard Time");
    DateTime indianTime = TimeZoneInfo.ConvertTimeFromUtc(DateTime.UtcNow, INDIAN_ZONE);

    public void getPackages()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT package_title,sr FROM packages";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string packageTitle = reader["package_title"].ToString();
                        string packageSr = reader["sr"].ToString();
                        package_title_ddl.Items.Add(new ListItem(packageTitle, packageSr));
                    }
                }
            }
        }
    }
    public void getDrivers()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT driver_name,sr FROM drivers";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string driverName = reader["driver_name"].ToString();
                        string driverSr = reader["sr"].ToString();
                        driver_name_ddl.Items.Add(new ListItem(driverName, driverSr));
                    }
                }
            }
        }
    }
    public void getVehicles()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT regd_number,sr FROM vehicles";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string vehicleNumber = reader["regd_number"].ToString();
                        string vehicleSr = reader["sr"].ToString();
                        vehicle_number_ddl.Items.Add(new ListItem(vehicleNumber, vehicleSr));
                    }
                }
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int currentYear = Convert.ToInt32(indianTime.ToString("yyyy"));
            for (int i = 0; i <= 20; i++)
            {
                int year = currentYear - i;
                year_ddl.Items.Add(new ListItem(year.ToString(), year.ToString()));
            }
            getPackages();
            getDrivers();
            getVehicles();
        }
    }

    //============ Autofill package details ===================================================
    private void PopulatePackageTitleDropDown()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT package_title,sr FROM packages";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string packageTitle = reader["package_title"].ToString();
                        string packageSr = reader["sr"].ToString();
                        package_title_ddl.Items.Add(new ListItem(packageTitle, packageSr));
                    }
                }
            }
        }
    }

    private void FillFieldsFromDatabase(string selectedPackageTitle)
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT * FROM packages WHERE package_title = @PackageTitle";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@PackageTitle", selectedPackageTitle);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        location.Text = reader["location"].ToString();
                        package_title.Text = reader["package_title"].ToString();
                        tour_locations.Text = reader["tour_locations"].ToString();
                        tour_time_period.Text = reader["tour_time_period"].ToString();
                        package_price.Text = reader["package_price"].ToString();
                        pickup_location.Text = reader["pickup_location"].ToString();
                    }
                }
            }
        }
    }

    protected void package_title_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedPackageTitle = package_title_ddl.SelectedItem.Text;
        FillFieldsFromDatabase(selectedPackageTitle);
    }
    //===========================================================================================

    //============ Autofill driver details ===================================================
    private void PopulateDriverDropDown()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT driver_name,sr FROM drivers";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string packageTitle = reader["driver_name"].ToString();
                        string packageSr = reader["sr"].ToString();
                        driver_name_ddl.Items.Add(new ListItem(packageTitle, packageSr));
                    }
                }
            }
        }
    }

    private void FillFieldsFromDatabaseDrivers(string selectedDriverName)
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT * FROM drivers WHERE driver_name = @DriverName";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@DriverName", selectedDriverName);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        driver_name.Text = reader["driver_name"].ToString();
                        primary_mobile.Text = reader["primary_mobile"].ToString();
                        secondary_mobile.Text = reader["secondary_mobile"].ToString();
                        address.Text = reader["address"].ToString();
                        city.Text = reader["city"].ToString();
                        state.Text = reader["state"].ToString();
                        pan_card_no.Text = reader["pan_card_no"].ToString();
                        aadhar_card_no.Text = reader["aadhar_card_no"].ToString();
                        dl_no.Text = reader["dl_no"].ToString();
                        driver_type.Text = reader["driver_type"].ToString();
                    }
                }
            }
        }
    }

    protected void driver_name_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedDriverName = driver_name_ddl.SelectedItem.Text;
        FillFieldsFromDatabaseDrivers(selectedDriverName);
    }

    //===========================================================================================

    //============ Autofill vehicle details ===================================================
    private void PopulateVehicleDropDown()
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT regd_number,sr FROM vehicles";
            using (SqlCommand command = new SqlCommand(query, connection))
            {
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string vehicleNumber = reader["regd_number"].ToString();
                        string vehicleSr = reader["sr"].ToString();
                        vehicle_number_ddl.Items.Add(new ListItem(vehicleNumber, vehicleSr));
                    }
                }
            }
        }
    }

    private void FillFieldsFromDatabaseVehicle(string selectedVehicleName)
    {
        string connectionString = EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2);
        using (SqlConnection connection = new SqlConnection(connectionString))
        {
            connection.Open();
            string query = "SELECT * FROM vehicles WHERE regd_number = @VehicleName";

            using (SqlCommand command = new SqlCommand(query, connection))
            {
                command.Parameters.AddWithValue("@VehicleName", selectedVehicleName);

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        brand_name.Text = reader["brand_name"].ToString();
                        model_name.Text = reader["model_name"].ToString();
                        fuel_type.Text = reader["fuel_type"].ToString();
                        vehicle_model_year.Text = reader["vehicle_model_year"].ToString();
                        regd_number.Text = reader["regd_number"].ToString();
                        engine_no.Text = reader["engine_no"].ToString();
                        chassis_number.Text = reader["chassis_number"].ToString();
                        seater.Text = reader["seater"].ToString();
                        vehicle_type.Text = reader["vehicle_type"].ToString();
                    }
                }
            }
        }
    }

    protected void vehicle_number_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedVehicleName = vehicle_number_ddl.SelectedItem.Text;
        FillFieldsFromDatabaseVehicle(selectedVehicleName);
    }

    //===========================================================================================


    protected void addbtn_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con2 = new SqlConnection(EncDec.DecryptString(System.Configuration.ConfigurationManager.AppSettings["cn"], EncryptionKey2));
            SqlCommand cmd2 = new SqlCommand("Insert into bookings (booking_date,year,month,day,hours,minutes,am_pm,arrival_date,departure_date,total_available_seats,query_booking_date,query_arrival_date,query_departure_date,booking_status,driver_id,driver_name,primary_mobile,secondary_mobile,email,address,city,state,country,pan_card_no,aadhar_card_no,dl_no,driver_type,vehicle_id,brand_name,model_name,fuel_type,vehicle_model_year,regd_number,chassis_number,engine_no,seater,vehicle_type,package_id,location,package_title,tour_locations,package_price_type,tour_time_period,package_price,pickup_location,booking_temp_token,booked_seats) values(@booking_date,@year,@month,@day,@hours,@minutes,@am_pm,@arrival_date,@departure_date,@total_available_seats,@query_booking_date,@query_arrival_date,@query_departure_date,@booking_status,@driver_id,@driver_name,@primary_mobile,@secondary_mobile,@email,@address,@city,@state,@country,@pan_card_no,@aadhar_card_no,@dl_no,@driver_type,@vehicle_id,@brand_name,@model_name,@fuel_type,@vehicle_model_year,@regd_number,@chassis_number,@engine_no,@seater,@vehicle_type,@package_id,@location,@package_title,@tour_locations,@package_price_type,@tour_time_period,@package_price,@pickup_location,@booking_temp_token,@booked_seats)", con2);
            cmd2.Parameters.AddWithValue("@booking_date", day_ddl.Text+" "+month_ddl.SelectedItem.Text + " "+year_ddl.Text+" "+hours_ddl.Text+":"+minutes_ddl.Text+" "+am_pm_ddl.Text);
            cmd2.Parameters.AddWithValue("@year", year_ddl.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@month", month_ddl.SelectedItem.Text.ToString());
            cmd2.Parameters.AddWithValue("@day", day_ddl.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@hours", hours_ddl.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@minutes", minutes_ddl.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@am_pm", am_pm_ddl.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@arrival_date", arrival_date.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@departure_date", departure_date.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@total_available_seats", total_available_seats.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@query_booking_date", year_ddl.Text+month_ddl.SelectedValue+day_ddl.Text);
            cmd2.Parameters.AddWithValue("@query_arrival_date", arrival_date.Text.Replace("-",""));
            cmd2.Parameters.AddWithValue("@query_departure_date", departure_date.Text.Replace("-",""));
            cmd2.Parameters.AddWithValue("@booking_status", "Pending");
            cmd2.Parameters.AddWithValue("@driver_id", driver_name_ddl.Text);
            cmd2.Parameters.AddWithValue("@driver_name", driver_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@primary_mobile", primary_mobile.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@secondary_mobile", secondary_mobile.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@email", "");
            cmd2.Parameters.AddWithValue("@address", address.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@city", city.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@state", state.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@country", "");
            cmd2.Parameters.AddWithValue("@pan_card_no", pan_card_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@aadhar_card_no", aadhar_card_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@dl_no", dl_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@driver_type", driver_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@vehicle_id", vehicle_number_ddl.Text);
            cmd2.Parameters.AddWithValue("@brand_name", brand_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@model_name", model_name.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@fuel_type", fuel_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@vehicle_model_year", vehicle_model_year.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@regd_number", regd_number.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@chassis_number", chassis_number.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@engine_no", engine_no.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@seater", seater.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@vehicle_type", vehicle_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@package_id", package_title_ddl.Text);
            cmd2.Parameters.AddWithValue("@location", location.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@package_title", package_title.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@tour_locations", tour_locations.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@package_price_type", package_price_type.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@tour_time_period", tour_time_period.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@package_price", package_price.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@pickup_location", pickup_location.Text.Trim().ToString());
            cmd2.Parameters.AddWithValue("@booking_temp_token", booking_temp_token_hf.Value);
            cmd2.Parameters.AddWithValue("@booked_seats", "0");
            con2.Open();
            int count2 = cmd2.ExecuteNonQuery();
            con2.Close();
            con2.Dispose();
            Response.Redirect("bookings.aspx");
        }
        catch (Exception ex)
        {
            errordiv.Visible = true;
            errorlbl.Text = ex.Message;
        }
    }

}