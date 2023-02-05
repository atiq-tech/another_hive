import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:cart_and_hive/drawer_sections/drawer_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProductPage extends StatefulWidget {
  AllProductPage({
    super.key,
    required this.index,
  });
  int index;
  @override
  State<AllProductPage> createState() => _AllProductPageState();
}

class _AllProductPageState extends State<AllProductPage> {
  //final allproduct = AllProductModel.generatedMySourecList();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => CategoryPage()));
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AllProductPage(
                            index: index,
                          )));
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
                  // Navigator.of(context).push(
                  //     MaterialPageRoute(builder: (context) => MyOrdersPage()));
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
                  //     MaterialPageRoute(builder: (context) => logInPage()),);
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
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 175.0),
                      child: Row(
                        children: [
                          Text(
                            "Delete cart",
                            style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                                size: 16.0,
                              )),
                        ],
                      ),
                    ),
                    Container(
                      height: 580.0,
                      width: double.infinity,
                      //color: Colors.red,
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            //final storeAllindexItem = _hiveitemslist[index];
                            return Card(
                              elevation: 5,
                              color: Color.fromARGB(255, 83, 117, 190),
                              margin: EdgeInsets.all(5.0),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              12,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 196, 3, 202),
                                          border:
                                              Border.all(color: Colors.black),
                                          borderRadius:
                                              BorderRadius.circular(5.0)),
                                      child: Center(
                                        child: Text(""),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Name:",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Price:",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 68, 67, 67),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "Quantity:",
                                          style: TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.w600),
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
                                                  // storeAllindexItem['quantity'] != 0
                                                  //     ? storeAllindexItem['quantity']--
                                                  //     : storeAllindexItem['quantity']++;
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
                                              "",
                                              // "${storeAllindexItem['quantity'].toString().padLeft(2, "0")}",
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
                                                  // storeAllindexItem['quantity']++;
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
                                            onTap: () {},
                                            // _deleteItem(storeAllindexItem["keys"]),
                                            child: Icon(
                                              Icons.delete,
                                              color: Color.fromARGB(
                                                  255, 212, 209, 209),
                                              size: 20.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Text(
                      "Total: \$ 00.0",
                      style: GoogleFonts.roboto(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height / 22,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 4.0,
                              spreadRadius: 1.0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            "Order Here",
                            style: GoogleFonts.roboto(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
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
      backgroundColor: Color.fromARGB(255, 151, 185, 236),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 108, 131, 165),
          elevation: 3.0,
          centerTitle: true,
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
          title: Text(
            "All Product",
            style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.white),
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Builder(
              builder: (context) => IconButton(
                icon: Center(
                  child: Badge(
                      // badgeColor: Color.fromARGB(255, 214, 30, 6),
                      // animationDuration: Duration(milliseconds: 300),
                      badgeContent: Text(
                        "0",
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
                      ),
                      child: Icon(Icons.shopping_cart_checkout_outlined)),
                ),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: 15,
            // itemCount: allproduct.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 5 / 7),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ShortDetailsPage(
                  //       index: index,
                  //     ),
                  //   ),
                  // );
                },
                child: Container(
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromARGB(255, 137, 181, 250),
                          spreadRadius: 5,
                          blurRadius: 5.0,
                          offset: Offset(0.0, 0.1)),
                    ],
                  ),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 5.0, right: 5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 8,
                            child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromARGB(255, 173, 171, 171),
                                        spreadRadius: 0.10,
                                        blurRadius: 0.0,
                                        offset: Offset(0.0, 0.1))
                                  ],
                                  // image: DecorationImage(
                                  //     image: AssetImage(
                                  //         "${allproduct[index].img}"),
                                  //     fit: BoxFit.fill),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0.0,
                                      right: 0.0,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 248, 69, 56),
                                        radius: 18.0,
                                        // child: Text(
                                        //   "${allproduct[index].discount}",
                                        //   style: TextStyle(fontSize: 15.0),
                                        // ),
                                      ),
                                    )
                                  ],
                                )),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              //color: Color.fromARGB(255, 235, 209, 209),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10.0),
                                  // Text(
                                  //   "${allproduct[index].title}",
                                  //   style: TextStyle(fontSize: 12.0),
                                  // ),
                                  SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Text(
                                      //   "${allproduct[index].price}",
                                      //   style: TextStyle(fontSize: 12.0),
                                      // ),
                                      Icon(
                                        Icons.favorite,
                                        color: Colors.black,
                                        size: 12.0,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
