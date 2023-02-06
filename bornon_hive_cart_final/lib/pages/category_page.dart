import 'package:badges/badges.dart';
import 'package:cart_and_hive/btmnbr/bottomnavigationbar_part.dart';
import 'package:cart_and_hive/drawer_sections/drawer_items.dart';
import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/pages/sub_category_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BottomNavigationBarPart()));
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
      endDrawer: Drawer(),
      backgroundColor: Color.fromARGB(255, 151, 185, 236),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 107, 116, 124),
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
            "All Category",
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
        padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: GridView.builder(
            itemCount: categoryList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
                childAspectRatio: 5 / 7),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SubCategoryPage(
                      categoryName: categoryList[index]["catItemName"],
                      categoryIndex: index,
                    );
                  })).then((_) => setState(() {}));
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5.0, left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              //padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5.0),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 173, 171, 171),
                                      spreadRadius: 0.10,
                                      blurRadius: 0.0,
                                      offset: Offset(0.0, 0.1))
                                ],
                              ),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromARGB(
                                              255, 173, 171, 171),
                                          spreadRadius: 0.10,
                                          blurRadius: 0.0,
                                          offset: Offset(0.0, 0.1))
                                    ],
                                    image: DecorationImage(
                                        image: AssetImage(categoryList[index]
                                            ["catItemImage"]),
                                        fit: BoxFit.fill),
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
                                          child: Text(
                                            "25%",
                                            style: TextStyle(fontSize: 15.0),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              //color: Color.fromARGB(255, 2, 24, 43),
                              child: Center(
                                child: Text(
                                  categoryList[index]["catItemName"],
                                  style: GoogleFonts.robotoSlab(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w800,
                                      color: Colors.black),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
