<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Vistas_profesor_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" />
         <div class="container">
            <div class="jumbotron" >
      	        <div align ="center">
        	        <h1>Bienvenido al portal de Ayudantías</h1>
        	        <p class="lead">¿Desea ver las postulaciones o ingresar una oferta de ayudantía?</p>
                    <a class="btn btn-outline-primary" href ="VerPostulaciones.aspx" role="button">VER POSTULACIONES</a>
                    <a class="btn btn-outline-primary" href ="AgregarOferta.aspx" role="button">INGRESAR OFERTA</a>
                    <a class="btn btn-outline-primary" href ="Ayudantias.aspx" role="button">VER AYUDANTIAS</a>
                  </div>
            </div>
         </div>
    </form>

</asp:Content>

