<%@ Page Title="Add Package" ValidateRequest="false" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="add-package.aspx.cs" Inherits="admin_add_package" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="https://cdn.tiny.cloud/1/t04wmgok1gjyf1rgdxf8r5mu55yjbmbgh1wg0lpdeq5fawu2/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
    <script type="text/javascript">
        tinymce.init({
            selector: "textarea",  // change this value according to your HTML
            content_style: "div {margin: 10px; border: 5px solid red; padding: 3px}",
            plugins: ["advlist autolink lists charmap preview hr anchor",
                "pagebreak code nonbreaking table directionality paste link fullscreen image media searchreplace wordcount textpattern"],
            toolbar1: "styleselect | bold italic underline | preview | undo redo | link | image media | searchreplace",
            toolbar2: "alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | forecolor backcolor | fullscreen",
            relative_urls: false,
            remove_script_host: false,
            convert_urls: true,
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container-fluid">
        <div class="page-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="page-header-left">
                        <h3>Add Package</h3>
                    </div>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb pull-right">
                        <li class="breadcrumb-item">
                            <a href="dashboard.aspx">
                                <i class="fa fa-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item active">Add Package</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-header pb-0">
                        <h5>Add New Package</h5>
                    </div>
                    <div class="card-body admin-form">
                        <div class="row gx-3">
                            <div class="form-group col-sm-6">
                                <label>Location</label>
                                <asp:TextBox ID="location" class="form-control" Placeholder="Location Name" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Package Title</label>
                                <asp:TextBox ID="package_title" runat="server" class="form-control" placeholder="Package Title"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Tour Locations</label>
                                <asp:TextBox ID="tour_locations" runat="server" class="form-control" placeholder="Tour Locations"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Tour Time Period</label>
                                <asp:TextBox ID="tour_time_period" class="form-control" placeholder="eg. 5 Days 3 Nights" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Package Price</label>
                                <asp:TextBox ID="package_price" TextMode="Number" class="form-control" placeholder="Package Amount" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-6">
                                <label>Pickup Location</label>
                                <asp:TextBox ID="pickup_location" class="form-control" placeholder="Pickup Location" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group col-sm-12">
                                <label>Body</label>
                                <asp:TextBox ID="body" class="form-control" TextMode="MultiLine" Rows="20" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-12 pt-3 text-center">
                                <asp:Button ID="addbtn" runat="server" OnClick="addbtn_Click" CssClass="btn btn-primary" Text="Add Package" />
                            </div>

                            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                                <ProgressTemplate>
                                    <div>Please wait...</div>
                                </ProgressTemplate>
                            </asp:UpdateProgress>

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
