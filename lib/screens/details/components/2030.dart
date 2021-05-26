import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../constants.dart';

class Server extends StatelessWidget {
  const Server({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (product.id == S2030) {
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
    } else if (product.id == S9000) {
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
    }
  }
}

