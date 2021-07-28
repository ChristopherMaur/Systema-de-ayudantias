<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="FormularioPostulacion.aspx.cs" Inherits="Vistas_alumno_FormularioPostulacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container mt-lg-3 mb-lg-3">
            <div class="card p-2">
                <div class="text-center">
                    <br>
                    <h2 class="card-title form-text">Formulario Postulación</h2>
                    <br>
                </div>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="cod_asig" runat="server" Text="Código asignatura:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_cod_asig" runat="server" class="form-control" disabled="disabled" Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Rut_Postulacion" runat="server" Text="Rut Postulación" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_Rut_Postulacion" runat="server" class="form-control"></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Fecha_Postulación" runat="server" Text="Fecha Postulación:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_Fecha_Postulación" runat="server" class="form-control" type="datetime-local" value="2018-00-00T00:00:00"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Comentarios" runat="server" Text="Comentarios:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_Comentarios" class="form-control" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Seleccion_Horas" runat="server" Text="Seleccione Horas:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:DropDownList ID="DropDownList_Horas" runat="server" class="form-control">
                            <asp:ListItem Text="Selecione la cantidad de horas" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                            <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            <asp:ListItem Text="7" Value="7"></asp:ListItem>
                            <asp:ListItem Text="8" Value="8"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                
                <div class="text-right">
                    <asp:Button ID="Volver" runat="server" Text="Volver" class="btn btn-outline-primary" OnClick="Button_Volver_Click" />
                    <asp:Button ID="Guardar" runat="server" Text="Guardar y Aceptar" class="btn btn-outline-primary" OnClick="Guardar_Formulario" />
                </div>
            </div>
        </div>
    </form>
    
</asp:Content>

