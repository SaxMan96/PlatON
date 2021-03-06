<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="toolbar.jsp" %>

<!DOCTYPE HTML>
<head>
    <meta charset='UTF-8'>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
          integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

    <!-- webfoonts -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

    <!-- style -->
    <link rel="stylesheet" href="<c:url value='../resources/style.css'/>" type="text/css">
</head>


<body>

    <center>
        <div class="row justify-content-md-center" style="text-align: center">
            <div id="account-info" class="col-sm-8 col-md-6 col-lg-6" style="padding: 30px">
                <div class="card">
                    <div class="card-header card-info">
                        Moje konto
                    </div>
                    <div class="card-block">
                        <p class="card-text" style="text-align: left; padding-left: 10px;">
                            Właściciel konta: ${name} <br>
                            Email: ${email} <br>
                            Typ konta: ${role} <br><br><br>
                        </p>
                        <input class='btn btn-primary float-right' value='Zmień hasło'/>
                    </div>
                </div>
            </div>
            <div id="logo" class="col-sm-2 col-md-4 col-lg-4" style="padding-left: 30px">
                <img src="<c:url value='../resources/images/logo_WEiTI.JPG'/>" style="max-width: 50%" alt="LOGO WEITI"/>
            </div>
        </div>
        <div class="row justify-content-md-center" style="text-align: center">
            <div id="lastestPosts" class="col-sm-10 col-md-10 col-lg-10" style="padding: 30px">
                <div class="card" >
                    <div class="card-header card-info">
                        Aktualności
                    </div>
                    <div class="card-block">
                        <p class="card-text" style="text-align: left">
                            Informacje od dziekanatu
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </center>

    <%@ include file="footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

</body>