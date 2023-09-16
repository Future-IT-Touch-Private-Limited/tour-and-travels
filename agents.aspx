<%@ Page Title="All Agents" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="agents.aspx.cs" Inherits="admin_agents" %>

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
                        <li class="breadcrumb-item active">All Agents</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Container-fluid end -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <h5 class="card-title">Agents (Total <asp:Label ID="all_lbl" style="font-size: 18px;" Font-Bold="true" runat="server" Text="0"></asp:Label>) </h5>
                            </div>
                        </div>
                        
                        <div class="table-responsive">
                            <table class="table table-bordered border-primary">
                                <thead>
                                    <tr>
                                        <td>Agent Id</td>
                                        <th>Agent Name</th>
                                        <th>Mobile</th>
                                        <th>Email</th>
                                        <th>City</th>
                                        <th>Status</th>
                                        <th>View</th>
                                        <th>Leads</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <asp:Repeater ID="branches_list" OnItemDataBound="branches_list_ItemDataBound" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td><%# Eval("sr") %></td>
                                                <td><%# Eval("name") %></td>
                                                <td><%# Eval("mobile") %></td>
                                                <td><%# Eval("email") %></td>
                                                <th><%# Eval("city") %></th>
                                                <th><%# Eval("account_status") %></th>
                                                <td><a href='view-agent.aspx?sr=<%# Eval("sr") %>'>View/Edit</a></td>
                                                <td>
                                                    <asp:HiddenField ID="agent_username_3des_hf" Value='<%# Eval("username_3des") %>' runat="server" />
                                                    <asp:HyperLink ID="agent_username_3des_hl" runat="server">View</asp:HyperLink></td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>



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