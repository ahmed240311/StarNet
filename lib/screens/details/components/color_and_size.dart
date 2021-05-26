import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';
import 'package:starnet/screens/details/components/2030.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../constants.dart';

class ColorAndSize extends StatelessWidget {
  ColorAndSize({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;
  List<Product> _products;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print("my id is ******** " + product.id);
    if (product.id == S2070) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.center,
                child: Html(
                  defaultTextStyle: TextStyle(fontFamily: 'Cairo-Black'),
                  data: product.data,
                ),
              )),
        ),
      );
    } else if (product.id == S2050) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.center,
                child: Html(
                  defaultTextStyle: TextStyle(fontFamily: 'Cairo-Black'),
                  data: product.data,
                ),
              )),
        ),
      );
    } else if (product.id == Hummer) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: Align(
                alignment: Alignment.center,
                child: Html(
                  defaultTextStyle: TextStyle(fontFamily: 'Cairo-Black'),
                  data: product.data,
                ),
              )),
        ),
      );
    } else {
      return Server(product: product);
    }
  }

//   List<Product> getProductCategory(String KAllRemote) {
//     List<Product> products = [];
//     for (var product in _products) {
//       if (product.color == KAllRemote) {
//         products.add(product);
//       }
//     }
//     return products;
//   }
}
