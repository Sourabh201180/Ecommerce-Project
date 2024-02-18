<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400&display=swap" rel="stylesheet">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        #h{
            border: 2px solid black;
            margin-left: 20px;
            margin-right: auto;
            display: block;
            width: 45%;
        }
        #gt{
          font-size: 5rem;
        }
        p{
          font-family: 'Open Sans', sans-serif;
          margin-left: 20px;
        }

        .carousel .carousel-item {
          max-height:560px;
        }

        body {
          color: #000;
          overflow-x: hidden;
          height: 100%;
          background-image: linear-gradient(180deg, #fff);
          background-repeat: no-repeat;
        }

        .card {
            box-shadow: 0px 4px 8px 0px #BDBDBD;
        }

        .profile-pic {
            width: 100px !important;
            height: 100px;
            box-shadow: 0px 4px 8px 0px #BDBDBD;
        }

        .owl-carousel .owl-nav button.owl-next, .owl-carousel .owl-nav button.owl-prev {
            background: 0 0;
            color: #1E88E5 !important;
            border: none;
            padding: 5px 20px !important;
            font: inherit;
            font-size: 50px !important;
        }

        .owl-carousel .owl-nav button.owl-next:hover, .owl-carousel .owl-nav button.owl-prev:hover {
            color: #0D47A1 !important;
            background-color: transparent !important;
        }

        .owl-dots {
            display: none; 
        }

        button:focus {
            -moz-box-shadow: none !important;
            -webkit-box-shadow: none !important;
            box-shadow: none !important;
            outline-width: 0;
        }

        .item {
            display: none;
        }

        .next {
            display: block !important;
            position: relative;
            transform: scale(0.8);
            transition-duration: 0.3s;
            opacity: 0.6;
        }

        .prev {
            display: block !important;
            position: relative;
            transform: scale(0.8);
            transition-duration: 0.3s;
            opacity: 0.6;
        }

        .item.show {
            display: block;
            transition-duration: 0.4s;
        }

        @media screen and (max-width: 999px) {
            .next, .prev {
                transform: scale(1);
                opacity: 1;
            }

            .item {
                display: block !important;
            }
        }
        
</style>
</head>
<body>
  <div class="container">
    <div class="row">
      <div class="col-sm">
        <div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
    
          <div class="carousel-inner ">
            <c:forEach var="image" items="${products_images}" varStatus="a">
              <c:choose>
                <c:when test="${a.count==1}">
                  <div class="carousel-item active">
                    <img src="static/images/logo.png" class="d-block w-100 ml-5" alt="...">
                  </div>
                </c:when>
                <c:otherwise>
                  <div class="carousel-item">
                    <img src="static/images/logo.png" class="d-block w-100 ml-5" alt="...">
                  </div>
                </c:otherwise>
              </c:choose>  
            </c:forEach>
          </div>
          <button class="carousel-control-prev" type="button" data-target="#carouselExampleFade" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </button>
          <button class="carousel-control-next" type="button" data-target="#carouselExampleFade" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </button>
        </div>
        <div>
      </div>
      <div class="col-sm">
        <h1 id="gt" class="ml-5 mt-5"><b>About The ${product.name}</b></h1>
        <p style=" word-spacing: 8px;">${product.longContent}</p>
      </div>
    </div>
    

    <!-- review section starts -->
    <!-- <section>
      <div class="row d-flex justify-content-center">
        <div class="col-md-10 col-xl-8 text-center">
          <h3 class="mb-4">Testimonials</h3>
          <p class="mb-4 pb-2 mb-md-5 pb-md-0">
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugit, error amet
            numquam iure provident voluptate esse quasi, veritatis totam voluptas nostrum
            quisquam eum porro a pariatur veniam.
          </p>
        </div>
      </div>
    
      <div class="row text-center">
        <div class="col-md-4 mb-5 mb-md-0">
          <div class="d-flex justify-content-center mb-4">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(1).webp"
              class="rounded-circle shadow-1-strong" width="150" height="150" />
          </div>
          <h5 class="mb-3">Maria Smantha</h5>
          <h6 class="text-primary mb-3">Web Developer</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>Lorem ipsum dolor sit amet, consectetur
            adipisicing elit. Quod eos id officiis hic tenetur quae quaerat ad velit ab hic
            tenetur.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star-half-alt fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
        <div class="col-md-4 mb-5 mb-md-0">
          <div class="d-flex justify-content-center mb-4">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(2).webp"
              class="rounded-circle shadow-1-strong" width="150" height="150" />
          </div>
          <h5 class="mb-3">Lisa Cudrow</h5>
          <h6 class="text-primary mb-3">Graphic Designer</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>Ut enim ad minima veniam, quis nostrum
            exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid commodi.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
        <div class="col-md-4 mb-0">
          <div class="d-flex justify-content-center mb-4">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/Avatars/img%20(9).webp"
              class="rounded-circle shadow-1-strong" width="150" height="150" />
          </div>
          <h5 class="mb-3">John Smith</h5>
          <h6 class="text-primary mb-3">Marketing Specialist</h6>
          <p class="px-xl-3">
            <i class="fas fa-quote-left pe-2"></i>At vero eos et accusamus et iusto odio
            dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti.
          </p>
          <ul class="list-unstyled d-flex justify-content-center mb-0">
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="fas fa-star fa-sm text-warning"></i>
            </li>
            <li>
              <i class="far fa-star fa-sm text-warning"></i>
            </li>
          </ul>
        </div>
      </div>
    </section> -->

    <!--review section ends-->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" rel="stylesheet" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<div class="container-fluid px-3 px-sm-5 my-5 text-center">
    <h4 class="mb-5 font-weight-bold">What Our Client Say</h4>
    <div class="owl-carousel owl-theme">
        <div class="item first prev">
            <div class="card border-0 py-3 px-4">
                <div class="row justify-content-center">
                    <img src="https://i.imgur.com/gazoShk.jpg" class="img-fluid profile-pic mb-4 mt-3">
                </div>
                <h6 class="mb-3 mt-2">Marielle Haag</h6>
                <p class="content mb-5 mx-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim.</p>
            </div>
        </div>
        <div class="item show">
            <div class="card border-0 py-3 px-4">
                <div class="row justify-content-center">
                    <img src="https://i.imgur.com/oW8Wpwi.jpg" class="img-fluid profile-pic mb-4 mt-3">
                </div>
                <h6 class="mb-3 mt-2">Ximena Vegara</h6>
                <p class="content mb-5 mx-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim.</p>
            </div>
        </div>
        <div class="item next">
            <div class="card border-0 py-3 px-4">
                <div class="row justify-content-center">
                    <img src="https://i.imgur.com/ndQx2Rg.jpg" class="img-fluid profile-pic mb-4 mt-3">
                </div>
                <h6 class="mb-3 mt-2">John Paul</h6>
                <p class="content mb-5 mx-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim.</p>
            </div>
        </div>
        <div class="item last">
            <div class="card border-0 py-3 px-4">
                <div class="row justify-content-center">
                    <img src="https://i.imgur.com/T5aOhwh.jpg" class="img-fluid profile-pic mb-4 mt-3">
                </div>
                <h6 class="mb-3 mt-2">William Doe</h6>
                <p class="content mb-5 mx-2">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim.</p>
            </div>
        </div>
    </div>
</div>
  </div>


  <script>
    $(document).ready(function() {
      $('.owl-carousel').owlCarousel({
        mouseDrag:false,
        loop:true,
        margin:2,
        nav:true,
        responsive:{
        0:{ items:1 }, 600:{ items:1 }, 1000:{ items:3 }
      }
    }); 

    $('.owl-prev').click(function() {
      $active = $('.owl-item .item.show');
      $('.owl-item .item.show').removeClass('show');
      $('.owl-item .item').removeClass('next');
      $('.owl-item .item').removeClass('prev');
      $active.addClass('next');
      if($active.is('.first')) {
        $('.owl-item .last').addClass('show');
        $('.first').addClass('next');
        $('.owl-item .last').parent().prev().children('.item').addClass('prev');
      }
      else {
        $active.parent().prev().children('.item').addClass('show');
        if($active.parent().prev().children('.item').is('.first')) {
          $('.owl-item .last').addClass('prev');
        }
        else {
          $('.owl-item .show').parent().prev().children('.item').addClass('prev');
        }
      }
    });

      $('.owl-next').click(function() {
        $active = $('.owl-item .item.show');
        $('.owl-item .item.show').removeClass('show');
        $('.owl-item .item').removeClass('next');
        $('.owl-item .item').removeClass('prev');
        $active.addClass('prev');
        if($active.is('.last')) {
          $('.owl-item .first').addClass('show');
          $('.owl-item .first').parent().next().children('.item').addClass('prev');
        }
        else {
          $active.parent().next().children('.item').addClass('show');
          if($active.parent().next().children('.item').is('.last')) {
            $('.owl-item .first').addClass('next');
          }
          else {
            $('.owl-item .show').parent().next().children('.item').addClass('next');
          }
        }
      });
    });
  </script>
</body>
</html>