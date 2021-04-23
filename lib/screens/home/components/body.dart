import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:starnet/constants.dart';
import 'package:starnet/models/Product.dart';
import 'package:starnet/screens/details/components/Lnb.dart';
import 'package:starnet/screens/details/components/Selk.dart';
import 'package:starnet/screens/details/components/Stand.dart';
import 'package:starnet/screens/details/components/Sun.dart';
import 'package:starnet/screens/details/components/Video.dart';
import 'package:starnet/screens/details/components/allam.dart';
import 'package:starnet/screens/details/components/different.dart';
import 'package:starnet/screens/details/components/free.dart';
import 'package:starnet/screens/details/components/location.dart';
import 'package:starnet/screens/details/components/server.dart';
import 'package:starnet/screens/details/details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class Body extends StatefulWidget {
  // List<Product> productsData;
  // Body({this.productsData});
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Product> _products = [];
  List<Product> _tap1products = [];
  List<Product> _tap3products = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return TabBarView(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
              child: StreamBuilder<QuerySnapshot>(
                stream: getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData) {
                    List<Product> products = [];

                    for (var doc in snapshot.data.docs) {
                      var data = doc.data();
                      products.add(Product(
                          color: data[KColor],
                          title: data[KTitle],
                          id: data[KId],
                          image: data[KImage],
                          data: data[KData]));
                      // Product product = Product.fromMap(snapshot.docs.data());
                      // print(products);
                      // noitifer.productList = _productList;
                    }
                    _products = [...products];
                    products.clear();
                    _tap1products = getProductCategory(KProduct);
                    // _tap3products = getProductCategory(KAllRemote);
                    return GridView.builder(
                        physics: ClampingScrollPhysics(),
                        itemCount: 2,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.85,
                        ),
                        itemBuilder: (context, index) {
                          Firebase.initializeApp();
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    product: _tap1products[index],
                                  ),
                                )),
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
                                              "${_tap1products[index].image}"),
                                          fit: BoxFit.fill),
                                    ),
                                    child: SizedBox.expand(
                                      child: Hero(
                                          tag: "${_tap1products[index].id}",
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
                                    '${_tap1products[index].title}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: kTextColor.withOpacity(.8)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: kDefaultPaddin / 5),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            Positioned(
              top: size.height * .72,
              right: size.height * 0.03,
              child: FloatingActionButton(
                onPressed: () {
                  displayBottomSheet(context);
                },
                child: Icon(
                  Icons.menu,
                  size: 30.0,
                ),
              ),
            ),

            // ),
          ],
        ),
        Column(
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
                            data: data[KData]));
                        // Product product = Product.fromMap(snapshot.docs.data());
                        // print(products);
                        // noitifer.productList = _productList;
                      }
                      _products = [...products];
                      products.clear();
                      products = getProductCategory(KProduct);
                      // _tap3products = getProductCategory(KAllRemote);
                      // _tap1products.isNotEmpty?
                      return GridView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: 5,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.65,
                          ),
                          itemBuilder: (context, index) {
                            Firebase.initializeApp();
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      product: products[index],
                                    ),
                                  )),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
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
                                      '${products[index].title}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor.withOpacity(.8)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kDefaultPaddin / 5),
                                  ),
                                ],
                              ),
                            );
                          });
                    } else {
                      return Center(child: Text('Loading...'));
                    }
                  },
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefaultPaddin, vertical: kDefaultPaddin),
                child:
                    // _tap3products.isNotEmpty ?
                    StreamBuilder<QuerySnapshot>(
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
                            data: data[KData]));
                        // Product product = Product.fromMap(snapshot.docs.data());
                        // print(products);
                        // noitifer.productList = _productList;
                      }
                      _products = [...products];
                      products.clear();
                      // products = getProductCategory(KProduct);
                      _tap3products = getProductCategory(KAllRemote);
                      // _tap1products.isNotEmpty?
                      return GridView.builder(
                          physics: ClampingScrollPhysics(),
                          itemCount: 23,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: kDefaultPaddin,
                            crossAxisSpacing: kDefaultPaddin,
                            childAspectRatio: 0.70,
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
                                      height:
                                          MediaQuery.of(context).size.height,
                                      padding:
                                          EdgeInsets.all(kDefaultPaddin / 7.5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "${_tap3products[index].image}"),
                                            fit: BoxFit.fill),
                                      ),
                                      child: SizedBox.expand(
                                        child: Hero(
                                            tag: "${_tap3products[index].id}",
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
                                      '${_tap3products[index].title}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: kTextColor.withOpacity(.8)),
                                    ),
                                  ),
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
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(
            15.0,
          ),
          child: Video(),
        ),
      ],
    );
  }

  displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(22.0),
                topLeft: Radius.circular(22.0))),
        backgroundColor: Colors.blueGrey[100],
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          Size size = MediaQuery.of(context).size;
          return Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 4.0 * 3.0,
            ),
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Row(
                    children: <Widget>[
                      CircleAvatar(
                        child: Image.asset('assets/images/Logo.png'),
                        radius: 40.0,
                        backgroundColor: Color(0xFF3D82AE),
                      ),
                      Padding(padding: EdgeInsets.only(left: 10.0)),
                      Text('Star ',
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.w900)),
                      Text(
                        "N",
                        style: TextStyle(
                            color: Colors.orange[300],
                            fontSize: 26.0,
                            fontWeight: FontWeight.w900),
                      ),
                      Text("et",
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
                Divider(
                  height: 8.0,
                  color: Colors.grey[900],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        new Wrap(
//                  alignment: WrapAlignment.end,
                          spacing: 5.0,
                          children: <Widget>[
                            new ListTile(
                              leading: new Icon(
                                Icons.location_on,
                                color: Color(0xFF3D82AE),
                              ),
                              title: new Text('منفذ البيع',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                // Navigator.pushNamed(context, MyAccountsPage.id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Location()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.remove_red_eye,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('LNB عدسات ستارنت',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            LNb()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.add_road,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('StarNet أسلاك',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SELk()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.aspect_ratio,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('ستاندات مستوردة',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            StanD()));
                              },
                            ),
                            new ListTile(
                              leading:
                                  new Icon(Icons.tv, color: Color(0xFF3D82AE)),
                              title: new Text('StarNet سيرفرات',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            Ser()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.cast_connected,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('رسيفر صن + 4 ميجا',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SUn()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.cast_connected,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('رسيفر فري(كبير-مني)',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            FRee()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.select_all,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('StarNet متنوعات',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            DiFFerent()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.settings_remote_outlined,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('حجارة ريموت وقلم',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ALLam()));
                              },
                            ),
                            new ListTile(
                              leading: new Icon(Icons.help,
                                  color: Color(0xFF3D82AE)),
                              title: new Text('قناة الدعم الفني',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600)),
                              onTap: () async {
                                _fasebook(
                                    "https://www.youtube.com/channel/UCJr1MFcGzB3d9z0p937ixeg/featured");
                              },
                            ),
                            Divider(
                              height: 5.1,
                              color: Colors.grey[900],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  List<Product> getProductCategory(String KAllRemote) {
    List<Product> products = [];
    for (var product in _products) {
      if (product.color == KAllRemote) {
        products.add(product);
      }
    }
    return products;
  }
}

Future<void> _fasebook(String url) async {
  if (await canLaunch(url)) {
    final bool nativeAppLaunchSucceeded = await launch(
      url,
      forceSafariVC: false,
      universalLinksOnly: true,
    );
    if (!nativeAppLaunchSucceeded) {
      await launch(
        url,
        forceSafariVC: true,
      );
    }
  }
}
