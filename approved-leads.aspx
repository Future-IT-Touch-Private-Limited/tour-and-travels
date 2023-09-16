<%@ Page Title="Approved Leads" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="approved-leads.aspx.cs" Inherits="admin_approved_leads" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- title -->
    <section>
        <div class="container-fluid">
            <div class="page-header">
                <div class="row">
                    <div class="col-sm-6">
                        <div class="page-header-left">
                            <h5>Approved Leads (<asp:Label ID="total_lbl" Font-Size="Large" runat="server" Text="0"></asp:Label>)</h5>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <ol class="breadcrumb pull-right">
                            <li class="breadcrumb-item">
                                <a href="dashboard.aspx">
                                    <i class="fa fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active">Leads</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Container-fluid end -->



    <section>
        <div class="container">
            <div class="row">

                <div class="col-lg-12">
                    <div class="table-responsive">
                        <table id="data_tbl" class="table table-bordered table-stripped">
                            <tr class="bg-light">
                                <td><strong>ID</strong></td>
                                <td><strong>Name</strong></td>
                                <td><strong>Mobile</strong></td>
                                <td><strong>Email</strong></td>
                                <td><strong>Agent Email</strong></td>
                                <td><strong>Agent ID</strong></td>
                                <td><strong>Lead Date</strong></td>
                                <td><strong>Status</strong></td>
                                <td><strong>More</strong></td>
                            </tr>
                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                <ItemTemplate>
                                    <tr>
                                        <td><a href='view-booking.aspx?sr=<%# Eval("sr") %>' target="_blank"><%# Eval("sr") %></a></td>
                                        <td><%# Eval("name") %></td>
                                        <td><%# Eval("mobile") %></td>
                                        <td><%# Eval("email") %></td>
                                        <td>
                                            <asp:Label ID="agent_username_3des" runat="server" Text='<%# Eval("agent_username_3des") %>'></asp:Label></td>
                                        <td><%# Eval("agent_id") %></td>
                                        <td><%# Eval("lead_generated_time") %></td>
                                        <td><asp:Label ID="status_lbl" runat="server" Text='<%# Eval("status") %>'></asp:Label></td>
                                        <td><a href='view-lead.aspx?sr=<%# Eval("sr") %>'>View</a></td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </section>


    <section>
        <div class="row">
            <div class="col-lg-12">
                <div class="table-responsive">
                    <table class="table">
                        <tr>
                            <td>
                                <asp:LinkButton ID="lnkFirst" runat="server" OnClick="lnkFirst_Click">First</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkPrevious" runat="server" OnClick="lnkPrevious_Click">Previous</asp:LinkButton>
                            </td>
                            <td>
                                <asp:DataList ID="RepeaterPaging" runat="server"
                                    OnItemCommand="RepeaterPaging_ItemCommand"
                                    OnItemDataBound="RepeaterPaging_ItemDataBound" RepeatDirection="Horizontal">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Pagingbtn" runat="server"
                                            CommandArgument='<%# Eval("PageIndex") %>' CommandName="newpage"
                                            Text='<%# Eval("PageText") %>' Width="20px"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:DataList>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkNext" runat="server" OnClick="lnkNext_Click">Next</asp:LinkButton>
                            </td>
                            <td>
                                <asp:LinkButton ID="lnkLast" runat="server" OnClick="lnkLast_Click">Last</asp:LinkButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5" class="text-center">
                                <asp:Label ID="lblpage" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

    </section>

</asp:Content>