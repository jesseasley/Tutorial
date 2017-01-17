<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Learning_App.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.8/angular.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            //alert(angular.version.full + " - " + angular.version.codeName);
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container" id="myApp" ng-app="myApp" ng-controller="myCtrl" ng-init="name='<%=l[1].State %>';phone='123-123-123'">
            <br />
            <table style="width:100%;" border="0">
                <tr>
                    <td style="width:100px;">&nbsp;</td>
                    <td style="width:100px;">
                        Name
                    </td>
                    <td>
                        <input id="txtName" type="text" class="form-control" ng-model="name" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="vertical-align:top;">
                        Phone
                    </td>
                    <td>
                        <input id="txtPhone" type="text" class="form-control" ng-model="phone" />
                        <div ng-show="showInvalidPhoneMessage();">Incorrect format for a phone number. Please use xxx-xxx-xxxx.</div>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>
                        <input type="button" 
                            onclick="alert(angular.element($('#myApp')).scope().showInvalidPhoneMessage()?'Yes, it\'s showing':'No, it\'s not showing');" 
                            value="Is error message showing?" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
<script>

var app = angular.module("myApp", []);

app.controller("myCtrl", function($scope) {
    $scope.showInvalidPhoneMessage = function () {
        if ($scope.phone.match("^[0-9]{3}-[0-9]{3}-[0-9]{4}$")) {
            return false;
        }
        else {
            return true;
        }
    }
});

</script>