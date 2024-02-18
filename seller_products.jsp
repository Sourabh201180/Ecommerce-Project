<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category,models.User,models.Product" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <script src="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone-min.js"></script>
    <link href="https://unpkg.com/dropzone@6.0.0-beta.1/dist/dropzone.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <c:import url="header2.jsp" />

    <!-- Add Product Modal -->
    <div class="modal fade" id="add_product_modal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">
                        <c:choose>
                            <c:when test="${uProduct eq null}"> 
                                Enter Prdouct Details
                            </c:when>
                            <c:otherwise>                                     
                                Update Product Details
                            </c:otherwise>
                        </c:choose>
                    </h3>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="d-block" id="first">
                        <div class="form-group">
                            <label for="pr_name">Product Name<span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="product_name" id="pr_name" placeholder="Enter product name, which will be shown to buyer" value="">
                        </div>
                        <div class="form-group">
                            <label for="pr_category">Category<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="pr_category" name="product_category" value=""></select>
                        </div>
                        <div class="form-group">
                            <label for="pr_sub_category">SubCategory<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="pr_sub_category" name="product_sub_category" value=""></select>
                        </div>
                        <div class="form-group">
                            <label for="pr_quantity">Quantity<span class="text-danger">*</span></label>
                            <input type="number" class="form-control" name="product_quantity" id="pr_quantity" placeholder="Enter the quantity of products" value="">
                        </div>
                        <div class="form-group">
                            <label for="pr_mrp">MRP<span class="text-danger">*</span></label>
                            <input type="number" class="form-control" name="product_mrp" id="pr_mrp" placeholder="Enter MRP(Inclusive of all taxes)" value="">
                        </div>
                        <div class="form-group">
                            <label for="charges">Select Additional Charges(if applied)</label>
                            <br>
                            <div>
                                <input type="checkbox" id="dis" name="discount" value="1" onclick="func(this)">&nbsp;Discount
                            </div>
                            <div id="cont1" class="d-none form-group">
                                <input type="float"class="form-control" name="product_discount" value="0" id="pr_discount" placeholder="Enter Discount">
                            </div>
    
                            <div>
                                <input type="checkbox" id="del_crg" name="delivery_charge" value="2" onclick="func(this)">&nbsp;Deliver Charges
                            </div>
                            <div id="cont2" class="d-none form-group">
                                <input type="number"class="form-control" name="product_delivery_charge" value="0" id="pr_delivery_charge" placeholder="Enter Delivery Charges">
                            </div>
                                
                            <div>
                                <input type="checkbox" id="gift_crg" name="gift_charge" value="3" onclick="func(this)">&nbsp;Gift Charges
                            </div>
                            <div id="cont3" class="d-none form-group">
                                <input type="number"class="form-control" name="product_gift_charge" value="0" id="pr_gift_charge" placeholder="Enter Gift Charges">
                            </div>
                        </div>
    
                        <div class="form-group">
                            <label for="pr_short_content">Short content:<span class="text-danger">*</span></label>
                            <textarea name="product_short_content" id="pr_short_content" class="form-control" rows="3" placeholder="Write Sort Content(Description) about your product" value=""></textarea>
                        </div>
                        <div class="form-group mb-4">
                            <label for="pr_long_content">Long content:<span class="text-danger">*</span></label>
                            <textarea name="product_long_content" id="pr_long_content" class="form-control" rows="5" placeholder="Write Long Content(Description) about your product" value=""></textarea>
                        </div>
                        <div class="form-group text-right mt-3 d-block" id="svAdProd">
                            <button class="btn btn-info btn-sm" id="save_product_btn">Save & Add Pics</button>
                        </div>
                        <div class="form-group text-right mt-3 d-none" id="upAdProd">
                            <button class="btn btn-info btn-sm" id="update_product_btn">Update & Add Pics</button>
                        </div>
                    </div>
                    <div class="d-none" id="second">
                        <label for="xyz">Upload Single(Primary) pic:<span class="text-danger">*</span></label>
                        <div class="dropzone" id="singlepicupload"></div>
                        <br>
                        <label for="xyz">Upload Multiple(Secondary) pics:<span class="text-danger">*</span></label>
                        <div class="dropzone" id="multiplepicupload"></div>
                        <br>
                        <input type="button" value="Upload" id="pic_btn" class="mb-2 btn btn-info btn-sm">
                    </div>
                    <div class="d-none" id="final_submit">
                        <div class="modal-footer d-block" id="svProduct">
                            <button type="submit" class="btn btn-primary" id="save_product_pic_btn">Save Product</button>
                        </div>
                        <div class="modal-footer d-none" id="upProduct">
                            <button type="submit" class="btn btn-primary" id="update_product_pic_btn">Update Product</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div class="container-fluid">
        <c:import url="seller_menu.jsp" />

        <nav class="mt-4">
            <ol class="breadcrumb">
                <li class="breadcrumb-item">
                    <a href="user_dashboard.jsp">Dashboard</a>
                </li>
                <li class="breadcrumb-item active" id="showP">Products</li>
            </ol>
        </nav>
        
        <div class="row">
            <div class="col text-right mt-2 mr-5">
                <button class="btn btn-secondary shadow" onclick="func5()">Add Product</button>
                <!-- <div class="btn btn-secondary shadow"  data-toggle="modal" data-target="#add_product_modal">Add Product</div> -->
                <!-- <div class="btn btn-secondary shadow"  data-toggle="modal">show</div> -->
            </div>
        </div>
    </div>
    
    <div class=" mt-4 container-fluid">
        <div class="row">
            <div class="col" id="hv">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <c:forEach var="product" items="${products}">
                    <div class="card md-4 mb-3 d-inline-block" style="max-width: 700px; border: 1px solid black;">
                        <div class="card" style="width: 21rem;">
                            <img src="download_image.do?product_id=${product.productId}&count=1" class="card-img-top" style="height: 200px; border: solid 1px black; margin: 3px3px" >
                            <div class="card-body" style="height: 400px">
                                <!-- <div id="image_box"></div> -->
                                <h5 class="card-title text-center" style="text-decoration:underline;" onclick="func2('${product.productId}')">${product.name}</h5>
                                <hr>
                                <h6 class="card-title">Mrp:- ${product.mrp}</h6>
                                <h6 class="card-title">Discount:- ${product.discount}%</h6>
                                <h6 class="card-title">Quantity:- ${product.quantity}</h6>
                                <h6 class="card-title">${product.smallDesc}</h6>
                                <div class="text-left">
                                    <a href="#" onclick="func2('${product.productId}')">read more...</a>
                                    <hr>
                                    <a href="delete_product.do?product_id=${product.productId}" class="text-right btn btn-primary btn-sm">Delete</a>
                                    &nbsp;
                                    <button class="btn btn-primary btn-sm" onclick="func4('${product.productId}')">Edit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </c:forEach>
            </div>
        </div>
    </div>
    
    <%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

    <script>
        const upProduct = document.querySelector('#upProduct');
        const svProduct = document.querySelector('#svProduct');

        const svAdProd = document.querySelector('#svAdProd');
        const upAdProd = document.querySelector('#upAdProd');

        function func2(productId) {
            window.location.href = "product_info.do?productId="+productId;
        }

        function func5() {
            // product_name.value = "";
            // product_quantity.value = "";
            // product_mrp.value = "";
            // product_discount.value = "";
            // product_delivery_charge.value = "";
            // product_gift_charge.value = "";
            // product_short_content.value = "";
            // product_long_content.value = "";
            // product_category1.innerHTML = "";
            // product_sub_category1.innerHTML = "";
            // categoryRequest();
            
            
            upAdProd.classList.replace('d-block','d-none');
            svAdProd.classList.replace('d-none','d-block');
            
            upProduct.classList.replace('d-block','d-none');
            svProduct.classList.replace('d-none','d-block');
            $('#add_product_modal').modal('show');
        }

        ///////////////////////////////////////////////////
        const getCategory = async (categoryId) => {
            let response = await fetch('fetch_category.do?cid='+categoryId.categoryId);
            let result = await response.json();

            return result;
        };
        
        const getSubCategory = async (subCategoryId) => {
            let response = await fetch('fetch_sub_category.do?scid='+subCategoryId.subCategoryId);
            let result = await response.json();

            return result;
        };

        const getProductInfo = async (productId) => {
            let response = await fetch('edit_product.do?pid='+productId);
            let result = await response.json();

            return result;
        };

        var prod_id = null;
        function func4(productId) {
            prod_id = productId;
            getProductInfo(productId).then((data) => {
                console.log(data);

                svAdProd.classList.replace('d-block','d-none');
                upAdProd.classList.replace('d-none','d-block');

                product_name.value = data.name;
                product_quantity.value = data.quantity;
                product_mrp.value = data.mrp;
                product_discount.value = data.discount;
                product_delivery_charge.value = data.deliveryCharge;
                product_gift_charge.value = data.giftCharge;
                product_short_content.value = data.smallDesc;
                product_long_content.value = data.longDesc;

                // fetching subcategory info
                product_sub_category.innerHTML = null;
                getSubCategory(data.subCategory).then((data) => {
                    let elm = document.createElement('option');
                    elm.text = data.subCategory;
                    elm.value = data.subCategoryId;
                    product_sub_category.append(elm);

                    // fetching category info
                    product_category.innerHTML = null;
                    getCategory(data.category).then((data) => {
                        var elm = document.createElement("option");
                        elm.text = data.category;
                        elm.value = data.categoryId;
                        product_category.appendChild(elm);
                    }).catch((err) => {
                        console.log(err);
                    });
                }).catch((err) => {
                    console.log(err);
                });
                
                
                svProduct.classList.replace('d-block','d-none');
                upProduct.classList.replace('d-none','d-block');
                $('#add_product_modal').modal('show');
            }).catch((err)=>{
                console.log(err);
            });
        }

        var showP = document.querySelector('#showP');
        showP.addEventListener('click', () => {
            window.location.href = 'show_seller_products_cards.do?uId=${user.userId}';
        });

        let singlepicupload = new Dropzone('#singlepicupload', {
            // 1 is just for differentiating between primary and secondary images
            url: 'upload_product_file.do?count=1',
            uploadMultiple: false,
            maxFilesize: .5,
            acceptedFiles: 'image/jps, image/jpeg, image/png',
            autoProcessQueue: false,
            addRemoveLinks: true
        });
        
        let multiplepicupload = new Dropzone('#multiplepicupload', {
            // 2 is just for differentiating between primary and secondary images
            url: 'upload_product_file.do?count=2',
            uploadMultiple: true,
            maxFilesize: 50,
            acceptedFiles: 'image/jps, image/jpeg, image/png',
            autoProcessQueue: false,
            addRemoveLinks: true,
            parallelUploads: 20
        });

        const pic_btn = document.querySelector('#pic_btn');
        pic_btn.addEventListener('click', () => {
            singlepicupload.processQueue();
            multiplepicupload.processQueue();
            console.log('successfully uploaded');
        });
        
        const save_product_pic_btn = document.querySelector('#save_product_pic_btn');
        save_product_pic_btn.addEventListener('click', () => {
            window.location.href = 'show_seller_products_cards.do?uId=${user.userId}';
            $('#add_product_modal').modal('hide');
        });

        const update_product_pic_btn = document.querySelector('#update_product_pic_btn');
        update_product_pic_btn.addEventListener('click', () => {
            $('#add_product_modal').modal('hide');
        });

        var first = document.querySelector('#first');
        var second = document.querySelector('#second');
        var final_submit = document.querySelector('#final_submit');
        
        const product_name = document.querySelector('#pr_name');
        const product_quantity = document.querySelector('#pr_quantity');
        const product_mrp = document.querySelector('#pr_mrp');
        const product_discount = document.querySelector('#pr_discount');
        const product_delivery_charge = document.querySelector('#pr_delivery_charge');
        const product_gift_charge = document.querySelector('#pr_gift_charge');
        const product_short_content = document.querySelector('#pr_short_content');
        const product_long_content = document.querySelector('#pr_long_content');
        const product_category1 = document.querySelector('#pr_category');
        const product_sub_category1 = document.querySelector('#pr_sub_category');

        const saveProduct = async () => {
            console.log('ye chla');
            const golu = 'add_update_product.do?product_name='+product_name.value+'&product_quantity='+product_quantity.value+'&product_mrp='+product_mrp.value+'&product_discount='+product_discount.value+'&product_delivery_charge='+product_delivery_charge.value+'&product_gift_charge='+product_gift_charge.value+'&product_short_content='+product_short_content.value+'&product_long_content='+product_long_content.value+'&product_category1='+product_category1.value+'&product_sub_category1='+product_sub_category1.value+'&add_update=1';
            console.log(golu);

            let result = await fetch(golu);
            let resp = await result.text();

            return resp;
        };
        
        var save_product_btn = document.querySelector('#save_product_btn');
        save_product_btn.addEventListener('click', () => {
            saveProduct().then((data) => {
                console.log('hey');
                first.classList.replace('d-block', 'd-none');
                second.classList.replace('d-none', 'd-block');
                final_submit.classList.replace('d-none', 'd-block');
            }).catch((err) => {
                console.log(err);
            });
        });

        const updateProduct = async () => {
            console.log('ye chla');
            const bholu = 'add_update_product.do?product_name='+product_name.value+'&product_quantity='+product_quantity.value+'&product_mrp='+product_mrp.value+'&product_discount='+product_discount.value+'&product_delivery_charge='+product_delivery_charge.value+'&product_gift_charge='+product_gift_charge.value+'&product_short_content='+product_short_content.value+'&product_long_content='+product_long_content.value+'&product_category1='+product_category1.value+'&product_sub_category1='+product_sub_category1.value+'&add_update=2'+'&prod_id='+prod_id;
            console.log(bholu);

            let result = await fetch(bholu);
            let resp = await result.text();

            return resp;
        };

        var update_product_btn = document.querySelector('#update_product_btn');
        update_product_btn.addEventListener('click', () => {
            updateProduct().then((data) => {
                console.log('hey');
                first.classList.replace('d-block', 'd-none');
                second.classList.replace('d-none', 'd-block');
                final_submit.classList.replace('d-none', 'd-block');
            }).catch((err) => {
                console.log(err);
            });
        });

        function func(x) {
            if(x.value == 1) {
                if(x.checked) {
                    cont1.classList.replace('d-none', 'd-block');
                } else {
                    cont1.classList.replace('d-block', 'd-none');
                }
            } else if(x.value == 2) {
                if(x.checked) {
                    cont2.classList.replace('d-none', 'd-block');
                } else {
                    cont2.classList.replace('d-block', 'd-none');
                }
            } else{
                if(x.checked) {
                    cont3.classList.replace('d-none', 'd-block');
                } else {
                    cont3.classList.replace('d-block', 'd-none');
                }
            }
        }

        var product_category = document.querySelector('#pr_category');
        var product_sub_category = document.querySelector('#pr_sub_category');

        const category_list = document.querySelector('#category_list');
        const sub_category_list = document.querySelector('#sub_category_list');

        const categoryRequest = async () => {
            let result = await fetch('fetch_all_category.do');
            let tmp = await result.json();
            return tmp;
        }

        categoryRequest().then((data) => {
                product_category.innerHTML = null;          
                for(var cat of data) {
                    var elm = document.createElement("option");
                    elm.text = cat.category;
                    elm.value = cat.categoryId;
                    product_category.appendChild(elm);
                }
            }).catch((err) => {
                console.log(err);
            });

            const subCategoryRequest = async (category_id) => {
                let result = await fetch('fetch_all_sub_category.do?category_id='+category_id);
                let tmp = await result.json();
                return tmp;
            }

            product_category.addEventListener('change', () => {
                let catId = product_category.value;
                console.log(catId, '********~~~~');
                subCategoryRequest(catId).then((data) => {
                    console.log(data);
                    product_sub_category.innerHTML = null;
                    for(var cat of data) {
                        let elm = document.createElement('option');
                        elm.text = cat.subCategory;
                        elm.value = cat.subCategoryId;
                        product_sub_category.append(elm);
                    }
                }).catch((err) => {
                    console.log(err);
                });
            });
    </script>
</body>
</html>