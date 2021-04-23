import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';

import '../../../constants.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({Key key, @required this.product,}) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       Center(
         child: Text(
                product.title,
                style: Theme.of(context).textTheme.headline.copyWith(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,

                    fontSize: 31.0,
                    fontWeight: FontWeight.bold),


          ),
       ),
        Padding(
          padding: const EdgeInsets.only(bottom:10.0,top:8.0),
          child: Container(

            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
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
          ),
        ),


        // SizedBox(height: kDefaultPaddin),
      ],
    );
  }
}
