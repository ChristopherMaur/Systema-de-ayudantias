<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" http-equiv="Content-Type" content="text/html, width=device-width, initial-scale=1; charset=utf-8" />
    <title>Login</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"/>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>

    <style type="text/css">
        @import "bourbon";

        body {
            background: #eee !important;
        }

        .wrapper {
            margin: 0 auto;
            width: 400px;
            margin-top: 80px;
            margin-bottom: 80px;
        }

        .form-signin {
            max-width: 380px;
            padding: 15px 35px 45px;
            margin: 0 auto;
            background-color: #fff;
            border: 1px solid rgba(0,0,0,0.1);
            .form-signin-heading, .checkbox

        {
            margin-bottom: 30px;
        }

        .checkbox {
            font-weight: normal;
        }

        .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            @include box-sizing(border-box);
            &:focus

        {
            z-index: 2;
        }

        }

        input[type="text"] {
            margin-bottom: -1px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        input[type="password"] {
            margin-bottom: 20px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        }
        .headertekst{
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div>
            <div class="wrapper">
                <h2 class="form-signin-heading headertekst" >Ingreso</h2>
                <asp:Label ID="Label_rut" runat="server" AssociatedControlID="UserRut" Text="Rut Usuario"></asp:Label>
                <asp:TextBox runat="server" ID="UserRut" class="form-control" name="userRut" placeholder="Ingrese su Rut" required="" autofocus="" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserRut" CssClass="field-validation-error" ErrorMessage="Elemplo:18.699.699-9" /><br />

                <asp:Label ID="Label_clave" runat="server" AssociatedControlID="UserClave" Text="Clave Usuario"></asp:Label>
                <asp:TextBox runat="server" ID="UserClave" TextMode="Password" type="password" class="form-control" name="UserClave" placeholder="Ingrese su Clave" required="" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserClave" CssClass="field-validation-error" ErrorMessage="Error al ingresar la clave" />
                <br/>

                <asp:CheckBox runat="server" ID="RememberMe" type="checkbox" value="remember-me" name="rememberMe" />
                <asp:Label ID="Label_rem" runat="server" AssociatedControlID="RememberMe" CssClass="checkbox" Text=" Remember me"></asp:Label>

                 <asp:Button ID="Button_login" runat="server"  Text="Ingresar" class="btn btn-lg btn-primary btn-block" OnClick="Button_login_Click" />

            </div>
        </div>
    </form>
</body>
</html>
