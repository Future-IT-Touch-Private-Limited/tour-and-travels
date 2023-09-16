<%@ Page Title="Add Driver" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-driver.aspx.cs" Inherits="admin_add_driver" %>

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
                        <li class="breadcrumb-item active">Add Driver</li>
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
                                <span class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Add Driver</span></li>
                        </ul>
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Driver Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="driver_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Primary Mobile</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="primary_mobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Secondary Mobile</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="secondary_mobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Email</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Address</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="address" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">City</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="city" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">State</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="state" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Country</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="country" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Pan Card No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="pan_card_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Aadhar Card No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="aadhar_card_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">D.L. Number</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="dl_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Drivery Type</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:DropDownList ID="driver_type" CssClass="form-control" runat="server">
                                            <asp:ListItem>Inner</asp:ListItem>
                                            <asp:ListItem>Outer</asp:ListItem>
                                        </asp:DropDownList>
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
                                <div class="row pb-3">
                                    <div class="col-lg-12 text-center">
                                        <asp:Button ID="add_btn" OnClick="add_btn_Click" CssClass="btn btn-md btn-primary" runat="server" Text="Add Driver" />
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
