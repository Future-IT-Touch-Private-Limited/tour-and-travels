<%@ Page Title="Add Vehicle" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-vehicle.aspx.cs" Inherits="admin_vehicles" %>

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
                        <li class="breadcrumb-item active">Add Vehicle</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid end -->


    <section class="section profile">
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>

        <div class="row mb-3">
            <div class="col-md-12">
                <asp:Panel ID="errordiv" runat="server" Visible="false" class="alert alert-danger bg-danger text-light border-0 alert-dismissible fade show" role="alert">
                    <asp:Label ID="errorlbl" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>
                <asp:Panel ID="successdiv" runat="server" Visible="false" class="alert alert-danger bg-success text-light border-0 alert-dismissible fade show" role="alert">
                    <asp:Label ID="successlbl" runat="server" Text=""></asp:Label>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="alert" aria-label="Close"></button>
                </asp:Panel>
            </div>
        </div>
        <div class="row">

            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body pt-3">
                        <ul class="nav nav-tabs nav-tabs-bordered" role="tablist">
                            <li class="nav-item" role="presentation">
                                <span class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">All Vehicles</span></li>
                        </ul>
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Brand Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="brand_name" CssClass="form-control" runat="server">
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
                                    <div class="col-lg-4 col-md-4">Model Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="model_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Fuel Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="fuel_type" CssClass="form-control" runat="server">
                                            <asp:ListItem>Diesel</asp:ListItem>
                                            <asp:ListItem>Petrol</asp:ListItem>
                                            <asp:ListItem>CNG</asp:ListItem>
                                            <asp:ListItem>LPG</asp:ListItem>
                                            <asp:ListItem>Electric</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Vehicle Model Year</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="vehicle_model_year" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Regd. No. (eg HR20L2253) without space</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="regd_number" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Chassis No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="chassis_number" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Engine No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="engine_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Seater</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="seater" CssClass="form-control" runat="server">
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
                                    <div class="col-lg-4 col-md-4">Vehicle Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="vehicle_type" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-12 text-center">
                                        <asp:Button ID="add_btn" OnClick="add_btn_Click" CssClass="btn btn-md btn-primary" runat="server" Text="Add Vehicle" />
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
