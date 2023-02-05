import 'package:cart_and_hive/model/product_list.dart';
import 'package:cart_and_hive/size/size_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ShortDetailsPage extends StatefulWidget {
  ShortDetailsPage({
    super.key,
    required this.pPrice,
    required this.pName,
    required this.pImage,
    required this.pQuantity,
  });
  final String pName, pImage;
  final int pPrice;
  int pQuantity;

  @override
  State<ShortDetailsPage> createState() => _ShortDetailsPageState();
}

class _ShortDetailsPageState extends State<ShortDetailsPage> {
  late final Box box;

  @override
  void initState() {
    super.initState();
    print(widget.pName);
    print(widget.pImage);
    print(widget.pPrice);
    print(widget.pQuantity);

    // Get reference to an already opened box
    box = Hive.box('productBox');
  }

  final mySize = SizeItems.generatedMySourecList();
  int isPress = 1;
  int quantity = 0;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Details")),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Column(
          children: [
            Expanded(
              flex: 5,
              child: Container(
                //color: Colors.blue,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 177, 12, 163),
                          image: DecorationImage(
                              image: AssetImage(
                                widget.pImage,
                              ),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        //color: Color.fromARGB(255, 247, 99, 234),
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                width: 50,
                                height: 70,
                                margin: EdgeInsets.only(left: 8, right: 8),
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                  image: DecorationImage(
                                      image: AssetImage(widget.pImage),
                                      fit: BoxFit.fill),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) =>
                                SizedBox(height: 10.0),
                            itemCount: 6),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                //color: Color.fromARGB(255, 65, 80, 92),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15.0),
                    Row(
                      children: [
                        Text(
                          //
                          widget.pName,
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              quantity != 1 ? quantity-- : quantity++;
                            });
                          },
                          child: Container(
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 14.0,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "${quantity}",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          child: Container(
                            width: 18.0,
                            height: 18.0,
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Icon(
                              Icons.add,
                              size: 14.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "Short Details:",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    Container(
                      height: 1.0,
                      width: 150.0,
                      color: Colors.black,
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Shop Online for Original and Imported Baby Lotions & Oils at Best Price in Bangladesh. Easy Return & Refund. Quality and Best Price Guaranteed.",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        Text(
                          "Price:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        // Text(
                        //   "${productData[widget.index!].price}",
                        //   style: GoogleFonts.roboto(
                        //       color: Color.fromARGB(255, 43, 42, 42),
                        //       fontSize: 16.0,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Category id: ",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        // Text(
                        //   "$quantity",
                        //   style: GoogleFonts.roboto(
                        //       color: Color.fromARGB(255, 43, 42, 42),
                        //       fontSize: 16.0,
                        //       fontWeight: FontWeight.w400),
                        // ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      "❤️ Add to wishlist",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Color:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 20.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(30.0)),
                        )
                      ],
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "Size:",
                          style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Container(
                          height: 40.0,
                          width: 180.0,
                          padding: EdgeInsets.all(5.0),
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: mySize.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    isPress = index;
                                  });
                                },
                                child: Container(
                                  height: 30.0,
                                  width: 30.0,
                                  decoration: BoxDecoration(
                                      color: isPress == index
                                          ? Color.fromARGB(255, 223, 13, 94)
                                          : Color.fromARGB(255, 238, 113, 154),
                                      borderRadius:
                                          BorderRadius.circular(30.0)),
                                  child: Center(
                                      // child: Text(
                                      //   "${mySize[index].T_shirt_size}",
                                      //   style: GoogleFonts.roboto(
                                      //       color: isPress == index
                                      //           ? Colors.white
                                      //           : Color.fromARGB(
                                      //               255, 5, 110, 197),
                                      //       fontSize: 16.0,
                                      //       fontWeight: FontWeight.w400),
                                      // ),
                                      ),
                                ),
                              );
                            },
                            separatorBuilder: (_, index) => SizedBox(
                              width: 10.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "Short Details:Short Details:Short...",
                      style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: 15.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => OrderSummeryPage()));
                              });
                            },
                            child: Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                    ),
                                    color: Color.fromARGB(255, 24, 125, 240)),
                                child: Center(
                                  child: Text(
                                    "Check out",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                )),
                          ),
                          SizedBox(width: 10.0),
                          Builder(
                            builder: (context) => InkWell(
                              onTap: () {
                                setState(() {
                                  Scaffold.of(context).openEndDrawer();
                                });
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 18,
                                width: MediaQuery.of(context).size.width / 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30.0),
                                      bottomRight: Radius.circular(30.0),
                                    ),
                                    color: Color.fromARGB(255, 189, 199, 95)),
                                child: Center(
                                  child: Text(
                                    "Add To Cart",
                                    style: GoogleFonts.roboto(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
  }
}
