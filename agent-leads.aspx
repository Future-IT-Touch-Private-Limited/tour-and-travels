<%@ Page Title="Agent Leads" Language="C#" MasterPageFile="~/main-admin.master" AutoEventWireup="true" CodeFile="agent-leads.aspx.cs" Inherits="admin_agent_leads" %>

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
                            <h5>Agent Leads (<asp:Label ID="total_lbl" Font-Size="Large" runat="server" Text="0"></asp:Label>)</h5>
                        </div>
                    </div>
                    <div class="col-sm-12">
                        <ol class="breadcrumb pull-right">
                            <li class="breadcrumb-item">
                                <a href="dashboard.aspx">
                                    <i class="fa fa-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active">Agent Leads</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Container-fluid end -->

    
    <div class="container">
        <div class="row">

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body p-2">
                        <strong>Search Query</strong>
                        <asp:TextBox ID="searchtxt" CssClass="form-control" runat="server"></asp:TextBox>
                        <div class="text-center pt-2 pb-2">
                            <asp:Button ID="searchbtn" OnClick="searchbtn_Click" CssClass="btn btn-sm btn-success" runat="server" Text="Search" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body p-2">
                        <strong>Start Date</strong>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:TextBox ID="start_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <strong>End Date</strong>
                        <div class="row">
                            <div class="col-lg-12">
                                <asp:TextBox ID="end_date" TextMode="Date" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="text-center pt-2 pb-2">
                            <asp:Button ID="filter_between_date_btn" OnClick="filter_between_date_btn_Click" CssClass="btn btn-sm btn-success" runat="server" Text="Filter between date" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="card">
                    <div class="card-body text-center p-2">
                        <button id="exportButton" class="btn btn-sm btn-outline-success">Export to Excel</button>
                    </div>
                </div>
            </div>

        </div>
    </div>


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
                                        <td><asp:Label ID="status_lbl" runat="server" Text='<%# Eval("lead_final_status") %>'></asp:Label></td>
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
    <script>
        document.getElementById('exportButton').addEventListener('click', function () {
            const table = document.getElementById('data_tbl');
            let csvContent = 'data:text/csv;charset=utf-8,';

            // Loop through the table rows and cells to generate CSV data
            for (const row of table.rows) {
                const rowData = [];
                for (const cell of row.cells) {
                    // Escape cell values containing commas
                    let cellValue = cell.innerText;
                    if (cellValue.includes(',')) {
                        cellValue = `"${cellValue}"`;
                    }
                    rowData.push(cellValue);
                }
                csvContent += rowData.join(',') + '\n';
            }

            // Create a Blob object and generate a download link
            const encodedUri = encodeURI(csvContent);
            const link = document.createElement('a');
            link.setAttribute('href', encodedUri);
            link.setAttribute('download', 'Agent_Leads.csv');
            document.body.appendChild(link);

            link.click(); // Simulate a click on the link to trigger download
        });

    </script>

</asp:Content>