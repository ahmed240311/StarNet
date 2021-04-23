import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'models/Product.dart';

const kTextColor = Color(0xFF535353);
const kTextLightColor = Color(0xFFACACAC);

const kDefaultPaddin = 20.0;
const phone = "+2001008550218";
const KTitle = 'title';
const Ktitle = 'ferary';
const KId = 'id';
const KData = 'data';
const KColor = 'color';
const KImage = 'image';
const KVideo = 'video';

const Kselk100 = 'PbGzlePh11Iv8a68FHIs';
const Kselk50 = 'n7NFrsGsSLGQw0mQG3SD';
const KTv43 = 'mpjWegCCxPyaWioxXaHq';
const KTv56 = '1xOL1XcbWnKF687v8KzR';
const KAllReserver = '0xFF94B0B2';
const KStandAll = '0xFF94B0B5';
const KAllNovaServer = '0xFF94B0B6';
const Hummer = '/Products/7GqndCsVKGvTmuHRcwWS';
const S2070 = '/Products/H4F3uj765PoMGuDdkYdl';
const S2030 = '/Products/NU6DqGsZhb34HYWbALYY';
const S2050 = '/Products/XlVzzE3A5OthGrVpTQrU';
const S9000 = '/Products/fierrBqfXobCd4eZnrtW';

const KAllam = 'a';
const KSunT = 'صن + تايمر';
const KSunD = 'صن + داكي 4 ميجا';
const KAllLnbR1 = '0xFF94B0B4';
const KAllRemote = '0xFF94B0B1';
const KDiffM = 'عدسات Led متنوعة';
const KDiffA = 'adaptor Starnet أصلي';
const KDiff ='';
const KProduct ='0xFF94B0B7';



const whatsappUrl = "whatsapp://send?phone=$phone";

Stream<QuerySnapshot> getProducts() {
//   return StreamBuilder(
//     stream: FirebaseFirestore.instance.collection('Products').snapshots(),
//     builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//       if (!snapshot.hasData) {
//         return Center(
//             child: Text(
//               'please wait...',
//               style: TextStyle(fontSize: 15.0),
//             ));
//       }
//       for (int i = 0; i < snapshot.data.documents.length; i++) {
//
// final image=snapshot.data.documents[i]['image'];
//
//       }
//       return Container(
//         child: image,
//       );
//     },
//
//   );
  Firebase.initializeApp();
  return FirebaseFirestore.instance.collection('Products').snapshots();

}


