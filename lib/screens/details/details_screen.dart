import 'package:flutter/material.dart';
import 'package:starnet/constants.dart';
import 'package:starnet/models/Product.dart';
import 'package:starnet/screens/details/components/body.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;

  const DetailsScreen({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      backgroundColor: Color(int.parse(product.color)),
      appBar: buildAppBar(context),
      body: Body(product: product),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(int.parse(product.color)),
      elevation: 0,
      title: Text(
        product.title,
        style: Theme.of(context).textTheme.headline.copyWith(
            color: Colors.black,
            fontStyle: FontStyle.italic,
            fontSize: 32.0,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30.0,
          )),
      // actions: <Widget>[
      //   // IconButton(
      //   //   icon: SvgPicture.asset("assets/icons/cart.svg"),
      //   //   onPressed: () {},
      //   // ),
      //   SizedBox(width: kDefaultPaddin / 2)
      // ],
    );
  }
}
