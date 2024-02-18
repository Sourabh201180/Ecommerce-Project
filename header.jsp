<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.User" %>

<style>
  #search_list {
    position: absolute;
    /* top: 68px; */
    left: 0px;
    z-index: 8;
    border: 2px solid #999;
    background-color: white; 
  }

  #search_box {
    position: relative;
  }

  .search_rec {
    font-size: 18px;
    font-weight: bold;
    font-family: verdana;
    padding: 6px 12px;
    cursor: pointer; 
    width: 600px;
  }

  .search_rec:hover {
    background-color: #eee;
  }
</style>

<script src="https://www.google.com/recaptcha/api.js" async defer></script>

<!-- Choose Buyer/Seller Modal -->
<div class="modal fade" id="modal_choose">
  <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
          <div class="modal-header">
              <h3 class="modal-title">Select User Type</h3>
              <button class="close" data-dismiss="modal">
                  <span>&times;</span>
              </button>
          </div>
          <div class="modal-body" text-center>
              <div class="container"  style="text-align: center;">
                <div class="row">
                  <div class="col-md-6">
                    Buyer
                    <button type="button" value="2" id="buyer_btn">
                      <img class="img-fluid" src="static/images/buyer.png">
                    </button>
                  </div>
                  <div class="col-md-6">
                    Seller
                    <button type="button" value="1" id="seller_btn">
                      <img class="img-fluid" src="static/images/seller.png">
                    </button>
                  </div>
                </div>
              </div>
          </div>
      </div>
  </div>
</div>

<!-- Signin Modal -->
<div class="modal fade" id="modal_signin">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title"><span class="fa fa-user-plus fa-1x"></span> Sign-In</h3>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="login.do" method="POST">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password">
                    </div>

                    <button type="submit" class="btn btn-primary">SignIn</button>
                </form>
            </div>
            <div class="modal-footer">
                <a href="#" class="mr-auto">Forgot Password?</a>
                <button class="btn btn-info btn-sm" id="signup_btn">Create Account</button>
            </div>
        </div>
    </div>
</div>

<!-- Seller/Buyer SignUp1 Modal -->
<div class="modal fade mb-5" id="modal_signup">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><span class="fa fa-1x fa-user-circle"></span> Sign-up</h3>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="signup_step_1.do" method="post">
                    <!-- Buyer/Seller user name -->
                    <div class="form-group">
                        <label for="na">User Name <span class="text-danger">*</span></label>
                        <input type="text" name="name" id="na" class="form-control" placeholder="Enter name">
                    </div>
                    <!-- email -->
                    <div class="form-group">
                        <label for="em">Email <span class="text-danger">*</span></label>
                        <input type="email" class="form-control" id="em" name="email" placeholder="Enter email">
                    </div>
                    <!-- password -->
                    <div class="form-group">
                        <label for="pa">Password <span class="text-danger">*</span></label>
                        <input type="password" class="form-control" id="pa" name="password" placeholder="Enter password">
                    </div>
                    <!-- contact -->
                    <div class="form-group">
                        <label for="co">Contact <span class="text-danger">*</span></label>
                        <input type="text" maxlength="10" class="form-control" id="co" name="contact" placeholder="Enter mobile no.">
                    </div>

                    <div class="g-recaptcha" data-sitekey="6LfMz3siAAAAAH1SBljQCFek_XiWiW0_DXDo8INU"></div>

                    <button type="submit" class="btn btn-primary mt-3">Save and Next...</button>
                    
                    <!-- <div class="form-group text-right mt-3">
                      <button type="submit" class="btn btn-info btn-sm">Save & Continue</button>
                    </div> -->
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-info btn-sm" id="signin_btn">Sign-In</button>
            </div>
        </div>
    </div>
</div>

<!-- Seller/Buyer Profile Update Modal -->
<div class="modal fade mb-5" id="profile_update_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title"><span class="fa fa-1x fa-user-circle"></span> Update Profile</h3>
                <button class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- Buyer/Seller user name -->
                <div class="form-group">
                    <label for="na">User Name <span class="text-danger">*</span></label>
                    <input type="text" name="name" id="u_na" class="form-control" placeholder="Enter name">
                </div>
                <!-- email -->
                <div class="form-group">
                    <label for="u_em">Email <span class="text-danger">*</span></label>
                    <input type="email" class="form-control" id="u_em" name="email" placeholder="Enter email">
                </div>
                <!-- contact -->
                <div class="form-group">
                  <label for="u_co">Contact <span class="text-danger">*</span></label>
                  <input type="text" maxlength="10" class="form-control" id="u_co" name="contact" placeholder="Enter mobile no.">
                </div>
                <!-- Dob -->
                <div class="form-group">
                    <label for="u_dob">Date of Birth <span class="text-danger">*</span></label>
                    <input type="date" class="form-control" id="u_dobr" name="dob" placeholder="Enter Your Date of Birth">
                </div>
                <!-- Gender -->
                <div class="form-group">
                    <label for="u_gen">Gender <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="u_gen" name="gender" placeholder="Enter Your Gender">
                </div>
                <!-- address -->
                <div class="form-group">
                    <label for="u_addr">Address <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="u_addr" name="address" placeholder="Enter Your Full Address">
                </div>
                <!-- about -->
                <div class="form-group">
                    <label for="u_abo">About <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="u_abo" name="about" placeholder="Enter About Yourself">
                </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>&nbsp;
              <button class="btn btn-primary" id="update_profile_btn">Update</button>
            </div>
        </div>
    </div>
</div>

<!-- starting of profile modal -->
<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header primary-background text-white text-center">
          <h5 class="modal-title" id="exampleModalLabel"> Profile</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="contatiner text-center">
            <!-- <img src="static/images/default.png" class="img-fluid" style="border-radius: 50%; max-width: 150px;"></img> -->
            <img src="download_image.do?user_id=${user.userId}&user_type=${user.userType}&count=3" class="img-fluid" style="border-radius: 50%; max-width: 150px;"></img>
            <br>
            <h5 class="modal-title mt-3" id="exampleModalLabel"> ${user.name} </h5>

            <!-- details -->
            <table class="table">
              <tbody>
                <tr>
                  <th scope="row">Contact: </th>
                  <td> ${user.contact} </td>
                </tr>
                <tr>
                  <th scope="row">Email: </th>
                  <td> ${user.email} </td>
                </tr>
                <tr>
                  <th scope="row">D.O.B: </th>
                  <td> ${user.dob} XX-XX-XXXX </td>
                </tr>
                <tr>
                  <th scope="row">Gender: </th>
                  <td> ${user.gender} --------- </td>
                </tr>
                <tr>
                  <th scope="row">Address: </th>
                  <td> ${user.address} </td>
                </tr>
                <tr>
                  <th scope="row">About: </th>
                  <td> ${user.about}</td>
                </tr>
                <c:choose>
                  <c:when test="${user.userType == 1}">          <!-- if seller = 1 -->  
                    <tr>
                      <th scope="row">Certificate: </th>
                      <td>
                        <img src="download_image.do?certificate_path=${user.certificate}&count=4" class="img-fluid" style="max-width: 150px;"></img>
                      </td>
                    </tr>
                  </c:when>
                </c:choose>
              </tbody>
            </table>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn-sm btn-secondary" data-dismiss="modal">Close</button>&nbsp;
          <button type="button" class="btn-sm btn-primary" onclick="funcUpdateUserProfile('${user.userId}')">Edit</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ending of profile modal -->

<!-- header -->
<nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-dark">
    <a href="index.jsp" class="navbar-brand" style="font-weight: bolder; font-style: oblique; font-size: x-large;">
        <img src="static/images/logo.png" height="33" width="70px" alt="logo" class="mr-1">
        CARRERS
    </a>

    <button class="navbar-toggler" data-toggle="collapse" data-target="#header_options">
        <span class="navbar-toggler-icon"></span>                                           <!-- This is for showing more options in a mobile view -->
    </button>

    <div class="collapse navbar-collapse" id="header_options">
      <ul class="navbar-nav">
          <li class="nav-item active ml-5">
            <div id="search_box">
              <input type="search" class="form-control text-center" id="search" style="width: 600px;" placeholder="Search for Product" aria-label="Search">
              <div id="search_list" class="d-none"></div>
            </div>
          </li>
          <li class="nav-item active ml-3">
            <button type="submit" class="btn btn-outline-light" style="position: absolute;" id="search_btn">Search</button>
          </li>
      </ul>
    </div>
    <div class="mr-2">
      <c:choose>
        <c:when test="${user == null}">
          <button class="btn btn-outline-light mr-2" data-toggle="modal" data-target="#modal_signin"><span class="fa fa-user-circle"></span> SignIn </button>
        </c:when>
        <c:otherwise>
          <a href="cart.do" class="navbar-brand">
            <button class="btn btn-outline-light"><span class="fa fa-shopping-cart"></span> Cart</button>
          </a>   
          <a href="orders.jsp" class="navbar-brand" style="color: #2a1e16;position: relative;">   
            <button class="btn btn-outline-light">My Orders</button>
          </a>
        </c:otherwise>
      </c:choose>
    </div>
</nav>

<script>
    const u_na = document.querySelector('#u_na');
    const u_em = document.querySelector('#u_em');
    const u_co = document.querySelector('#u_co');
    const u_addr = document.querySelector('#u_addr');
    const u_abo = document.querySelector('#u_abo');
    const u_dob = document.querySelector('#u_dob');
    const u_gen = document.querySelector('#u_gen');

    var user_id = null; 

    const getUserInfo = async (userId) => {
      let response = await fetch('fetch_user_info.do?uid='+userId);
      let result = await response.json();

      return result;
    };

    function funcUpdateUserProfile(userId) {
      user_id = userId;
      getUserInfo(userId).then((data) => {
        console.log(data);
        $('#profile-modal').modal('hide');
        $('#profile_update_modal').modal('show');

        u_na.setAttribute("value", data.name);
        u_em.setAttribute("value", data.email);
        u_co.setAttribute("value", data.contact);
        u_addr.setAttribute("value", data.address);
        u_abo.setAttribute("value", data.about);
        // //////////////////////////////////////////////////////////
        if(data.dob != null) {
          u_dob.setAttribute("value", data.dob);
        } else {
          u_dob.setAttribute("value",2010-10-10);
        }
        if(data.gender != null) {
          u_gen.setAttribute("value", data.gender);
        } else {
          u_gen.setAttribute("value", "Male");
        }
        // //////////////////////////////////////////////////////////
      });
    };

    const updateUserProfile = async () => {
      const url = 'update_user_profile.do?user_name='+u_na.value+'&user_email='+u_em.value+'&user_contact='+u_co.value+'&user_address='+u_addr.value+'&user_about='+u_abo.value+'&user_dob='+u_dob.value+'&user_gender='+u_gen.value+'&user_id='+user_id;
      console.log(url);
      
      let result = await fetch(url);
      let resp = await result.text();
      
      return resp;
    };
    
    var update_profile_btn = document.querySelector('#update_profile_btn');
    update_profile_btn.addEventListener('click', () => {
      updateUserProfile().then((data) => {
        $('#profile_update_modal').modal('hide');
        window.location.reload();
      }).catch((err) => {
          console.log(err);
      });
    });

    const search_btn = document.querySelector('#search_btn');
    const pros = document.querySelector('#pros');
    search_btn.addEventListener('click', () => {
      window.location.href = 'demo5.jsp';
    });

    const search = document.querySelector('#search');
    let search_id = null;
    const search_list = document.querySelector('#search_list');

    const searchRequest = async () => {
      let result = await fetch('search_products.do?srch_prod='+search.value);
      let temp = await result.json();
      return temp;
    }

  search.addEventListener('keyup', (e) => {
    var input = e.target.value;
    if(input.length>2) {
      searchRequest().then((data) => {
        search_list.innerHTML = null;
        search_list.classList.replace('d-none', 'd-block');
        
        for(var srch of data) {
          console.log(srch);
          let elm = document.querySelector('div');
          elm.className = 'search_rec';
          elm.innerText = srch.name;
          elm.addEventListener('click', (e) => {
            search.value = e.target.innerText;
            // search.classList.add('box overlay');
            search_list.classList.replace('d-block', 'd-none');
          });
          search_list.append(elm);
        }
      }).catch((err) => {
        console.log(err);
      });
    }
  });

  const signin_btn = document.querySelector('#signin_btn');
  const signup_btn = document.querySelector('#signup_btn');
    
  signin_btn.addEventListener('click', () => {
    $('#modal_signup').modal('hide');
    $('#modal_signin').modal('show');
  });
    
  signup_btn.addEventListener('click', () => {
    $('#modal_signin').modal('hide');
    $('#modal_choose').modal('show');
  });
    
  const buyer_btn = document.querySelector('#buyer_btn');
  const seller_btn = document.querySelector('#seller_btn');
  var user_type = document.querySelector('#user_type');
  
  buyer_btn.addEventListener('click', () => {
    user_type = buyer_btn.value;
    console.log(user_type);
    userModal().then((data) => {
      $('#modal_choose').modal('hide');
      $('#modal_signup').modal('show');
    }).catch((err) => {
      console.log(err);
    });
    // let elm = document.createElement('input');
    // console.log(elm);
    // elm.type = 'hidden';
    // elm.value = buyer_btn.value;
    // elm.id = 'user_type';
    // elm.innerHTML = buyer_btn.value;
    // golu.append(elm);
    // window.location.href = 'signup_step_1.do?user_type='+user_type;
  });
  
  seller_btn.addEventListener('click', () => {
    user_type = seller_btn.value;
    console.log(user_type);
    userModal().then((data) => {
      $('#modal_choose').modal('hide');
      $('#modal_signup').modal('show');
    }).catch((err) => {
      console.log(err);
    });

    // let elm = document.createElement('input');
    // console.log(elm);
    // elm.type = 'hidden';
    // elm.value = seller_btn.value;
    // elm.id = 'user_type';
    // elm.innerHTML = buyer_btn.value;
    // golu.append(elm);
    // user_type.innerHtml.value = seller_btn.value;
    // window.location.href = 'signup_step_1.do?user_type='+user_type;
    // $('#modal_choose').modal('hide');
    // $('#modal_signup').modal('show');
  });

  const userModal = async () => {
    let url = 'signup_step_1.do?golu='+user_type;
    console.log(url);
    let result = await fetch(url);
    let resp = await result.text();

    return resp;
  }
</script>