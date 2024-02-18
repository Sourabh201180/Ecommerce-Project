<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User,models.CartProduct" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA==" crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
    <link rel="stylesheet" href="static/css/mystyle.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
    /* #c {
        top: 40px;
        left: 80px;
    }
    */
    #sum {
        border: 1px solid #f0cfba;
        border-radius: 25px;
        width: 330px;
        height: 145px;
        top:60px;
        position: relative;
    }
    /*
    #card {
        border: 1px solid #f0cfba;
        border-radius: 25px;
        width: 825px;
        height: 250px;
        top:60px;
        position: relative;
        left: 110px;
    }
    #im {
        border-radius: 47px;
        width: 273px;
        height: 250px;
        padding: 30px;
        position: relative;
    }
    */
    #txt {
        padding-top: 27px;
        font-size: larger;
        font-weight: 300;
    }
    #qua {
        position: relative;
        top: 10px;
        left: 109px;
        width: 127px;
        border-radius: 10px;
    }
    #check{
            background-color: #b68c6e;
            border-radius: 10px;
            border: none;
            color: #2a1e16;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            position: relative;
            left: 34px;
            height: 48px;
            top: -78px;
            width: 50%;
    }
</style>
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
                    </div>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
    
    <div class="row">
        <div class="col-md-8 mt-5 container-fluid">
            <div class="row ">
                <div class="col" id="hv">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <c:forEach var="cartProduct" items="${cartProducts}">
                        <div class="mt-3 text-center d-inline-block" style="max-width: 600px;">
                            <div class="card" style="width: 20rem;">
                                <img src="download_image.do?product_id=${cartProduct.product.productId}&count=1" onclick="func3('${cartProduct.product.productId}')" class="card-img-top" style="height: 200px;">
                                <p id="txt">${cartProduct.product.name}</p>
                                <P style="font-size: 20px; " >&#x20B9; ${cartProduct.product.mrp}</P>
                                <div class="input-group" id="qua">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default btn-subtract" type="button" style="border-radius: 8px;background-color: #b68c6e;">-</button>
                                    </span>
                                    <input type="text" class="form-control no-padding text-center item-quantity" value="${cartProduct.quantity}" style="border-radius: 5px;background-color: #e1d1c6;">
                                    <span class="input-group-btn">
                                        <button class="btn btn-default btn-add" type="button" style="background-color: #b68c6e;">+</button>
                                    </span>
                                </div>
                                <br>
                                <p style="font-size: 18px; text-decoration: underline;" >Remove</p>    
                            </div>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </c:forEach>
                </div>
            </div>
        </div>

        <div class="col-md-2" style="height: 346px;">
            <div class="mt-3" id="log">
                <p style="font-family: Georgia, 'Times New Roman', Times, serif;font-weight: 400;font-size: 30px;left:111px; top: 44px; position: relative; ">Basket(2 items)</p>
                <p style="font-family: Georgia, 'Times New Roman', Times, serif;font-weight: 500;font-size: 30px; top: 44px; position: relative; ">Order Summary</p>
                <div id="sum">
                    <p style="position: relative;left: 10px;font-size: 22px;padding-left: 20px;padding-top: 20px;" class="link-secondary  link-underline-opacity-100-hover" >
                        Subtotal
                        <p style="padding: 20px;font-size: 20px;position: relative;left: 235px;top: -69px; " >&#x20B9;799</p>
                    </p>
                    <button type="submit" class="btn w-75" id="check">Check out</button>
                </div>
            </div>
        </div>

        <div class="col-md-2"></div>
    </div>

    <c:import url="footer.jsp" />

    <script>
        ///////////////////////////////////////////////////////////////
        function func3(productId) {
            window.location.href = "product_info.do?productId="+productId;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>