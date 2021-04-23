import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:starnet/models/Product.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';

class ALLam extends StatefulWidget {
  @override
  _AllamState createState() => _AllamState();
}

class _AllamState extends State<ALLam> {
  List<Product> _products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: <Color>[
              Colors.white12,
              Colors.blueGrey[200],
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
        ),
        title: Text(
          "حجارة ريموت وقلم",
          style: TextStyle(
              color: kTextColor, fontSize: 22, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
              child: StreamBuilder<QuerySnapshot>(
                stream: getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Product> products = [];

                    for (var doc in snapshot.data.docs) {
                      var data = doc.data();

                      products.add(Product(
                        color: data[KColor],
                        title: data[KTitle],
                        id: data[KId],
                        image: data[KImage],
                      ));
                      // Product product = Product.fromMap(snapshot.docs.data());
                      // print(products);
                      // noitifer.productList = _productList;
                    }
                    _products = [...products];
                    products.clear();
                    products = getProductCategory(KAllam);

                    return GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 3,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.93,
                        ),
                        itemBuilder: (context, index) {
                          Firebase.initializeApp();
                          return GestureDetector(
                            onTap: () async {
                              await canLaunch(whatsappUrl)
                                  ? launch(whatsappUrl)
                                  : Scaffold.of(context)
                                      .showSnackBar(new SnackBar(
                                      content: new Text('يرجي تنصيب واتساب'),
                                    ));
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    padding:
                                        EdgeInsets.all(kDefaultPaddin / 7.5),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${products[index].image}"),
                                          fit: BoxFit.fill),
                                    ),
                                    // child: SizedBox.expand(
                                    //   child: Hero(
                                    //       tag: "${products[index].id}",
                                    //       child: SizedBox.expand(
                                    //           // child: FittedBox(
                                    //           //   fit: BoxFit.fill,
                                    //           // ),
                                    //           )),
                                    // ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPaddin / 4),
                                ),
                                // Text(
                                //   "\$${product.price}",
                                //   style: TextStyle(fontWeight: FontWeight.bold),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPaddin / 5),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return Center(
                      child: Text('Loading...'),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Product> getProductCategory(String KAllam) {
    List<Product> products = [];
    for (var product in _products) {
      if (product.title == KAllam) {
        products.add(product);
      }
    }
    return products;
  }
}
