<%@ Page Title="Add Branch" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-branch.aspx.cs" Inherits="admin_add_branch" %>

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
                        <li class="breadcrumb-item active">Add Branch</li>
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
                                <span class="nav-link active" data-bs-toggle="tab" data-bs-target="#profile-overview" aria-selected="true" role="tab">Add New Branch</span></li>
                        </ul>
                        <div class="tab-content pt-2">
                            <div class="tab-pane fade profile-overview active show" role="tabpanel">
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Branch Name</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="branch_name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Branch Address</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="branch_address" TextMode="MultiLine" Rows="10" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Branch Email</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="branch_email" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-4 col-md-4">Branch Phone No.</div>
                                    <div class="col-lg-8 col-md-8">
                                        <asp:TextBox ID="branch_phone_no" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row pb-3">
                                    <div class="col-lg-12 text-center">
                                        <asp:Button ID="add_btn" OnClick="add_btn_Click" CssClass="btn btn-md btn-primary" runat="server" Text="Add Branch" />
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