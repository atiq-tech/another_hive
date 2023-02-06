import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/pages/category_details_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SubCategoryPage extends StatefulWidget {
  SubCategoryPage({
    super.key,
    required this.categoryName,
    required this.categoryIndex,
  });
  final String categoryName;
  int categoryIndex;

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  late final Box box;

  @override
  void initState() {
    setState(() {});
    super.initState();
    print(widget.categoryName);
    print(widget.categoryIndex);
    print("length: ${categoryList[widget.categoryIndex]["pList"].length}");
    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 127, 175, 214),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          backgroundColor: Color.fromARGB(255, 78, 99, 126),
          leading: InkWell(
              onTap: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.arrow_back)),
          title: Text(
            widget.categoryName.toString(),
            style: GoogleFonts.roboto(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 18),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(Icons.shopping_cart_checkout_outlined),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
            itemCount: categoryList[widget.categoryIndex]["pList"].length,
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
                    return CategoryDetailsProduct(
                      catProPrice: categoryList[widget.categoryIndex]["pList"]
                          [index]["pPrice"],
                      catProName: categoryList[widget.categoryIndex]["pList"]
                          [index]["pName"],
                      catProImage: categoryList[widget.categoryIndex]["pList"]
                          [index]["pImage"],
                      catProQuantity: categoryList[widget.categoryIndex]
                          ["pList"][index]["pQuantity"],
                      catProIndex: index,
                    );
                  })).then((_) => setState(() {}));
                },
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 9,
                          child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 173, 171, 171),
                                      spreadRadius: 0.10,
                                      blurRadius: 0.0,
                                      offset: Offset(0.0, 0.1))
                                ],
                                image: DecorationImage(
                                    image: AssetImage(
                                      categoryList[widget.categoryIndex]
                                          ["pList"][index]["pImage"],
                                    ),
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
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            //color: Color.fromARGB(255, 235, 209, 209),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5.0),
                                Text(
                                  categoryList[widget.categoryIndex]["pList"]
                                      [index]["pName"],
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  categoryList[widget.categoryIndex]["pList"]
                                          [index]["pQuantity"]
                                      .toString(),
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 5.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      " ৳ ${categoryList[widget.categoryIndex]["pList"][index]['pPrice']}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
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
              );
            }),
      ),
    );
  }
}
