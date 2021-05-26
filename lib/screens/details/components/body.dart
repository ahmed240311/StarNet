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
        SingleChildScrollView(child: ProductTitleWithImage(product: product)),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          width: double.infinity,
          height:size.height/2.1 ,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(22),
            ),
          ),
          child: ColorAndSize(product: product),
          // Description(product: product),
          // AddToCart(product: product)
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: SizedBox(
              // height: size.height * 0.05,
              width: size.width * 0.55,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                // color: Color(int.parse(product.color)),
                color: Colors.white,
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
                    fontFamily: 'Cairo-Black',

                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45,
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
