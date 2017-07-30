<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RestService._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <button onclick="doWork(); return false;"> DoWork </button>
        <button onclick="DoSquare(); return false;"> DoSquare </button>
        <button onclick="DoAddValues(); return false;"> DoAddValues </button>

        <input type ="text" id="squareValue" />
    </div>

    <script type="text/javascript">
        function doWork(){
            console.info("DoWork");

            $.ajax({
                url: "Service/Service1.svc/DoWork",
                type: "GET",
                dataType: "json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function DoSquare() {
            var value = $("#squareValue").val(); //get the value from the input field
            $.ajax({
                url: "Service/Servsvc/DoSquare",
                type: "POST",
                data: JSON.stringify(value), //send data to the service
                dataType: "json",
                contentType: "application/json",
                success: function (result) {
                    console.info(result);
                }
            });
        }

        function DoAddValues() {

            var addValues = {//JS object

                "Value1": 2,
                "Value2": 3
            };

            $.ajax({
                url: "Service/Service1.svc/DoAddValues",
                type: "POST",
                data: JSON.stringify(addValues),//sent and seralize data
                dataType: "json",
                contentType: "application/json",
                success: function (result) {//gets result
                    console.info(result);
                }
            });
        }




        </script>

</asp:Content>
