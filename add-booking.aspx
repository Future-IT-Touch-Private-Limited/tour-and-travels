<%@ Page Title="Generate Booking" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-booking.aspx.cs" Inherits="admin_generate_booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- title -->
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Dashboard</h3>
                    </div>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb pull-right">
                        <li class="breadcrumb-item">
                            <a href="dashboard.aspx">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item active">Add Booking</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid end -->


    <section class="section profile">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <asp:HiddenField ID="sr_lbl" runat="server" />
        <asp:HiddenField ID="booking_temp_token_hf" runat="server" />
        <div class="row mb-3">
            <div class="col-md-12">
            </div>
        </div>
        <div class="row">

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <span class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Booking Details</span></li>
                        </ul>
                        <div class="tab-content pt-4">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-12" style="color: #808080c9">Booking Date</div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">Year</div>
                                        <asp:DropDownList ID="year_ddl" CssClass="form-control" runat="server">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">Month</div>
                                        <asp:DropDownList ID="month_ddl" CssClass="form-control" runat="server">
                                            <asp:ListItem Value="01">Jan</asp:ListItem>
                                            <asp:ListItem Value="02">Feb</asp:ListItem>
                                            <asp:ListItem Value="03">Mar</asp:ListItem>
                                            <asp:ListItem Value="04">Apr</asp:ListItem>
                                            <asp:ListItem Value="05">May</asp:ListItem>
                                            <asp:ListItem Value="06">Jun</asp:ListItem>
                                            <asp:ListItem Value="07">Jul</asp:ListItem>
                                            <asp:ListItem Value="08">Aug</asp:ListItem>
                                            <asp:ListItem Value="09">Sep</asp:ListItem>
                                            <asp:ListItem Value="10">Oct</asp:ListItem>
                                            <asp:ListItem Value="11">Nov</asp:ListItem>
                                            <asp:ListItem Value="12">Dec</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">Day</div>
                                        <asp:DropDownList ID="day_ddl" CssClass="form-control" runat="server">
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                            <asp:ListItem>24</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                            <asp:ListItem>26</asp:ListItem>
                                            <asp:ListItem>27</asp:ListItem>
                                            <asp:ListItem>28</asp:ListItem>
                                            <asp:ListItem>29</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>31</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">Hours</div>
                                        <asp:DropDownList ID="hours_ddl" CssClass="form-control" runat="server">
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">Minutes</div>
                                        <asp:DropDownList ID="minutes_ddl" CssClass="form-control" runat="server">
                                            <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>13</asp:ListItem>
                                            <asp:ListItem>14</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>16</asp:ListItem>
                                            <asp:ListItem>17</asp:ListItem>
                                            <asp:ListItem>18</asp:ListItem>
                                            <asp:ListItem>19</asp:ListItem>
                                            <asp:ListItem>20</asp:ListItem>
                                            <asp:ListItem>21</asp:ListItem>
                                            <asp:ListItem>22</asp:ListItem>
                                            <asp:ListItem>23</asp:ListItem>
                                            <asp:ListItem>24</asp:ListItem>
                                            <asp:ListItem>25</asp:ListItem>
                                            <asp:ListItem>26</asp:ListItem>
                                            <asp:ListItem>27</asp:ListItem>
                                            <asp:ListItem>28</asp:ListItem>
                                            <asp:ListItem>29</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>31</asp:ListItem>
                                            <asp:ListItem>32</asp:ListItem>
                                            <asp:ListItem>33</asp:ListItem>
                                            <asp:ListItem>34</asp:ListItem>
                                            <asp:ListItem>35</asp:ListItem>
                                            <asp:ListItem>36</asp:ListItem>
                                            <asp:ListItem>37</asp:ListItem>
                                            <asp:ListItem>38</asp:ListItem>
                                            <asp:ListItem>39</asp:ListItem>
                                            <asp:ListItem>40</asp:ListItem>
                                            <asp:ListItem>41</asp:ListItem>
                                            <asp:ListItem>42</asp:ListItem>
                                            <asp:ListItem>43</asp:ListItem>
                                            <asp:ListItem>44</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                            <asp:ListItem>46</asp:ListItem>
                                            <asp:ListItem>47</asp:ListItem>
                                            <asp:ListItem>48</asp:ListItem>
                                            <asp:ListItem>49</asp:ListItem>
                                            <asp:ListItem>50</asp:ListItem>
                                            <asp:ListItem>51</asp:ListItem>
                                            <asp:ListItem>52</asp:ListItem>
                                            <asp:ListItem>53</asp:ListItem>
                                            <asp:ListItem>54</asp:ListItem>
                                            <asp:ListItem>55</asp:ListItem>
                                            <asp:ListItem>56</asp:ListItem>
                                            <asp:ListItem>57</asp:ListItem>
                                            <asp:ListItem>58</asp:ListItem>
                                            <asp:ListItem>59</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-2">
                                        <div style="color: gray; font-size: 12px">AM/PM</div>
                                        <asp:DropDownList ID="am_pm_ddl" CssClass="form-control" runat="server">
                                            <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Arrival Date</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="arrival_date" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Departure Date</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="departure_date" TextMode="Date" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Total Available Seats</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="total_available_seats" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-12">
                                        <asp:Panel ID="errorverificationdiv" Visible="false" runat="server" class="alert alert-danger bg-danger text-light border-0 alert-dismissible fade show" role="alert">
                                            <asp:Label ID="errorverificationlbl" runat="server" Text="dsfs fsdf sdf "></asp:Label>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </asp:Panel>
                                        <asp:Panel ID="otpsuccessdiv" Visible="false" runat="server" class="alert alert-success bg-success text-light border-0 alert-dismissible fade show" role="alert">
                                            <asp:Label ID="otpsuccesslbl" runat="server" Text=""></asp:Label>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </asp:Panel>
                                    </div>
                                </div>
                                <%--<div class="row pb-3">
                                    <div class="col-lg-12 text-center">
                                        <asp:Button ID="add_btn" CssClass="btn btn-md btn-primary" runat="server" Text="Generate Booking" />
                                    </div>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <span class="nav-link active" aria-selected="true" role="tab">Package Details</span></li>
                        </ul>
                        <div class="tab-content pt-4">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Select Existing</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:HiddenField ID="package_sr_hf" runat="server" />
                                        <asp:DropDownList ID="package_title_ddl" AutoPostBack="true" OnSelectedIndexChanged="package_title_ddl_SelectedIndexChanged" CssClass="form-control" runat="server">
                                            <asp:ListItem>Select for Autofill</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Location</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="location" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Package Title</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="package_title" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Tour Locations</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="tour_locations" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Tour Time Period</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="tour_time_period" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Package Price Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="package_price_type" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Fixed Booking</asp:ListItem>
                                            <asp:ListItem>Per Person</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Package Price</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="package_price" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Pickup Location</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="pickup_location" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <span class="nav-link active" aria-selected="true" role="tab">Driver Details</span></li>
                        </ul>
                        <div class="tab-content pt-4">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Select Existing</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:HiddenField ID="driver_sr_hf" runat="server" />
                                        <asp:DropDownList ID="driver_name_ddl" OnSelectedIndexChanged="driver_name_ddl_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control" runat="server">
                                            <asp:ListItem>Select for Autofill</asp:ListItem>

                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driver Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="driver_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Primary Mobile</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="primary_mobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Secondary Mobile</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="secondary_mobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driver Address</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="address" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driver City</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="city" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driver State</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="state" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Pan Card No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="pan_card_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Aadhar Card No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="aadhar_card_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driving License No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="dl_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Driver Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="driver_type" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Inner</asp:ListItem>
                                            <asp:ListItem>Outer</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <span class="nav-link active" aria-selected="true" role="tab">Vehicle Details</span></li>
                        </ul>
                        <div class="tab-content pt-4">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Select Existing</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:HiddenField ID="vehicle_sr_hf" runat="server" />
                                        <asp:DropDownList ID="vehicle_number_ddl" AutoPostBack="true" OnSelectedIndexChanged="vehicle_number_ddl_SelectedIndexChanged" CssClass="form-control" runat="server">
                                            <asp:ListItem>Select for Autofill</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Brand Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="brand_name" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Aston Martin</asp:ListItem>
                                            <asp:ListItem>Audi</asp:ListItem>
                                            <asp:ListItem>Bentley</asp:ListItem>
                                            <asp:ListItem>BMW</asp:ListItem>
                                            <asp:ListItem>Bugatti</asp:ListItem>
                                            <asp:ListItem>Datsun</asp:ListItem>
                                            <asp:ListItem>Ferrari</asp:ListItem>
                                            <asp:ListItem>Force</asp:ListItem>
                                            <asp:ListItem>Ford</asp:ListItem>
                                            <asp:ListItem>Honda</asp:ListItem>
                                            <asp:ListItem>Hyundai</asp:ListItem>
                                            <asp:ListItem>Isuzu</asp:ListItem>
                                            <asp:ListItem>Jaguar</asp:ListItem>
                                            <asp:ListItem>Jeep</asp:ListItem>
                                            <asp:ListItem>Kia</asp:ListItem>
                                            <asp:ListItem>Lamborghini</asp:ListItem>
                                            <asp:ListItem>Land Rover</asp:ListItem>
                                            <asp:ListItem>Lexus</asp:ListItem>
                                            <asp:ListItem>Mahindra</asp:ListItem>
                                            <asp:ListItem>Maruti</asp:ListItem>
                                            <asp:ListItem>Maserati</asp:ListItem>
                                            <asp:ListItem>Mercedes Benz</asp:ListItem>
                                            <asp:ListItem>MG</asp:ListItem>
                                            <asp:ListItem>Mini</asp:ListItem>
                                            <asp:ListItem>Mitsubishi</asp:ListItem>
                                            <asp:ListItem>Nissan</asp:ListItem>
                                            <asp:ListItem>Porsche</asp:ListItem>
                                            <asp:ListItem>Renault</asp:ListItem>
                                            <asp:ListItem>Rolls Royce</asp:ListItem>
                                            <asp:ListItem>Skoda</asp:ListItem>
                                            <asp:ListItem>Tata</asp:ListItem>
                                            <asp:ListItem>Toyota</asp:ListItem>
                                            <asp:ListItem>Volkswagen</asp:ListItem>
                                            <asp:ListItem>Volvo</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Model Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="model_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">fuel_type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="fuel_type" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>Diesel</asp:ListItem>
                                            <asp:ListItem>Petrol</asp:ListItem>
                                            <asp:ListItem>CNG</asp:ListItem>
                                            <asp:ListItem>LPG</asp:ListItem>
                                            <asp:ListItem>Electric</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Vehicle Model Year</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="vehicle_model_year" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Regd Number</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="regd_number" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Engine Number</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="engine_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Chassis Number</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="chassis_number" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Total Seats</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="seater" CssClass="form-control" runat="server">
                                            <asp:ListItem></asp:ListItem>
                                            <asp:ListItem>2 Seater</asp:ListItem>
                                            <asp:ListItem>4 Seater</asp:ListItem>
                                            <asp:ListItem>6 Seater</asp:ListItem>
                                            <asp:ListItem>7 Seater</asp:ListItem>
                                            <asp:ListItem>8 Seater</asp:ListItem>
                                            <asp:ListItem>9 Seater</asp:ListItem>
                                            <asp:ListItem>10 Seater</asp:ListItem>
                                            <asp:ListItem>11 Seater</asp:ListItem>
                                            <asp:ListItem>12 Seater</asp:ListItem>
                                            <asp:ListItem>13 Seater</asp:ListItem>
                                            <asp:ListItem>14 Seater</asp:ListItem>
                                            <asp:ListItem>15 Seater</asp:ListItem>
                                            <asp:ListItem>16 Seater</asp:ListItem>
                                            <asp:ListItem>17 Seater</asp:ListItem>
                                            <asp:ListItem>18 Seater</asp:ListItem>
                                            <asp:ListItem>19 Seater</asp:ListItem>
                                            <asp:ListItem>20 Seater</asp:ListItem>
                                            <asp:ListItem>21 Seater</asp:ListItem>
                                            <asp:ListItem>22 Seater</asp:ListItem>
                                            <asp:ListItem>23 Seater</asp:ListItem>
                                            <asp:ListItem>24 Seater</asp:ListItem>
                                            <asp:ListItem>25 Seater</asp:ListItem>
                                            <asp:ListItem>26 Seater</asp:ListItem>
                                            <asp:ListItem>27 Seater</asp:ListItem>
                                            <asp:ListItem>28 Seater</asp:ListItem>
                                            <asp:ListItem>29 Seater</asp:ListItem>
                                            <asp:ListItem>30 Seater</asp:ListItem>
                                            <asp:ListItem>31 Seater</asp:ListItem>
                                            <asp:ListItem>32 Seater</asp:ListItem>
                                            <asp:ListItem>33 Seater</asp:ListItem>
                                            <asp:ListItem>34 Seater</asp:ListItem>
                                            <asp:ListItem>35 Seater</asp:ListItem>
                                            <asp:ListItem>36 Seater</asp:ListItem>
                                            <asp:ListItem>37 Seater</asp:ListItem>
                                            <asp:ListItem>38 Seater</asp:ListItem>
                                            <asp:ListItem>39 Seater</asp:ListItem>
                                            <asp:ListItem>40 Seater</asp:ListItem>
                                            <asp:ListItem>41 Seater</asp:ListItem>
                                            <asp:ListItem>42 Seater</asp:ListItem>
                                            <asp:ListItem>43 Seater</asp:ListItem>
                                            <asp:ListItem>44 Seater</asp:ListItem>
                                            <asp:ListItem>45 Seater</asp:ListItem>
                                            <asp:ListItem>46 Seater</asp:ListItem>
                                            <asp:ListItem>47 Seater</asp:ListItem>
                                            <asp:ListItem>48 Seater</asp:ListItem>
                                            <asp:ListItem>49 Seater</asp:ListItem>
                                            <asp:ListItem>50 Seater</asp:ListItem>
                                            <asp:ListItem>Uptp 50 Seater</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end" style="color: #808080c9">Vehicle Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="vehicle_type" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-12">
                                        <asp:Panel ID="errordiv" runat="server" Visible="false" class="alert alert-danger bg-danger text-light border-0 alert-dismissible fade show" role="alert">
                                            <asp:Label ID="errorlbl" runat="server" Text=""></asp:Label>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </asp:Panel>
                                        <asp:Panel ID="successdiv" runat="server" Visible="false" class="alert alert-danger bg-success text-light border-0 alert-dismissible fade show" role="alert">
                                            <asp:Label ID="successlbl" runat="server" Text=""></asp:Label>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                                        </asp:Panel>
                                    </div>
                                    <div class="col-lg-12 col-md-12 text-center" style="color: #808080c9">
                                        <asp:Button ID="addbtn" OnClick="addbtn_Click" runat="server" CssClass="btn btn-md btn-success" Text="Generate Booking" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



            </div>

        </div>

        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </section>

</asp:Content>
