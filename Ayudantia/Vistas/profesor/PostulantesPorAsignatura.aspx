<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="PostulantesPorAsignatura.aspx.cs" Inherits="Vistas_profesor_PostulantesPorAsignatura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager2" runat="server" />

        <div class="text-center">
            <h4 class="card-title">Listado Postulaciones</h4>
            <p class="card-text">Postulaciones </p>

            <asp:GridView ID="GridView"
                DataKeyName="id_listado"
                OnRowDataBound="OnRowDataBound"
                runat="server"
                AutoGenerateColumns="False">
                <Columns>

                   <asp:TemplateField HeaderText="Id_listado">
                        <ItemTemplate>
                            <asp:Label ID="lblId_listado" runat="server"
                                Text='<%# Eval("Id_listado")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Id_oferta">
                        <ItemTemplate>
                            <asp:Label ID="lblId_oferta" runat="server"
                                Text='<%# Eval("Id_oferta")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rut_postulacion">
                        <ItemTemplate>
                            <asp:Label ID="lblRut_postulacion" runat="server"
                                Text='<%# Eval("Rut_postulacion")%>'></asp:Label>
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

                    <asp:TemplateField HeaderText="Estado_postulacion">
                        <ItemTemplate>
                            <asp:Label ID="lblEstado_postulacion" runat="server"
                                Text='<%# Eval("Estado_postulacion")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
            </asp:GridView>
        </div>
        <br/>
        <div class="text-right">
            <asp:Button ID="Volver" runat="server" Text="Volver" class="btn btn-outline-primary" OnClick="Button_Volver_Click" />
        </div>
    </form>
</asp:Content>

