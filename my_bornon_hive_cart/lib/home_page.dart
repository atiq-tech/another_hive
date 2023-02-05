import 'package:cart_and_hive/carousel/carousel_items.dart';
import 'package:cart_and_hive/drawer_sections/drawer_items.dart';
import 'package:cart_and_hive/itemlist_headfooter/item_List_part.dart';
import 'package:cart_and_hive/model/itemlistpart.model.dart';
import 'package:cart_and_hive/model/product.dart';
import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/row_seeall/see_all_section.dart';
import 'package:cart_and_hive/summery_sortdetails/short_details_page.dart';
import 'package:cart_and_hive/widgets/shoping_cart_badge.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Mydata = ItemListPartModel.generatedMySourecList();
  int isClick = 1;
  double textFontSize = 18.0;
  late final Box box;

  @override
  void initState() {
    setState(() {});
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  // Delete info from people box
  _deleteProduct(int index) {
    box.deleteAt(index);
    print('Product deleted from box at index: $index');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 130.0,
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 78, 106, 124),
                ),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRw8tnmRAobUlTWwXTzG0yJevfymCAQw00wZw&usqp=CAU'),
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your name',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'Enter your phone',
                          style: GoogleFonts.roboto(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => BottomNavigationBarPart()));
                });
              },
              child: DrawerItems(
                icon: Icons.home,
                text: 'HOME',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => CategoryPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.category,
                text: 'CATEGORIES',
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => AllProductPage(
                  //           index: index,
                  //         )));
                });
              },
              child: DrawerItems(
                icon: Icons.shopping_cart,
                text: 'SHOP',
              ),
            ),
            DrawerItems(
              icon: Icons.person_add_rounded,
              text: 'MY ACCOUNT',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => MyOrdersPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.lock_clock_sharp,
                text: 'MY ORDERS',
              ),
            ),
            DrawerItems(
              icon: Icons.favorite,
              text: 'MY FAVORITES',
            ),
            DrawerItems(
              icon: Icons.file_copy_sharp,
              text: 'INTRO',
            ),
            DrawerItems(
              icon: Icons.newspaper,
              text: 'NEWS',
            ),
            InkWell(
              onTap: () {
                setState(() {
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => logInPage()));
                });
              },
              child: DrawerItems(
                icon: Icons.login,
                text: 'LOG OUT',
              ),
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, Box box, widget) {
            if (box.isEmpty) {
              return Center(
                child: Text(
                  'No items in Cart, please add items.',
                  style: TextStyle(
                      color: Color.fromARGB(255, 77, 2, 107),
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 200.0),
                      child: InkWell(
                          onTap: () {
                            box.clear();
                            setState(() {});
                          },
                          child: Row(
                            children: [
                              Text(
                                "Delete cart",
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 18.0,
                              ),
                            ],
                          )),
                    ),
                    SizedBox(height: 10.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: box.length,
                        itemBuilder: (context, index) {
                          var currentBox = box;
                          var productData = currentBox.getAt(index)!;

                          return Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 5.0),
                            child: Card(
                              elevation: 8,
                              color: Color.fromARGB(255, 84, 129, 182),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                8,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                16,
                                        padding: EdgeInsets.only(
                                            left: 5.0, right: 5.0),
                                        decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 196, 3, 202),
                                        ),
                                        child: Image.asset(
                                          "${productData.productImage}",
                                          fit: BoxFit.fill,
                                        )),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${productData.productName}",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          "Price:${productData.productPrice}",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 46, 51, 51),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Quantity:${productData.productQuantity}",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  if (productData
                                                          .productQuantity >
                                                      1) {
                                                    productData
                                                        .productQuantity--;

                                                    ProductDetails
                                                        existingProduct =
                                                        box.getAt(index);

                                                    existingProduct
                                                            .productQuantity =
                                                        productData
                                                            .productQuantity--;

                                                    box.putAt(
                                                        index, existingProduct);
                                                  }
                                                });
                                              },
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 66, 91, 117),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                child: Icon(
                                                  Icons.remove,
                                                  color: Color.fromARGB(
                                                      255, 212, 209, 209),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            Text(
                                              "${productData.productQuantity}",
                                              style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 28, 28, 29),
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  productData.productQuantity++;

                                                  ProductDetails
                                                      existingProduct =
                                                      box.getAt(index);

                                                  existingProduct
                                                          .productQuantity =
                                                      productData
                                                          .productQuantity++;

                                                  box.putAt(
                                                      index, existingProduct);
                                                });
                                              },
                                              child: Container(
                                                width: 25.0,
                                                height: 25.0,
                                                decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 66, 91, 117),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0)),
                                                child: Icon(
                                                  Icons.add,
                                                  color: Color.fromARGB(
                                                      255, 212, 209, 209),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 25.0,
                                          height: 25.0,
                                          decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                  255, 66, 91, 117),
                                              borderRadius:
                                                  BorderRadius.circular(4.0)),
                                          child: InkWell(
                                            onTap: () {
                                              _deleteProduct(index);
                                              setState(() {
                                                box.length;
                                                print(box.length);
                                              });
                                            },
                                            child: Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 212, 209, 209),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 100,
                          child: ListView.builder(
                            itemCount: 1,
                            itemBuilder: (BuildContext context, int index) {
                              num totalPrice = 0;
                              for (int i = 0; i < box.length; i++) {
                                var productData = box.getAt(i)!;

                                totalPrice += productData.productPrice *
                                    productData.productQuantity;
                              }

                              return Center(
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Price: \$ ${totalPrice.toString()}.00",
                                      style: TextStyle(
                                          fontSize: 25,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Order Here")),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ))
                  ],
                ),
              );
            }
          },
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(235, 51, 56, 66),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Center(
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
          title: Text("Bornon"),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 10.0),
            Icon(Icons.person),
            SizedBox(width: 10.0),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0),
              child: ShoppingCartBadge(),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselItems(),
            SizedBox(height: 15.0),
            ItemListPart(Mydata: Mydata),
            SizedBox(height: 15.0),
            SeeAllSection(seetitleText: "Hot Deal", seeAllText: "See all"),
            SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                //color: Colors.green,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ShortDetailsPage(
                                pImage: myProductList[index]["pImage"],
                                pName: myProductList[index]['pName'],
                                pPrice: myProductList[index]["pPrice"],
                                pQuantity: myProductList[index]["pQuantity"],
                              );
                            })).then((_) => setState(() {}));
                          });
                        },
                        child: Container(
                          width: 110.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              myProductList[index]['pImage']),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Color.fromARGB(255, 145, 11, 122),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.0),
                                      Text(
                                        myProductList[index]['pName']
                                            .toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 31, 30, 30),
                                            fontSize: 12.0),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        myProductList[index]['pPrice']
                                            .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 8, 117, 241),
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          bool found = false;
                                          setState(() {
                                            box.length;
                                            for (int i = 0;
                                                i < box.length;
                                                i++) {
                                              ProductDetails existingProduct =
                                                  box.getAt(i);
                                              if (existingProduct.productName ==
                                                      myProductList[index]
                                                          ['pName'] &&
                                                  existingProduct
                                                          .productPrice ==
                                                      myProductList[index]
                                                          ['pPrice']) {
                                                existingProduct
                                                        .productQuantity =
                                                    myProductList[index]
                                                        ['pQuantity'];
                                                box.putAt(i, existingProduct);

                                                found = true;
                                                break;
                                              }
                                            }
                                            if (!found) {
                                              //ProductDetails holo hive er Model class name
                                              ProductDetails productDetails =
                                                  ProductDetails(
                                                      productName:
                                                          myProductList[index]
                                                              ['pName'],
                                                      productPrice:
                                                          myProductList[index]
                                                              ['pPrice'],
                                                      productQuantity:
                                                          myProductList[index]
                                                              ['pQuantity'],
                                                      productImage:
                                                          myProductList[index]
                                                              ['pImage']);
                                              box.add(productDetails);
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color:
                                              Color.fromARGB(255, 13, 124, 16),
                                          child: const Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 233, 229, 229),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(width: 15.0),
                    itemCount: myProductList.length),
              ),
            ),
            SizedBox(height: 10.0),
            SeeAllSection(seetitleText: "New Arrival", seeAllText: "See all"),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Container(
                height: 200.0,
                width: double.infinity,
                //color: Colors.green,
                child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () async {
                          setState(() {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => ShortDetailsPage(

                            //         )));
                          });
                        },
                        child: Container(
                          width: 110.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              myProductList[index]['pImage']),
                                          fit: BoxFit.fill)),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  // color: Color.fromARGB(255, 145, 11, 122),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 20.0),
                                      Text(
                                        myProductList[index]['pName']
                                            .toString(),
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 31, 30, 30),
                                            fontSize: 12.0),
                                      ),
                                      SizedBox(height: 5.0),
                                      Text(
                                        myProductList[index]['pPrice']
                                            .toString(),
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 8, 117, 241),
                                            fontSize: 14.0),
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        onTap: () {
                                          bool found = false;
                                          setState(() {
                                            box.length;
                                            for (int i = 0;
                                                i < box.length;
                                                i++) {
                                              ProductDetails existingProduct =
                                                  box.getAt(i);
                                              if (existingProduct.productName ==
                                                      myProductList[index]
                                                          ['pName'] &&
                                                  existingProduct
                                                          .productPrice ==
                                                      myProductList[index]
                                                          ['pPrice']) {
                                                existingProduct
                                                        .productQuantity =
                                                    myProductList[index]
                                                        ['pQuantity'];
                                                box.putAt(i, existingProduct);

                                                found = true;
                                                break;
                                              }
                                            }
                                            if (!found) {
                                              //ProductDetails holo hive er Model class name
                                              ProductDetails productDetails =
                                                  ProductDetails(
                                                      productName:
                                                          myProductList[index]
                                                              ['pName'],
                                                      productPrice:
                                                          myProductList[index]
                                                              ['pPrice'],
                                                      productQuantity:
                                                          myProductList[index]
                                                              ['pQuantity'],
                                                      productImage:
                                                          myProductList[index]
                                                              ['pImage']);
                                              box.add(productDetails);
                                            }
                                          });
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              30,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color:
                                              Color.fromARGB(255, 13, 124, 16),
                                          child: const Center(
                                            child: Text(
                                              "Add to cart",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Color.fromARGB(
                                                      255, 233, 229, 229),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, index) => SizedBox(width: 15.0),
                    itemCount: myProductList.length),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
