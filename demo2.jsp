<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="models.Category,models.User" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    <%@ include file="header.jsp" %>

    <c:import url="header2.jsp" />

    <!-- Add Product Modal -->
    <div class="modal fade" id="add_product_modal">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title">Enter Prdouct Details</h3>
                    <button type="button" class="close" data-dismiss="modal">
                        <span>&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form action="add_product.do" method="POST">
                        <div class="form-group">
                            <label for="product_name">Product Name<span class="text-danger">*</span></label>
                            <input type="text" class="form-control" name="product_name" id="product_name" placeholder="Enter product name, which will be shown to buyer">
                        </div>
                        <div class="form-group" id="cat_box">
                            <label for="product_category">Category<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="product_category" name="product_category">
                                <option value="0" selected="selected" disabled>--- select one ---</option>
                                <option value="1">Mobiles</option>
                                <option value="2">Computers</option>
                                <option value="3">TV</option>
                                <option value="4">Appliances</option>
                                <option value="5">Men's Wear</option>
                                <option value="6">Women's Wear </option>
                                <option value="7">Child</option>
                                <option value="8">Footwear</option>
                                <option value="9">Home</option>
                                <option value="10">Kitchen</option>
                                <option value="11">Beauty</option>
                                <option value="12">Toy's</option>
                                <option value="13">Books</option>
                                <option value="14">Grocery</option>
                                <option value="15">Bags</option>
                            </select>
                            <!-- <div id="category_list" class="d-none"></div> -->
                        </div>
                        <div class="form-group">
                            <label for="product_sub_category">SubCategory<span class="text-danger">*</span></label>
                            <select class="form-control dropdown" id="product_sub_category" name="product_sub_category">
                                <!-- <option selected="selected" disabled>--- select one ---</option> -->
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="product_quantity">Quantity<span class="text-danger">*</span></label>
                            <input type="number" class="form-control" name="product_quantity" id="product_quantity" placeholder="Enter the quantity of products">
                        </div>
                        <div class="form-group">
                            <label for="product_mrp">MRP<span class="text-danger">*</span></label>
                            <input type="number" class="form-control" name="product_mrp" id="product_mrp" placeholder="Enter MRP">
                        </div>
                        <div class="form-group">
                            <label for="charges">Select Additional Charges</label>
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="discount" name="discount" value="1">&nbsp;Discount 
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="delivery_charge" name="delivery_charge" value="2">&nbsp;Delivery Charge 
                            <br>
                            &nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="gift_charge" name="gift_charge" value="3">&nbsp;Gift Charge
                        </div>

                        <!-- 
                            <div class="form-group">
                                <label for="charges">Select Additional Charges</label>
                                <br>
                                &nbsp;&nbsp;&nbsp;<input type="radio" id="discount" name="discount" value="1">&nbsp;Discount 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="delivery_charge" name="delivery_charge" value="2">&nbsp;Delivery Charge 
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="radio" id="gift_charge" name="gift_charge" value="3">&nbsp;Gift Charge
                            </div> 
                        -->

                        <div class="form-group">
                            <label for="product_short_content">Short content:</label>
                            <textarea name="product_short_content" class="form-control" rows="3" placeholder="Write Sort Content(Description) about your product"></textarea>
                        </div>
                        <div class="form-group mb-4">
                            <label for="product_long_content">Short content:</label>
                            <textarea name="product_long_content" class="form-control" rows="5" placeholder="Write Long Content(Description) about your product"></textarea>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <!-- <a href="#" class="mr-auto">Forgot Password?</a> -->
                    <button class="btn btn-info btn-sm" id="save_product_btn">Save Product</button>
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
                <li class="breadcrumb-item active">Products</li>
            </ol>
        </nav>

        <div class="row">
            <div class="col text-right mt-3 mb-2 mr-5">
                <div class="btn btn-secondary shadow"  data-toggle="modal" data-target="#add_product_modal">Add Product</div>
            </div>
        </div>
    </div>

    <!-- here we show all the products of the particular seller -->
    <!-- i have to show the products under different categories or under the different categories heading -->
    <div class="row">
        <div class="col">
            <div class="card mb-3 d-inline-block" style="max-width: 540px;">
                <div class="row no-gutters">
                  <div class="col-md-4">
                    <img src="static/images/default.png" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Oppo f1 pro+</h5>
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-muted">Last updated 3 mins ago</small></p>
                      <a href="#" class="btn btn-primary btn-sm">Edit</a>  
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
        var product_category = document.querySelector('#product_category');
        var product_sub_category = document.querySelector('#product_sub_category');

        var categories = {
            1:['Budget', 'Midrange', 'Flagship', 'Tablets', 'Premium', 'Cases & Covers', 'Screen Protectors', 'Power Banks', 'Cables & Chargers', 'Stands & Tripods', 'headphones', 'Blutooth Speakers'],
            2:['Laptops', 'Desktops', 'Printers', 'Home Theater Speaker', 'Drives & Storages', 'Cables & Adapters', 'Monitors', 'Components', 'Stands & Tripods', 'headphones', 'Cases & Skins', 'Screen Protectors', 'UPS'],
            3:['LCD', 'LED', 'OLED', 'QLED', 'Outdoor', 'ULTRA HD 4K', 'ULTRA HD 8K', 'Remotes & Cables', 'Stands', 'Home Theater Speakers'],
            4:['Freezers', 'Refrigerators', 'Water Coolers', 'Kitchen Stoves', 'Steam Ovens', 'Microwaves', 'Dishwashers', 'Water Heaters & Geysure', 'Mixers', 'Toasters', 'Water Purifiers', 'Electric Kettles', 'Vaccum Cleaner', 'Washing Machines', 'Air Conditioners', 'Electric Fans', 'Iron Press'],
            5:['Trousers', 'Jeans', 'Joggers & Lowers', 'Pants', 'Sweaters', 'Jackets', 'Shirts', 'T-Shirts', 'Kurta Pajamas', 'UnderGarments', 'Sports Wear', 'Suits', 'Watches', 'Purses', 'Belts', 'Shorts', 'Shoes', 'Caps'],
            6:['Skirts', 'Jeans', 'Leggings', 'Joggers & Lowers', 'Pants', 'Dress', 'Tops', 'Sari', 'Gown', 'Scarf', 'Sweaters', 'Jackets', 'Shorts', 'T-Shirts', 'Kurtas', 'UnderGarments', 'Sports Wear', 'Suits', 'Watches', 'Purses', 'Shoes', 'HandBags', 'Salwar Kameez & Kurtis', 'Salwar Kameez & Kurtis', 'Dress Materials'],
            7:['Frocks & Dresses(Girls 2-8 Yrs)', 'Lehenga Cholis & Sarees(Girls 2-8 Yrs)', 'Top & Bottoms Sets(Girls 2-8 Yrs)', 'Salwar Kameez & Kurtis(Girls 2-8 Yrs)', 'Innerwears(Girls 2-8 Yrs)', 'Leggings & Jeggings(Girls 2-8 Yrs)', 'Tops, Tees & Shirts(Girls 2-8 Yrs)', 'Girls Footwear', 'Kurtas, Pyjamas & Dhotis(Boys 2-8 Yrs)', 'T-Shirts & Shirts(Boys 2-8 Yrs)', 'Pants, Jeans & Cargos(Boys 2-8 Yrs)', 'Shorts, ThreeFourth(Boys 2-8 Yrs)', 'TrackPants & TrackSuits(Boys 2-8 Yrs)', 'InnerWears(Boys 2-8 Yrs)', 'Boys Footwear', 'Infant Wear(0-2 Yrs)', 'Stationery', 'Watches & Stylings'],
            8:['Mens Running Shoes', 'Mens Sneakers', 'Mens Walking Shoes', 'Mens Formal Shoes', 'Mens Loafers', 'Mens Casual Shoes', 'Mens Boots', 'Womens Runnings Shoes', 'Womens Sandals', 'Womens Boots', 'Womens High heels'],
            9:['Blankets & Quilts', 'Curtains & Accessories', 'Mattresses', 'Beans Bags', 'Gifts & Decors', 'Religion & Sprituality', 'Furnitures', 'Lightnings & Accessories'],
            10:['Juicers, Mixers & Grinders', 'Water Purifiers', 'Gas Stoves & Hobs', 'Chimneys', 'Kettles & Coffee Makers', 'Sandwich, Roti Makers', 'Electric Cookers', 'Air Fryers', 'Dining & Servings'],
            11:['Face', 'Eyes', 'Lips', 'Nails', 'Makeup Palettes', 'Brushes & Accessories', 'Skin Care', 'Hair Care', 'Oral Care', 'Bath & Showers', 'Mens Grooming', 'Waxing & Hair Removal', 'Deodrants'],
            12:['Cars', 'Electronic Toys', 'Rides & Scooters', 'Outdoor Toys', 'Soft Toys', 'Educational Toys', 'Dolls & Doll Houses', 'Indoor & Board Games', 'Art & Crafts'],
            13:['Fiction Books', 'School Textbooks', 'Children Books', 'Competetive Exam Books', 'Novel Books'],
            14:['Choclates & Sweets', 'Dry fruits & Snaks', 'Tea & Coffees', 'Breakfast essentials', 'Cooking & ready to eat', 'Spices & Seasonings', 'Pickles', 'Rice, Flour & Pulses', 'Meat, Dairy, Poultry & Seafood'],
            15:['Casual Backpacks', 'Laptop Bagpacks', 'Camera Backpacks', 'Rucksacks', 'SuitCases', 'Breifcases', 'Trolly Bags', 'Battery pack Bags']
        }

        product_category.addEventListener('change', function() {
            var selected_option = categories[this.value];

            while(product_sub_category.options.length > 0) {
                product_sub_category.options.remove(0);
            }

            Array.from(selected_option).forEach(function(el) {
                let option = new Option(el, el);
                product_sub_category.appendChild(option);
            });
        });

        // let category_id = null;

        // const category_list = document.querySelector('#category_list');

        

        // const categoryRequest = async () => {
        //     let result = await fetch('fetch_all_category.do');

        //     let tmp = await result.json();

        //     return tmp;
        // }

        // product_category.addEventListener('keyup', () => {
        //     categoryRequest().then((data) => {
        //         category_list.innerHTML = null;
        //             category_list.classList.replace('d-none', 'd-block');

        //             for(var cat of data) {
        //                 console.log(cat);
        //                 let elm = document.querySelector('div');
        //                 elm.className = 'cat_rec';
        //                 elm.innerText = cat.product_category;
        //                 elm.category_id = ct.categoryId;
        //                 elm.addEventListener('click', (e) => {
        //                     product_category.value = e.target.innerText;
        //                     category_id = e.target.category_id;
        //                     category_list.classList.replace('d-block', 'd-none');
        //                 });
        //                 category_list.append(elm);
        //             }
        //     }).catch((err) => {
        //         console.log(err);
        //     });
        // });
    </script>
</body>
</html>