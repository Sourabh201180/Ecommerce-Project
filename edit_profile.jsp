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

    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />

    <style>
        #city_list {
            position: absolute;
            top: 68px;
            left: 0px;
            border: 2px solid #999;
            background-color: white;
        }

        #ct_box {
            position: relative;
        }

        .ct_rec {
            font-size: 18px;
            font-weight: bold;
            font-family: verdana;
            padding: 6px 12px;
            cursor: pointer; 
        }

        .ct_rec:hover {
            background-color: #eee;
        }
    </style>
</head>
<body>
    <%-- <%@ include file="header.jsp" %> --%>

    <c:import url="header.jsp" />
    <c:import url="header2.jsp" />

    <!-- Signin Modal -->
    <div class="modal fade" id="modal_signin">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Sign-In</h3>
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

    <!-- Signup Step 2 Modal -->
    <div class="modal fade" id="save_user_profile_modal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Enter User Details</h3>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- first modal -->
                    <div class="d-block" id="first">
                        <div class="form-group">
                            <label for="address">Address <span class="text-danger">*</span></label> 
                            <textarea name="address" id="address" class="form-control" cols="30" rows="3" placeholder="Enter your Address"></textarea>
                        </div>
                            
                        <div class="form-group" id="ct_box">
                            <label for="city">City <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="city" placeholder="Enter City">
                            <div id="city_list" class="d-none"></div>
                        </div>
                        
                        <div class="form-group">
                            <label for="about">About</label> 
                            <textarea name="about" id="about" class="form-control" cols="30" rows="5" placeholder="Write something about yourself"></textarea>
                        </div>
                        
                        <div class="form-group">
                            <label for="xyz">Upload Your Pic:<span class="text-danger">*</span></label>
                            <div class="dropzone" id="user_pic_upload"></div>
                            <br>
                            <div class="text-center">
                                <input type="button" value="Upload" id="profile_pic_btn" class="mb-2 btn btn-info btn-sm">
                            </div>
                        </div>
                        
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="save_btn">Save</button>
                        </div>
                    </div>
                    
                    <!-- Second modal -->
                    <div class="d-none" id="second">
                        <label for="xyz">Upload Your Seller Cirtificate:<span class="text-danger">*</span></label>
                        <div class="dropzone" id="seller_certificate"></div>
                        <br>
                        <input type="button" value="Upload Certificate" id="upload_cert" class="mb-2 btn btn-info btn-sm">
                        <div class="modal-footer">
                            <button class="btn btn-primary" id="save_seller_btn">Save</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        var user_type = '<%= request.getParameter("userType") %>';

        const save_btn = document.querySelector('#save_btn');
        const save_seller_btn = document.querySelector('#save_seller_btn');
        
        const address = document.querySelector('#address');
        const about = document.querySelector('#about');
        const city = document.querySelector('#city');
        let city_id = null;
        const city_list = document.querySelector('#city_list');

        const first = document.querySelector('#first');
        const second = document.querySelector('#second');

        let sellerCertificate = new Dropzone('#seller_certificate', {
            url: 'upload_seller_certificate_file.do',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jpg,image/jpeg,image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });
        
        const upload_cert = document.querySelector('#upload_cert');
        upload_cert.addEventListener('click', () => {
            sellerCertificate.processQueue();
            console.log('Seller Certificate Uploaded Successfully');
        });
        
        let userPicUpload = new Dropzone('#user_pic_upload', {
            url: 'user_profile_pic_upload.do',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jpg,image/jpeg,image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });
        
        const profile_pic_btn = document.querySelector('#profile_pic_btn');
        profile_pic_btn.addEventListener('click', () => {
            userPicUpload.processQueue();
            console.log('User Profile Pic Uploaded Successfully');
        });
        
        const cityRequest = async () => {
            let result = await fetch('search_city.do?city='+city.value);
            let tmp = await result.json();
            return tmp;
        }

        city.addEventListener('keyup', (e) => {
            var input = e.target.value;
            if(input.length > 2) {
                cityRequest().then((data) => {
                    city_list.innerHTML = null;
                    city_list.classList.replace('d-none', 'd-block');

                    for(var ct of data) {
                        console.log(ct);
                        let elm = document.querySelector('div');
                        elm.className = 'ct_rec';
                        elm.innerText = ct.city;
                        elm.city_id = ct.cityId;
                        elm.addEventListener('click', (e) => {
                            city.value = e.target.innerText;
                            city_id = e.target.city_id;
                            city_list.classList.replace('d-block', 'd-none');
                        });
                        city_list.append(elm);
                    }
                }).catch((err) => {
                    console.log(err);
                });
            }
        });
        
        const saveProfile = async () => {
            const url = 'save_profile.do?address='+address.value+'&city_id='+city_id+'&about='+about.value;
            console.log(url);
            
            let result = await fetch(url);
            let resp = await result.text();
            
            return resp;
        };

        save_btn.addEventListener('click', () => {
            saveProfile().then((data) => {
                console.log('Hello');
                first.classList.replace('d-block', 'd-none');
                
                if(user_type == 1) {                    // Seller
                    second.classList.replace('d-none', 'd-block');
                } 
                else {                                  // Buyer
                    $('#save_user_profile_modal').modal('hide');
                    $('#modal_signin').modal('show');
                }
            }).catch((err) => {
                console.log(err);
            });
        });
        
        save_seller_btn.addEventListener('click', () => {
            second.classList.replace('d-block', 'd-none');
            $('#save_user_profile_modal').modal('hide');
            $('#modal_signin').modal('show');
        })

        $(window).on('load', function () {
            $('#save_user_profile_modal').modal('show');
        });
        </script>
</body>
</html>