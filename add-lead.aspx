﻿<%@ Page Title="Add New Lead" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-lead.aspx.cs" Inherits="admin_add_lead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                        <li class="breadcrumb-item active">Add New Lead</li>
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
                                <span class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Add New Lead</span></li>
                        </ul>
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Mobile</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="mobile" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Email</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Total Travlers</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="total_travlers" TextMode="Number" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Pickup Point</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="pickup_point" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Journey Date</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="journey_date" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Return Date</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="return_date" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4 text-end">Note</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="note" TextMode="MultiLine" Rows="5" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-12 text-center">
                                        <asp:Button ID="add_btn" OnClick="add_btn_Click" CssClass="btn btn-md btn-primary" runat="server" Text="Add Lead" />
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