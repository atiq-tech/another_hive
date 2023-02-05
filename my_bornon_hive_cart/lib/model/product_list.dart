class ProductList {
  final String? pName;
  final int? pQuantity;
  final int? pPrice;
  final String? pImage;


  ProductList({this.pName, this.pQuantity, this.pPrice, this.pImage});
}

List myProductList = [
  {
    "pQuantity": 1,
    "pPrice": 2000,
    "pName": "Baby Lotion",
    "pImage": "images/bby.jpg",
    
  },
  {
    "pQuantity": 1,
    "pPrice": 240,
    "pName": "Men Polo T-shirt",
    "pImage": "assets/motornew.jpg",
   
  },
  {
    "pQuantity": 1,
    "pPrice": 59,
    "pName": "Sophia Campos",
    "pImage": "assets/psharee1.jpg",
    
  }
];
