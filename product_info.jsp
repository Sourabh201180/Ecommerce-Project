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

    <style>
        #golu {
            font-size: 2.5rem;
            font-weight: revert;
            line-height: 1.2;
        }
    </style>
</head>
<body>
    <%@ include file="header.jsp" %>
    <c:choose>
        <c:when test="${user eq null}">
            <c:import url="header2.jsp" />
            <nav class="mt-2">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item">
                        <a href="index.jsp">Dashboard</a>
                    </li>
                    <li class="breadcrumb-item">
                        <a href="collect_all_products.do?type=0">products</a>
                    </li>
                    <li class="breadcrumb-item active">${product.name}</li>
                </ol>
            </nav>
        </c:when>
        <c:otherwise>                                     
            <div class="container-fluid">
                <!-- conditionally we have to show the different menu bars according to the userType -->
                <c:choose>
                    <c:when test="${user.userType == 2}">          <!-- if buyer = 2  ye value nhi aarhi, issiliye otherwise wali condition chl rhi h hr baar-->  
                        <c:import url="buyer_menu.jsp" />
                        <nav class="mt-4">
                            <ol class="breadcrumb">
                                <!-- <li class="breadcrumb-item">
                                    <a href="user_dashboard.jsp">Dashboard</a>
                                </li> -->
                                <li class="breadcrumb-item">
                                    <a href="collect_all_products.do?type=1">products</a>
                                </li>
                                <li class="breadcrumb-item active" id="showP">${product.name}</li>
                            </ol>
                        </nav>
                    </c:when>
                    <c:otherwise>                                     
                        <c:import url="seller_menu.jsp" />
                        <nav class="mt-4">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="user_dashboard.jsp">Dashboard</a>
                                </li>
                                <li class="breadcrumb-item">
                                    <a href="seller_products.do">products</a>
                                </li>
                                <li class="breadcrumb-item active" id="showP">${product.name}</li>
                            </ol>
                        </nav>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:otherwise>
    </c:choose>

    <input type="hidden" id="product_id_" value="${product.productId}">
    <div class="container-fluid">
    <div class="row">
        <!-- <h5 class="display-3 text-center" id="golu">${product.name}</h5> -->
        <div id="carouselExampleCaptions" class="carousel slide col-md-6" data-ride="carousel">
            <div class="carousel-inner w-75">
                <c:forEach var="productImage" items="${productImages}" varStatus="a">
                    <c:choose>
                        <c:when test="${a.count==1}">
                            <div class="carousel-item active ">
                                <img src="download_image.do?image_path=${productImage}&count=2" class="d-block img-fluid  " style="height: 600px;" alt="productPhotu">
                            </div>
                            <!-- <div class="carousel-caption d-none d-md-block">
                            <h5>First slide label</h5>
                            <p>Some representative placeholder content for the first slide.</p>
                            </div> -->
                        </c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <img src="download_image.do?image_path=${productImage}&count=2" class="d-block img-fluid  " style="height: 600px;" alt="productPhotu">
                            </div>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </button>
                <button class="carousel-control-next w-25 " type="button" data-target="#carouselExampleCaptions" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only ">Next</span>
                </button>
                
            </div>
        </div>
        <div class="col-md-6" style="margin-top:40px;color: #2a1e16;font-weight: 500;font-size: large;font-family: Georgia, 'Times New Roman', Times, serif;" > 
            <div style="font-size:25px; font-weight: 2000;">
                <p class="text-center container">${product.smallDesc}</p>
            </div>
            <div class="container" style="font-size: x-large; font-weight: 100;">
                <div class="row">
                    <div class="col-5">
                        <p class="text-center container" style="margin-top:40px;">Quantity:${product.quantity}</p>
                        <p class="text-center container" style="margin-top:40px;">MRP: ${product.mrp}/-</p>
                        <p class="text-center container" style="margin-top:40px;">discount: ${product.discount}%</p>
                    </div>
                    <div class="col-5">
                        <p class="text-center container" style="margin-top:40px;"> gift charges: ${product.giftCharge}</p>
                        <p class="text-center container" style="margin-top:40px;">delivery charges: ${product.deliveryCharge}</p>
                    </div>
                </div>
            </div>
            <div class="text-center container" style="margin-top:40px;color: #2a1e16;font-weight: 500;font-size: 25px;font-family: Georgia, 'Times New Roman', Times, serif;" >Product Details:</div>
            <div style="margin-top:40px;color: #2a1e16;font-weight: 500;font-size:25px;font-family: Georgia, 'Times New Roman', Times, serif;">
                <p class="text-center">${product.longDesc}</p>
            </div>
        </div>
    </div>
    <button id="bt" style="width: 250px;margin-top: 20px;" >ADD TO CART </button> &nbsp;&nbsp;&nbsp;
    <button id="bt" style="width: 250px;" >BUY NOW</button>

    <input type="hidden" id="product_id_" value="${product.productId}">

    <div class="container-fluid pt-0 px-1">
        <div class="jumbotron primary-background2 text-white banner-background">
            <!-- <div class="container-fluid">
                <h5 class="display-3 text-center" id="golu">${product.name}</h5>
                <br>
                <div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner" id="bholu">
                        <c:forEach var="productImage" items="${productImages}" varStatus="a">
                            <c:choose>
                                <c:when test="${a.count==1}">
                                    <div class="carousel-item active">
                                        <img src="download_image.do?image_path=${productImage}&count=2" class="d-block w-100 ml-5" style="height: 500px;" alt="productPhotu">
                                    </div>
                                    <div class="carousel-caption d-none d-md-block">
                                      <h5>First slide label</h5>
                                      <p>Some representative placeholder content for the first slide.</p>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="carousel-item">
                                        <img src="download_image.do?image_path=${productImage}&count=2" class="d-block w-100 ml-5" style="height: 500px;" alt="productPhotu">
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </button>
                    </div>
                </div>
                <br>
                <br>
                <div style="font-style:oblique; font-size: x-large; font-weight: 1000;">
                    <p class="text-center container">${product.smallDesc}</p>
                </div>
                <div class="container" style="font-size: x-large; font-weight: 100;">
                    <div class="row">
                        <div class="col-5">
                            <p class="text-center container">Quantity: ${product.quantity}</p>
                            <p class="text-center container">MRP: ${product.mrp}/-</p>
                            <p class="text-center container">discount: ${product.discount}%</p>
                        </div>
                        <div class="col-5">
                            <p class="text-center container">gift charges: ${product.giftCharge}</p>
                            <p class="text-center container">delivery charges: ${product.deliveryCharge}</p>
                        </div>
                    </div>
                </div>
                <div style="font-size: larger; font-weight: 500;">
                    <p class="text-center">${product.longDesc}</p>
                </div>
                <br> 
                <div class="card-columns" id="all_images_box"></div>
                <br>
                <br>
            </div> -->
        </div>
    </div>

    <p style="margin-left: 25px; font-family: Verdana, Geneva, Tahoma, sans-serif; font-size: larger; font-weight: 200;">
        Similar Products
    </p>

    <hr>
    <div class="container-fluid">
        <div class="row">
            <div class="col" id="hv">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="product" items="${subsequentProducts}">
                    <div class="card md-4 mb-3 text-center d-inline-block" style="max-width: 600px;">
                        <div class="card" style="width: 20rem;">
                            <img src="download_image.do?product_id=${product.productId}&count=1" onclick="getProdInfo('${product.productId}')" class="card-img-top" style="height: 200px;">
                            <div class="card-body" style="height: 250px">
                                <h5 class="card-title" style="text-decoration:underline;" onclick="getProdInfo('${product.productId}')">${product.name}</h5>
                                <hr>
                                <h6 class="card-title text-left">Mrp: ${product.mrp}/-</h6>
                                <h6 style="color: red;" class="text-left">Discount:  - ${product.discount}%</h6>
                                <hr>
                                <a href="#" class="btn btn-primary btn-sm" onclick="addToCart('${product.productId}')">Add to Cart</a>
                                &nbsp;
                                <a href="orders.jsp"class="btn btn-primary btn-sm">Order Now</a>&nbsp;&nbsp;
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
        </div>
    </div>
    <hr>

    <br>

    <div class="container">
        <h4 style="text-align: center;">Reviews</h4>
        <!-- collect all reviews -->
        <c:choose>
            <c:when test="${user == null}">
                <h6 style="text-align: center;">your are not logged in, please login to starting reviewing! or if you want to comment</h6>
            </c:when>
            <c:otherwise>
                <div>
                    <form action="review.do?count=1&productId=${product.productId}" method="post">
                        <div class="bg-light p-2">
                            <input type="hidden" id="productId" name="productId" value="8">
                            <div class="d-flex flex-row align-items-start"><img class="rounded-circle" src="static/images/review.jpg" width="40">
                                <textarea class="form-control ml-1 shadow-none textarea" cols="10" rows="3" id="description" name="description" placeholder="Add a comment.."></textarea>
                            </div>
                            <div class="mt-2 text-right">
                                <button class="btn btn-primary btn-sm shadow-none" type="submit" id="post_btn">Post comment</button>
                            </div>
                        </div>
                    </form>
                </div>
            </c:otherwise>
        </c:choose>
        
        <!-- review section starts -->
        <c:forEach var="arv" items="${allReviews}">
            <div class="card" style="margin: 10px 20px;">
                <div class="card-header">
                    <img src="download_image.do?user_id=${arv.user.userId}&count=3" data-toggle="modal" data-target="#profile-modal" style="border-radius: 50%; max-height: 40px;" class="round img-fluid mt-1"></img>
                    <!-- <img src="static/images/techblog.png" height="30px"> -->
                    <span">&nbsp;   ${arv.user.name}</span>
                    <span class="stars ml-5">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                    </span>
                </div>
                <div class="card-body">
                    <blockquote class="blockquote mb-0">
                        <p>${arv.review}</p>
                    </blockquote>
                </div>
            </div>
        </c:forEach>
    </div>

    <br>
    <br>
    
    <%@ include file="footer.jsp" %>

    <script>
        function getProdInfo(productId) {
            window.location.href = "product_info.do?productId="+productId;
        }

        const product_id_ = document.querySelector('#product_id_');
        const all_images_box = document.querySelector('#all_images_box');
        
        const fetchProductpics = async () => {
            console.log("++++");
            let resp = await fetch('fetch_product_all_images.do?productId='+product_id_.value);
            console.log(resp);
            let result = await resp.json();
            
            return result;
        }
        
        const allImageReq = async () => {
            fetchProductpics().then((data)=> {
                all_images_box.innerHTML = null;
                for(let pic_path of data) {
                    let div = document.createElement('div');
                    // div.classList.add('image_box');
                    // div.classList.add('m-auto');
                    div.classList.add('card');
                    all_images_box.append(div);

                    let img = document.createElement('img');
                    img.style='border: 1px solid black'; 
                    img.src = 'download_image.do?image_path='+pic_path+'&count=2';
                    img.classList.add('img-fluid');
                    img.classList.add('card-img-top');
                    div.append(img);
                }
            }).catch((err)=>{
                console.log(err);
            });
        }

        allImageReq();

        const fetchProductReviews = async () => {
            let resp = await fetch('product_reviews.do?productId='+product_id_.value);
            let result = await resp.json();

            console.log(result);
            
            return result;
        }
        
        const allProductReviewReq = async () => {
            fetchProductReviews().then((data)=> {
                console.log('review collected');
            }).catch((err)=>{
                console.log(err);
            });
        }

        allProductReviewReq();

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
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>