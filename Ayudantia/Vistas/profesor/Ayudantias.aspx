<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="Ayudantias.aspx.cs" Inherits="Vistas_profesor_Ayudantias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server" />

        <div Class="text-center">
            <h4 class="card-title">Listado Ayudantias</h4>
            <p class="card-text">Ayudantias </p>

            <asp:GridView ID="GridView"
                DataKeyName="id_listado"
                OnRowDataBound="OnRowDataBound"
                runat="server"
                AutoGenerateColumns="False"
                onselectedindexchanged="GridView1_SelectedIndexChanged">
                <Columns>

                    <asp:TemplateField HeaderText="Id_ayudantia">
                        <ItemTemplate>
                            <asp:Label ID="lblId_ayudantia" runat="server"
                                Text='<%# Eval("Id_ayudantia")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rut_ayudante">
                        <ItemTemplate>
                            <asp:Label ID="lblRut_ayudante" runat="server"
                                Text='<%# Eval("Rut_ayudante")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre_user">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre_user" runat="server"
                                Text='<%# Eval("Nombre_user")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                     <asp:TemplateField HeaderText="Apellido_paterno_user">
                        <ItemTemplate>
                            <asp:Label ID="lblApellido_paterno_user" runat="server"
                                Text='<%# Eval("Apellido_paterno_user")%>'></asp:Label>
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

                    <asp:TemplateField HeaderText="Codigo_asig">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo_asig" runat="server"
                                Text='<%# Eval("Codigo_asig")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Nombre_asig">
                        <ItemTemplate>
                            <asp:Label ID="lblNombre_asig" runat="server"
                                Text='<%# Eval("Nombre_asig")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Codigo_sec">
                        <ItemTemplate>
                            <asp:Label ID="lblCodigo_sec" runat="server"
                                Text='<%# Eval("Codigo_sec")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Numero_sec">
                        <ItemTemplate>
                            <asp:Label ID="lblNumero_sec" runat="server"
                                Text='<%# Eval("Numero_sec")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ano_periodo_academico">
                        <ItemTemplate>
                            <asp:Label ID="lblAno_periodo_academico" runat="server"
                                Text='<%# Eval("Ano_periodo_academico")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField Visible="true">
                        <ItemTemplate>
                            <div class="text-center">
                                <asp:LinkButton runat="server" CommandName="select" ID="lnk_Select" class="btn btn-outline-primary" Text="Postulantes" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
    </form>
</asp:Content>

