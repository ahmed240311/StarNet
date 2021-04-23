import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Product {
  String image, title,data,video;
  var id;
  var color;

  Product({
    this.id,
    this.image,
    this.title,
    this.video,
    this.data,
    this.color,
  });

  // Product.fromSnapShot(DataSnapshot snapshot){
  //   id=snapshot.value['id'];
  //   title=snapshot.value['title'];
  //   image=snapshot.value['image'];
  // }
  Product.fromMap(Map<String, dynamic> data) {
    color = data['color'];
    id = data['id'];
    image = data['image'];
    title = data['title'];
  }

//
// Map<String, dynamic> toMap() {
//   return {
//     'id': id,
//     'title': title,
//     'image': image,
//      'color':color
//
// };
// }
}

// static List<Product> products = [
//   Product(
//       id: 1,
//       title: "2070",
//       // price: 134,
//       // description: dummyText,
//       image: "assets/images/2070.jpeg",
//       color: Color(0xFF94B0B7)),
//
//   // color: Color(0xFF3D82AE)),
//   Product(
//       id: 2,
//       title: "2050",
//       // price: 200,
//       // description: dummyText,
//       image: "assets/images/2050.jpg",
//       color: Color(0xFF94B0B7)),
//   Product(
//       id: 3,
//       title: "hummer x3",
//       // price: 60,
//       // description: dummyText,
//       image: "assets/images/hummer.jpg",
//       color: Color(0xFF94B0B7)),
//
//   // color: Colors.white
//       // color: Color(0xFF3D82AE)),
//
//
//   Product(
//       id: 4,
//       title: "2030",
//       // price: 54,
//       // description: dummyText,
//       image: "assets/images/2030.jpg",
//       color: Color(0xFF94B0B7)),
//
//   // color: Color(0xFFE6B398)),
//   Product(
//       id: 5,
//       title: "9000",
//       // price: 70,
//       // description: dummyText,
//       image: "assets/images/9000.jpg",
//       color: Color(0xFF94B0B7)),
// ];
// }


