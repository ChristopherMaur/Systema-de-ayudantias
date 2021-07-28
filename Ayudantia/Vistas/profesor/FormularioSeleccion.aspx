<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="FormularioSeleccion.aspx.cs" Inherits="Vistas_profesor_FormularioSeleccion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <div class="container mt-lg-3 mb-lg-3">
            <div class="card p-2">
                <div class="text-center">
                    <br>
                    <h2 class="card-title form-text">Formulario Seleccion Ayudante</h2>
                    <br>
                </div>


                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="rut_ayudante" runat="server" Text="Rut ayudante:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_rut_ayudante" runat="server" class="form-control" disabled="disabled" Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="asig_ayudante" runat="server" Text="Asignatura Postulada:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_asig_ayudante" runat="server" class="form-control" disabled="disabled" Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="sec_ayudante" runat="server" Text="Sección Postulada:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_sec_ayudante" runat="server" class="form-control" disabled="disabled" Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="ano_periodo_academico" runat="server" Text="Periodo Ayudantia:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_ano_periodo_academico" runat="server" class="form-control" disabled="disabled" Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="horas_ayudante" runat="server" Text="Horas Ayudantia:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_horas_ayudante" runat="server" class="form-control"  Text=""></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="fecha_seleccion_ayudante" runat="server" Text="Fecha Selección Ayudante:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_fecha_seleccion_ayudante" runat="server" class="form-control" type="datetime-local" value="2018-00-00T00:00:00"></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="detalle_horario" runat="server" Text="Horario sugerido:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_detalle_horario" class="form-control" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>
                    </div>
                </div>
                <br>


                <div class="text-right">
                    <asp:Button ID="Volver" runat="server" Text="Volver" class="btn btn-outline-primary" OnClick="Button_Volver_Click" />
                    <asp:Button ID="Guardar" runat="server" Text="Guardar y Aceptar" class="btn btn-outline-primary" OnClick="Guardar_Formulario" />
                </div>
            </div>
        </div>
    </form>
</asp:Content>

