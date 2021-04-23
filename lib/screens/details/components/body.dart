import 'package:flutter/material.dart';
import 'package:starnet/constants.dart';
import 'package:starnet/models/Product.dart';
import 'package:url_launcher/url_launcher.dart';

import 'color_and_size.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        /*Container(
        child: Stack(
         children: <Widget>[
            */
        ProductTitleWithImage(product: product),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            child: SingleChildScrollView(
                child: ColorAndSize(product: product)),
            // Description(product: product),
            // AddToCart(product: product)
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
          child: Center(
            child: SizedBox(
              height: size.height * 0.05,
              width: size.width * 0.65,

              // width: 100,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                color: Color(int.parse(product.color)),
                onPressed: () async {
                  await canLaunch(whatsappUrl)
                      ? launch(whatsappUrl)
                      : Scaffold.of(context).showSnackBar(new SnackBar(
                          content: new Text('يرجي تنصيب واتساب'),
                        ));
                },
                child: Text(
                  "تواصل",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
      //     ),
      //   ),]
    );
  }
}
