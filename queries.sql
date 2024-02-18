+-------------+------------+
| category_id | name       |
+-------------+------------+
|           1 | Mobiles    |
|           2 | Computers  |
|           3 | TV         |
|           4 | Appliances |
|           5 | Men        |
|           6 | Women      |
|           7 | Child      |
|           8 | Footwear   |
|           9 | Home       |
|          10 | Kitchen    |
|          11 | Beauty     |
|          12 | Toys       |
|          13 | Books      |
|          14 | Grocery    |
|          15 | Bags       |
+-------------+------------+


create table sub_categories (
    sub_category_id int auto_increment primary key,
    name varchar(35) not null, 
    category_id int not null,
    constraint fk_sub_categories foreign key (category_id) references categories (category_id)
);

alter table sub_categories MODIFY name varchar(50);

insert into sub_categories (name, category_id) values ('Budget', 1), ('Midrange', 1), ('Flagship', 1), ('Tablets', 1), ('Premium', 1), ('Cases & Covers', 1), ('Screen Protectors', 1), ('Power Banks', 1), ('Cables & Chargers', 1), ('Stands & Tripods', 1), ('headphones', 1), ('Blutooth Speakers', 1);

insert into sub_categories (name, category_id) values ('Laptops', 2), ('Desktops', 2), ('Printers', 2), ('Home Theater Speakers', 2), ('Drives & Storages', 2), ('Cables & Adapters', 2), ('Monitors', 2), ('Components', 2), ('Stands & Tripods', 2), ('headphones', 2), ('Cases & Skins', 2), ('Screen Protectors', 2), ('UPS', 2);

insert into sub_categories (name, category_id) values ('LCD', 3), ('LED', 3), ('OLED', 3), ('QLED', 3), ('Outdoor', 3), ('ULTRA HD 4K', 3), ('ULTRA HD 8K', 3), ('Remotes & Cables', 3), ('Stands', 3), ('Home Theater Speakers', 3);

insert into sub_categories (name, category_id) values ('Freezers', 4), ('Refrigerators', 4), ('Water Coolers', 4), ('Kitchen Stoves', 4), ('Rice Cookers', 4), ('Steam Ovens', 4), ('Microwaves', 4), ('Dishwashers', 4), ('Water Heaters & Geysure', 4), ('Mixers', 4), ('Toasters', 4), ('Water Purifiers', 4), ('Electric Kettles', 4), ('Vaccum Cleaner', 4), ('Washing Machines', 4), ('Air Conditioners', 4), ('Electric Fans', 4), ('Iron Press', 4);

insert into sub_categories (name, category_id) values ('Trousers', 5), ('Jeans', 5), ('Joggers & Lowers', 5), ('pants', 5), ('Sweaters', 5), ('Jackets', 5), ('Shirts', 5), ('T-Shirts', 5), ('Kurta Pajamas', 5), ('UnderGarments', 5), ('Sports Wear', 5), ('Suits', 5), ('Watches', 5), ('Purses', 5), ('Belts', 5), ('Shorts', 5), ('Shoes', 5), ('Caps', 5);

insert into sub_categories (name, category_id) values ('Skirts', 6), ('Jeans', 6), ('Leggings', 6), ('Joggers & Lowers', 6), ('pants', 6), ('Dress', 6), ('Tops', 6), ('Sari', 6), ('Gown', 6), ('Scarf', 6), ('Sweaters', 6), ('Jackets', 6), ('Shorts', 6), ('T-Shirts', 6), ('Kurtas', 6), ('UnderGarments', 6), ('Sports Wear', 6), ('Suits', 6), ('Watches', 6), ('Purses', 6), ('Shoes', 6), ('HandBags', 6), ('Salwar Kameez & Kurtis', 6), ('Salwar Kameez & Kurtis', 6), ('Dress Materials', 6);

insert into sub_categories (name, category_id) values ('Frocks & Dresses(Girls 2-8 Yrs)', 7), ('Lehenga Cholis & Sarees(Girls 2-8 Yrs)', 7), ('Top & Bottoms Sets(Girls 2-8 Yrs)', 7), ('Salwar Kameez & Kurtis(Girls 2-8 Yrs)', 7), ('Innerwears(Girls 2-8 Yrs)', 7), ('Leggings & Jeggings(Girls 2-8 Yrs)', 7), ('Tops, Tees & Shirts(Girls 2-8 Yrs)', 7), ('Girls Footwear', 7), ('Kurtas, Pyjamas & Dhotis(Boys 2-8 Yrs)', 7), ('T-Shirts & Shirts(Boys 2-8 Yrs)', 7), ('Pants, Jeans & Cargos(Boys 2-8 Yrs)', 7), ('Shorts & ThreeFourth(Boys 2-8 Yrs)', 7), ('TrackPants & TrackSuits(Boys 2-8 Yrs)', 7), ('InnerWears (Boys 2-8 Yrs)', 7), ('Boys Footwear', 7), ('Infant Wear(0-2 Yrs)', 7), ('Stationery', 7), ('Watches & Stylings', 7);

insert into sub_categories (name, category_id) values ('Mens Running Shoes', 8), ('Mens Sneakers', 8), ('Mens Walking Shoes', 8), ('Mens Formal Shoes', 8), ('Mens Loafers', 8), ('Mens Casual Shoes', 8), ('Mens Boots', 8), ('Womens Running Shoes', 8), ('Womens Sandals', 8), ('Womens Boots', 8), ('Womens High heels', 8);

insert into sub_categories (name, category_id) values ('Blankets & Quilts', 9), ('Curtains & Acccessories', 9), ('Mattresses', 9), ('Beans Bags', 9), ('Gifts & Decors', 9), ('Religion & Sprituality', 9), ('Furnitures', 9), ('Lightning & Accessories', 9);

insert into sub_categories (name, category_id) values ('Juicers, Mixers & Grinders', 10), ('Water Purifiers', 10), ('Gas Stoves & Hobs', 10), ('Chimneys', 10), ('Kettles & Coffee Makers', 10), ('Sandwich, Roti Makers', 10), ('Electric Cookers', 10), ('Air Fryers', 10), ('Dining & Servings', 10);

insert into sub_categories (name, category_id) values ('Face', 11), ('Eyes', 11), ('Lips', 11), ('Nails', 11), ('Makeup Palettes', 11), ('Brushes & Accessories', 11), ('Skin Care', 11), ('Hair Care', 11), ('Oral Care', 11), ('Bath & Showers', 11), ('Mens Grooming', 11), ('Waxing & Hair Removal', 11), ('Deodrants', 11);

insert into sub_categories (name, category_id) values ('Cars', 12), ('Electronic Toys', 12), ('Rides & Scooters', 12), ('Outdoor Toys', 12), ('Soft Toys', 12), ('Educational Toys', 12), ('Dolls & Doll Houses', 12), ('Indoor & Board Games', 12), ('Art & Crafts', 12);

insert into sub_categories (name, category_id) values ('Fiction Books', 13), ('School Textbooks', 13), ('Children Books', 13), ('Competetive Exam Books', 13), ('Novel Books', 13);

insert into sub_categories (name, category_id) values ('Chocolates & Sweets', 14), ('Dry fruits & Snaks', 14), ('Tea & Coffees', 14), ('Breakfast essesntials', 14), ('Cooking & ready to eat', 14), ('Spices & Seasonings', 14), ('Pickles', 14), ('Rice, Flour & Pulses', 14), ('Meat, Dairy, Poultry & Seafood', 14);

insert into sub_categories (name, category_id) values ('Casual Backpacks', 15), ('Laptop Bagpacks', 15), ('Camera Backpacks', 15), ('Rucksacks', 15), ('SuitCases', 15), ('Breifcases', 15), ('Trolly Bags', 15), ('Battery pack Bags', 15);


+-----------------+----------------------------------------+-------------+
| sub_category_id | name                                   | category_id |
+-----------------+----------------------------------------+-------------+
|               1 | Budget                                 |           1 |
|               2 | Midrange                               |           1 |
|               3 | Flagship                               |           1 |
|               4 | Tablets                                |           1 |
|               5 | Premium                                |           1 |
|               6 | Cases & Covers                         |           1 |
|               7 | Screen Protectors                      |           1 |
|               8 | Power Banks                            |           1 |
|               9 | Cables & Chargers                      |           1 |
|              10 | Stands & Tripods                       |           1 |
|              11 | headphones                             |           1 |
|              12 | Blutooth Speakers                      |           1 |
|              13 | Laptops                                |           2 |
|              14 | Desktops                               |           2 |
|              15 | Printers                               |           2 |
|              16 | Home Theater Speakers                  |           2 |
|              17 | Drives & Storages                      |           2 |
|              18 | Cables & Adapters                      |           2 |
|              19 | Monitors                               |           2 |
|              20 | Components                             |           2 |
|              21 | Stands & Tripods                       |           2 |
|              22 | headphones                             |           2 |
|              23 | Cases & Skins                          |           2 |
|              24 | Screen Protectors                      |           2 |
|              25 | UPS                                    |           2 |
|              26 | LCD                                    |           3 |
|              27 | LED                                    |           3 |
|              28 | OLED                                   |           3 |
|              29 | QLED                                   |           3 |
|              30 | Outdoor                                |           3 |
|              31 | ULTRA HD 4K                            |           3 |
|              32 | ULTRA HD 8K                            |           3 |
|              33 | Remotes & Cables                       |           3 |
|              34 | Stands                                 |           3 |
|              35 | Home Theater Speakers                  |           3 |
|              36 | Freezers                               |           4 |
|              37 | Refrigerators                          |           4 |
|              38 | Water Coolers                          |           4 |
|              39 | Kitchen Stoves                         |           4 |
|              40 | Rice Cookers                           |           4 |
|              41 | Steam Ovens                            |           4 |
|              42 | Microwaves                             |           4 |
|              43 | Dishwashers                            |           4 |
|              44 | Water Heaters & Geysure                |           4 |
|              45 | Mixers                                 |           4 |
|              46 | Toasters                               |           4 |
|              47 | Water Purifiers                        |           4 |
|              48 | Electric Kettles                       |           4 |
|              49 | Vaccum Cleaner                         |           4 |
|              50 | Washing Machines                       |           4 |
|              51 | Air Conditioners                       |           4 |
|              52 | Electric Fans                          |           4 |
|              53 | Iron Press                             |           4 |
|              54 | Trousers                               |           5 |
|              55 | Jeans                                  |           5 |
|              56 | Joggers & Lowers                       |           5 |
|              57 | pants                                  |           5 |
|              58 | Sweaters                               |           5 |
|              59 | Jackets                                |           5 |
|              60 | Shirts                                 |           5 |
|              61 | T-Shirts                               |           5 |
|              62 | Kurta Pajamas                          |           5 |
|              63 | UnderGarments                          |           5 |
|              64 | Sports Wear                            |           5 |
|              65 | Suits                                  |           5 |
|              66 | Watches                                |           5 |
|              67 | Purses                                 |           5 |
|              68 | Belts                                  |           5 |
|              69 | Shorts                                 |           5 |
|              70 | Shoes                                  |           5 |
|              71 | Caps                                   |           5 |
|              72 | Skirts                                 |           6 |
|              73 | Jeans                                  |           6 |
|              74 | Leggings                               |           6 |
|              75 | Joggers & Lowers                       |           6 |
|              76 | pants                                  |           6 |
|              77 | Dress                                  |           6 |
|              78 | Tops                                   |           6 |
|              79 | Sari                                   |           6 |
|              80 | Gown                                   |           6 |
|              81 | Scarf                                  |           6 |
|              82 | Sweaters                               |           6 |
|              83 | Jackets                                |           6 |
|              84 | Shorts                                 |           6 |
|              85 | T-Shirts                               |           6 |
|              86 | Kurtas                                 |           6 |
|              87 | UnderGarments                          |           6 |
|              88 | Sports Wear                            |           6 |
|              89 | Suits                                  |           6 |
|              90 | Watches                                |           6 |
|              91 | Purses                                 |           6 |
|              92 | Shoes                                  |           6 |
|              93 | HandBags                               |           6 |
|              94 | Salwar Kameez & Kurtis                 |           6 |
|              95 | Salwar Kameez & Kurtis                 |           6 |
|              96 | Dress Materials                        |           6 |
|              97 | Frocks & Dresses(Girls 2-8 Yrs)        |           7 |
|              98 | Lehenga Cholis & Sarees(Girls 2-8 Yrs) |           7 |
|              99 | Top & Bottoms Sets(Girls 2-8 Yrs)      |           7 |
|             100 | Salwar Kameez & Kurtis(Girls 2-8 Yrs)  |           7 |
|             101 | Innerwears(Girls 2-8 Yrs)              |           7 |
|             102 | Leggings & Jeggings(Girls 2-8 Yrs)     |           7 |
|             103 | Tops, Tees & Shirts(Girls 2-8 Yrs)     |           7 |
|             104 | Girls Footwear                         |           7 |
|             105 | Kurtas, Pyjamas & Dhotis(Boys 2-8 Yrs) |           7 |
|             106 | T-Shirts & Shirts(Boys 2-8 Yrs)        |           7 |
|             107 | Pants, Jeans & Cargos(Boys 2-8 Yrs)    |           7 |
|             108 | Shorts & ThreeFourth(Boys 2-8 Yrs)     |           7 |
|             109 | TrackPants & TrackSuits(Boys 2-8 Yrs)  |           7 |
|             110 | InnerWears (Boys 2-8 Yrs)              |           7 |
|             111 | Boys Footwear                          |           7 |
|             112 | Infant Wear(0-2 Yrs)                   |           7 |
|             113 | Stationery                             |           7 |
|             114 | Watches & Stylings                     |           7 |
|             115 | Mens Running Shoes                     |           8 |
|             116 | Mens Sneakers                          |           8 |
|             117 | Mens Walking Shoes                     |           8 |
|             118 | Mens Formal Shoes                      |           8 |
|             119 | Mens Loafers                           |           8 |
|             120 | Mens Casual Shoes                      |           8 |
|             121 | Mens Boots                             |           8 |
|             122 | Womens Running Shoes                   |           8 |
|             123 | Womens Sandals                         |           8 |
|             124 | Womens Boots                           |           8 |
|             125 | Womens High heels                      |           8 |
|             126 | Blankets & Quilts                      |           9 |
|             127 | Curtains & Acccessories                |           9 |
|             128 | Mattresses                             |           9 |
|             129 | Beans Bags                             |           9 |
|             130 | Gifts & Decors                         |           9 |
|             131 | Religion & Sprituality                 |           9 |
|             132 | Furnitures                             |           9 |
|             133 | Lightning & Accessories                |           9 |
|             134 | Juicers, Mixers & Grinders             |          10 |
|             135 | Water Purifiers                        |          10 |
|             136 | Gas Stoves & Hobs                      |          10 |
|             137 | Chimneys                               |          10 |
|             138 | Kettles & Coffee Makers                |          10 |
|             139 | Sandwich, Roti Makers                  |          10 |
|             140 | Electric Cookers                       |          10 |
|             141 | Air Fryers                             |          10 |
|             142 | Dining & Servings                      |          10 |
|             143 | Face                                   |          11 |
|             144 | Eyes                                   |          11 |
|             145 | Lips                                   |          11 |
|             146 | Nails                                  |          11 |
|             147 | Makeup Palettes                        |          11 |
|             148 | Brushes & Accessories                  |          11 |
|             149 | Skin Care                              |          11 |
|             150 | Hair Care                              |          11 |
|             151 | Oral Care                              |          11 |
|             152 | Bath & Showers                         |          11 |
|             153 | Mens Grooming                          |          11 |
|             154 | Waxing & Hair Removal                  |          11 |
|             155 | Deodrants                              |          11 |
|             156 | Cars                                   |          12 |
|             157 | Electronic Toys                        |          12 |
|             158 | Rides & Scooters                       |          12 |
|             159 | Outdoor Toys                           |          12 |
|             160 | Soft Toys                              |          12 |
|             161 | Educational Toys                       |          12 |
|             162 | Dolls & Doll Houses                    |          12 |
|             163 | Indoor & Board Games                   |          12 |
|             164 | Art & Crafts                           |          12 |
|             165 | Fiction Books                          |          13 |
|             166 | School Textbooks                       |          13 |
|             167 | Children Books                         |          13 |
|             168 | Competetive Exam Books                 |          13 |
|             169 | Novel Books                            |          13 |
|             170 | Chocolates & Sweets                    |          14 |
|             171 | Dry fruits & Snaks                     |          14 |
|             172 | Tea & Coffees                          |          14 |
|             173 | Breakfast essesntials                  |          14 |
|             174 | Cooking & ready to eat                 |          14 |
|             175 | Spices & Seasonings                    |          14 |
|             176 | Pickles                                |          14 |
|             177 | Rice, Flour & Pulses                   |          14 |
|             178 | Meat, Dairy, Poultry & Seafood         |          14 |
|             179 | Casual Backpacks                       |          15 |
|             180 | Laptop Bagpacks                        |          15 |
|             181 | Camera Backpacks                       |          15 |
|             182 | Rucksacks                              |          15 |
|             183 | SuitCases                              |          15 |
|             184 | Breifcases                             |          15 |
|             185 | Trolly Bags                            |          15 |
|             186 | Battery pack Bags                      |          15 |
+-----------------+----------------------------------------+-------------+