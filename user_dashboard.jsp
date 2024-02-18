<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="mystyle.css" type="text/css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <c:import url="header2.jsp" />

    <div class="container-fluid">
        <!-- conditionally we have to show the different menu bars according to the userType -->
        <c:choose>
            <c:when test="${user.userType == 2}">          <!-- if buyer = 2-->  
                <c:import url="buyer_menu.jsp" />
                <!-- <div class="btn btn-secondary shadow mt-5 mr-5"  data-toggle="modal" id="showAP">show</div> -->
                <br>
                <div class=" mt-5 container-fluid">
                    <div class="row ">
                        <div class="col" id="hv">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <c:forEach var="product" items="${products}">
                                <div class="card md-4 mb-3 text-center d-inline-block" style="max-width: 600px;">
                                    <div class="card" style="width: 20rem;">
                                        <img src="download_image.do?product_id=${product.productId}&count=1" class="card-img-top" style="height: 200px;">
                                        <div class="card-body" style="height: 250px">
                                            <!-- <div id="image_box"></div> -->
                                            <h5 class="card-title" style="text-decoration:underline;" onclick="func3('${product.productId}')">${product.name}</h5>
                                            <hr>
                                            <h6 class="card-title text-left">Mrp: ${product.mrp}/-</h6>
                                            <h6 style="color: red;" class="text-left">Discount:  - ${product.discount}%</h6>
                                            <hr>
                                            <div class="text-center pb-2 mb-2">
                                                <a href="#" class="btn btn-primary btn-sm" onclick="addToCart('${product.productId}')">Add to Cart</a>
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
            </c:when>
        <c:otherwise>                                        <!-- if seller = 1 -->
            <c:import url="seller_menu.jsp" />
            <!-- banner -->
            <div class="container-fluid px-1">
                <div class="jumbotron primary-background2 text-white banner-background">
                    <div class="container">
                        <h3 class="display-3 text-center" style="font-style: italic;"><b> Thankyou for working with us!</b></h3>
                        <div style="font-size: large;">
                            <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output.[citation needed] Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                            <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos.</p>
                        </div>
                    </div>
                </div>
            </div>
        </c:otherwise>
        </c:choose>
    </div>
    
    <%@ include file="footer.jsp" %>

    <script>
        // var showAP = document.querySelector('#showAP');
        // showAP.addEventListener('click',()=>{
        //     console.log('abc');
        //     window.location.href = 'collect_all_products.do';
        // });

        ///////////////////////////////////////////////////////////////
        const addToUserCart = async (productId) => {
            const url = 'add_to_cart.do?pid='+productId;
            console.log(url);
            
            let result = await fetch(url);
            let resp = await result.text();
            
            return resp;
        };

        function addToCart(productId) {
            addToUserCart(productId).then((data) => {
                window.alert('added succesfully');
            }).catch((err)=>{
                console.log(err);
            });
        }
        
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