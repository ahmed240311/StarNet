import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key key, @required this.product,}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: size.height * 0.28,
        child:
        Hero(
          tag: "${product.id}",
          child: Image.network(
            product.image,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
