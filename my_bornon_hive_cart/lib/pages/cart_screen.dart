// import 'package:cart_and_hive/home_page.dart';
// import 'package:cart_and_hive/model/product.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});

//   @override
//   _CartScreenState createState() => _CartScreenState();
// }

// class _CartScreenState extends State<CartScreen> {
//   late final Box box;
//   double textFontSize = 18.0;

//   @override
//   void initState() {
//     super.initState();
//     // Get reference to an already opened box
//     box = Hive.box('productBox');
//   }

//   // Delete info from people box
//   _deleteProduct(int index) {
//     box.deleteAt(index);
//     print('Product deleted from box at index: $index');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Cart Info'),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12.0),
//             child: InkWell(
//                 onTap: () {
//                   box.clear();

//                   setState(() {});
//                 },
//                 child: Icon(Icons.delete)),
//           )
//         ],
//         leading: InkWell(
//             onTap: () {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomePage(),
//                   ),
//                   (route) => false);
//             },
//             child: Icon(Icons.arrow_back)),
//       ),
//       body: ValueListenableBuilder(
//         valueListenable: box.listenable(),
//         builder: (context, Box box, widget) {
//           if (box.isEmpty) {
//             return Center(
//               child: Text('No Product in Cart'),
//             );
//           } else {
//             return Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: box.length,
//                     itemBuilder: (context, index) {
//                       var currentBox = box;
//                       var productData = currentBox.getAt(index)!;

//                       return Padding(
//                         padding: const EdgeInsets.only(
//                             left: 10.0, right: 10.0, bottom: 5.0),
//                         child: Card(
//                           elevation: 8,
//                           color: Colors.blueGrey[100],
//                           child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           "${productData.productName}",
//                                           style: TextStyle(
//                                             color: Colors.black54,
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: textFontSize,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                             height: 20,
//                                             width: 20,
//                                             child: Image.asset(
//                                               "${productData.productImage}",
//                                             )),
//                                         Text(
//                                           "${productData.productPrice}",
//                                           style: TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: textFontSize,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         SizedBox(
//                                           height: 30,
//                                           width: 30,
//                                           child: FloatingActionButton(
//                                             heroTag: null,
//                                             onPressed: () {
//                                               setState(() {
//                                                 if (productData
//                                                         .productQuantity >
//                                                     1) {
//                                                   productData.productQuantity--;

//                                                   ProductDetails
//                                                       existingProduct =
//                                                       box.getAt(index);

//                                                   existingProduct
//                                                           .productQuantity =
//                                                       productData
//                                                           .productQuantity--;

//                                                   box.putAt(
//                                                       index, existingProduct);
//                                                 }
//                                               });
//                                             },
//                                             mini: true,
//                                             child: Icon(
//                                               Icons.remove,
//                                               color: Colors.white,
//                                             ),
//                                             shape: const CircleBorder(),
//                                             backgroundColor: Colors.black12,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         Text(
//                                           "${productData.productQuantity}",
//                                           style: TextStyle(
//                                             color: Colors.black54,
//                                             fontSize: 20,
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           width: 5,
//                                         ),
//                                         SizedBox(
//                                           height: 30,
//                                           width: 30,
//                                           child: FloatingActionButton(
//                                             heroTag: null,
//                                             onPressed: () {
//                                               setState(() {
//                                                 productData.productQuantity++;

//                                                 ProductDetails existingProduct =
//                                                     box.getAt(index);

//                                                 existingProduct
//                                                         .productQuantity =
//                                                     productData
//                                                         .productQuantity++;

//                                                 box.putAt(
//                                                     index, existingProduct);
//                                               });
//                                             },
//                                             mini: true,
//                                             child: Icon(
//                                               Icons.add,
//                                               color: Colors.white,
//                                             ),
//                                             shape: const CircleBorder(),
//                                             backgroundColor: Colors.black12,
//                                           ),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 SizedBox(
//                                   height: 30,
//                                   width: 30,
//                                   child: FloatingActionButton(
//                                     heroTag: null,
//                                     onPressed: () {
//                                       _deleteProduct(index);
//                                       setState(() {
//                                         box.length;
//                                         print(box.length);
//                                       });
//                                     },
//                                     mini: true,
//                                     shape: CircleBorder(),
//                                     backgroundColor: Colors.white,
//                                     child: Icon(
//                                       Icons.delete,
//                                       color: Color.fromARGB(255, 244, 54, 95),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: SizedBox(
//                       height: 100,
//                       child: ListView.builder(
//                         itemCount: 1,
//                         itemBuilder: (BuildContext context, int index) {
//                           num totalPrice = 0;
//                           for (int i = 0; i < box.length; i++) {
//                             var productData = box.getAt(i)!;

//                             totalPrice += productData.productPrice *
//                                 productData.productQuantity;
//                           }

//                           return Center(
//                             child: Column(
//                               children: [
//                                 Container(
//                                   color: Colors.blueGrey,
//                                   child: Text(
//                                     "Total Price: \$${totalPrice.toString()}",
//                                     style: TextStyle(
//                                         fontSize: 22, color: Colors.white),
//                                   ),
//                                 ),
//                                 ElevatedButton(
//                                     onPressed: () {}, child: Text("Order Here"))
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ))
//               ],
//             );
//           }
//         },
//       ),
//     );
//   }
// }
