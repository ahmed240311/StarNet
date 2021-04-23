import 'package:flutter/material.dart';
import 'package:starnet/models/Product.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:starnet/models/Product.dart';
import '../../../constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ser extends StatefulWidget {
  @override
  _SerState createState() => _SerState();
}


class _SerState extends State<Ser> {
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
            "StarNet سيرفرات",
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
                    products = getProductCategory(KAllNovaServer);

                    return GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 6,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.70,
                        ),
                        itemBuilder: (context, index) {
                          Firebase.initializeApp();
                          return GestureDetector(
                            onTap: (){}
                            // async {
                            //   await canLaunch(whatsappUrl)
                            //       ? launch(whatsappUrl)
                            //       : Scaffold.of(context)
                            //       .showSnackBar(new SnackBar(
                            //     content: new Text('يرجي تنصيب واتساب'),
                            //   ));
                            // }
                            ,
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
                                    child: SizedBox.expand(
                                      child: Hero(
                                          tag: "${products[index].id}",
                                          child: SizedBox.expand(
                                            // child: FittedBox(
                                            //   fit: BoxFit.fill,
                                            // ),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPaddin / 4),
                                  child: Text(
                                    // 'title',
                                    '${products[index].title}',
                                    // products is out demo list
                                    // selk.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor.withOpacity(.8)),
                                  ),
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
  List<Product> getProductCategory(String KAllNovaServer) {
    List<Product> products = [];
    for (var product in _products) {
      if (product.color == KAllNovaServer ) {
        products.add(product);
      }
    }
    return products;

  }
}

