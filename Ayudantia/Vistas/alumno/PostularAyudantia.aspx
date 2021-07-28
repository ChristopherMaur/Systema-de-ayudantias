<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="PostularAyudantia.aspx.cs" Inherits="Vistas_alumno_PostularAyudantia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server" />

        <div class="text-center">
            <br />
            <h4 class="card-title">Postular Ayudantía</h4>
            <p class="card-text">Ayudantía </p>
            <br />
            <br />
            <asp:GridView ID="GridView"
                DataKeyName="rut_postulacion"
                OnRowDataBound="OnRowDataBound"
                runat="server"
                AutoGenerateColumns="False"
                CssClass="table-bordered" Width="1000px"
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="Id_oferta">
                        <ItemTemplate>
                            <asp:Label ID="lblId_oferta" runat="server"
                                Text='<%# Eval("Id_oferta")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
 
                    <asp:TemplateField HeaderText="Codigo_sec">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo_sec" runat="server"
                                Text='<%# Eval("Codigo_sec")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Codigo_car">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo_car" runat="server"
                                Text='<%# Eval("Codigo_car")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre_car">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre_car" runat="server"
                                Text='<%# Eval("Nombre_car")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre_asig">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre_asig" runat="server"
                                Text='<%# Eval("Nombre_asig")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Numero_sec">
                        <ItemTemplate>
                            <asp:Label ID="lblNumero_sec" runat="server"
                                Text='<%# Eval("Numero_sec")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Horas_oferta">
                        <ItemTemplate>
                            <asp:Label ID="lblHoras_oferta" runat="server"
                                Text='<%# Eval("Horas_oferta")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Requisito_oferta">
                        <ItemTemplate>
                            <asp:Label ID="lblRequisito_oferta" runat="server"
                                Text='<%# Eval("Requisito_oferta")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Visible="true">
                        <ItemTemplate>
                            <div class="text-center">
                                <asp:LinkButton runat="server" CommandName="select" ID="lnk_Select" class="btn btn-outline-primary" Text="Postular" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </div>
    </form>

</asp:Content>

