import 'dart:async';
import '../../../constants.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';

class Location extends StatefulWidget {
  static const routeMeal = 'Location';

  @override
  State<Location> createState() => LocationState();
}

class LocationState extends State<Location> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.0487720, 31.2507220),
    zoom: 15.4746,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
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
          "عنوان المنفذ",
          style: TextStyle(
              color: kTextColor, fontSize: 22, fontWeight: FontWeight.w800),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * .5 / .9,
              child: GoogleMap(
                mapType: MapType.normal,
                myLocationEnabled: true,
                compassEnabled: true,
                initialCameraPosition: _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text('ممر1,غيط العدة,عابدين',
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColor.withOpacity(.8))),
          ),
          Text(
            "محافظة القاهرة,,غيط العدة",
            style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: kTextColor.withOpacity(.8)),
          ),
          Text(".الموسكي,محافظة القاهرة,مصر",
              style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w500,
                  color: kTextColor.withOpacity(.8))),
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: GestureDetector(
              onTap: () async {
                await canLaunch(whatsappUrl)
                    ? launch(whatsappUrl)
                    : Scaffold.of(context).showSnackBar(new SnackBar(
                        content: new Text('يرجي تنصيب واتساب'),
                      ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("01008550218 ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,

                          color: Colors.blue.withOpacity(.8))),
                  Text(":واتس اب ",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: kTextColor.withOpacity(.8))),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:5.0),
            child: Text(" تلفون : 23957145",

                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: kTextColor.withOpacity(.8))),
          ),
        ],
      ),
    );
  }
}
