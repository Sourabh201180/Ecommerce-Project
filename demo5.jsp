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
    </c:choose>

    <div class=" mt-5 container-fluid">
        <div class="row ">
            <div class="col" id="hv">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="product" items="${prods}">
                    <div class="card md-4 mb-3 text-center d-inline-block" style="max-width: 600px;">
                        <div class="card" style="width: 20rem;">
                            <img src="download_image.do?product_id=${product.productId}&count=1" onclick="func3('${product.productId}')" class="card-img-top" style="height: 200px;">
                            <div class="card-body" style="height: 250px">
                                <h5 class="card-title" style="text-decoration:underline;" onclick="func3('${product.productId}')">${product.name}</h5>
                                <hr>
                                <h6 class="card-title text-left">Mrp: ${product.mrp}/-</h6>
                                <h6 style="color: red;" class="text-left">Discount:  - ${product.discount}%</h6>
                                <hr>
                                <div class="text-center pb-2 mb-2">
                                    <a href="cart.jsp" class="btn btn-primary btn-sm">Add to Cart</a>
                                    &nbsp;
                                    <a href="orders.jsp"class="btn btn-primary btn-sm">Order Now</a>&nbsp;&nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
        </div>
    </div>

    <br>
    <br>
    <br>
    
    <%@ include file="footer.jsp" %>

    <script>
        function func3(productId) {
            window.location.href = "product_info.do?productId="+productId;
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>