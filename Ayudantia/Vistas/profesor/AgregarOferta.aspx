<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="AgregarOferta.aspx.cs" Inherits="Vistas_profesor_AgregarOferta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container mt-lg-3 mb-lg-3">
            <div class="card p-2">

                <div class="text-center">
                    <br>
                    <h2 class="card-title form-text">Agregar Oferta</h2>
                    <br>
                </div>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Seleccione_Carrera" runat="server" Text="Seleccione Carrera:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:DropDownList ID="DropDownList_Carrera" runat="server" class="form-control" autopostback="true" onselectedindexchanged="DropDownList_Carrera_SelectedIndexChanged">
 
                        </asp:DropDownList>
                    </div>
 
                </div>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Seleccione_Asignatura" runat="server" Text="Seleccione Asignatura:" class="col-2 col-form-label" ></asp:Label>
                    <div class="col-6">
                        <asp:DropDownList ID="DropDownList_Asignatura" runat="server" class="form-control" autopostback="true" onselectedindexchanged="DropDownList_Asignatura_SelectedIndexChanged">
                            
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Seleccione_Seccion" runat="server" Text="Seleccione Sección:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:DropDownList ID="DropDownList_Seccion" runat="server" class="form-control" autopostback="true">
                           
                        </asp:DropDownList>
                    </div>
                </div>


                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Horas_Ayudantia" runat="server" Text="Horas Ayudantia:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:DropDownList ID="DropDownList_Horas_Ayudantia" runat="server" class="form-control">
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

                <br>

                <div class="form-group row justify-content-md-center">
                    <asp:Label ID="Requisitos" runat="server" Text="Requisitos:" class="col-2 col-form-label"></asp:Label>
                    <div class="col-6">
                        <asp:TextBox ID="TextBox_Requisitos_oferta" class="form-control" runat="server" TextMode="MultiLine" Height="100"></asp:TextBox>
                    </div>
                </div>
                <br>

                <div class="text-center">
                    <asp:Button ID="Volver" runat="server" Text="Volver" class="btn btn-outline-primary" OnClick="Button_Volver_Click" />
                    <asp:Button ID="Guardar" runat="server" Text="Guardar Oferta" class="btn btn-outline-primary" OnClick="Guardar_Formulario" />
                </div>

            </div>
        </div>
    </form>
</asp:Content>

      