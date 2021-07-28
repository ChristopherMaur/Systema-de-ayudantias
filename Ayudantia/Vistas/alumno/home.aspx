<%@ Page Title="" Language="C#" MasterPageFile="~/Index.master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="Vistas_alumno_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
         <asp:ScriptManager ID="ScriptManager1" runat="server" />
         <div class="container">
            <div class="jumbotron" >
      	        <div align ="center">
        	        <h1>Bienvenido al portal de Ayudantías</h1>
        	        <p class="lead">¿Deseas postular?</p>
                      
                    <a class="btn btn-outline-primary" href ="PostularAyudantia.aspx" role="button">POSTULAR!</a>
                    <a class="btn btn-outline-primary" href ="VerEstado.aspx" role="button">VER ESTADO POSTULACION</a>
                          
                </div>
            </div>
         </div>
    </form>

</asp:Content>

