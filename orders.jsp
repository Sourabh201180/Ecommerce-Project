<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="mystyle.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    <c:choose>
        <c:when test="${user != null}">         <!-- user is logged in -->
            <c:choose>
                <c:when test="${user.userType == 2}">          <!-- if buyer = 2  ye value nhi aarhi, issiliye otherwise wali condition chl rhi h hr baar-->  
                    <c:import url="buyer_menu.jsp" />
                </c:when>
                <c:otherwise>                                  <!-- if seller = 1 -->
                    <c:import url="seller_menu.jsp" />
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>                          
            <!-- banner -->
            <div class="container-fluid pt-1 px-2">
                <div class="jumbotron primary-background text-white banner-background">
                    <div class="container">
                        <h3 class="display-3 text-center" style="font-style: italic;"><b>Please login to see your orders-cart</b></h3>
                        <div style="font-size: large;">
                            <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                            <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.</p>
                        </div>
                        <button class="btn btn-outline-light btn-lg mr-1" data-toggle="modal" data-target="#modal_signup"><span class="fa fa-user-plus"></span> Start! its free</button>
                        <button class="btn btn-outline-light btn-lg" data-toggle="modal" data-target="#modal_signin"><span class="fa fa-user-circle"></span> Login</button>
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>

    <c:import url="footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>