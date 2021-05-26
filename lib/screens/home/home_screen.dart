import 'package:flutter/material.dart';
import 'package:starnet/constants.dart';
import 'package:starnet/models/Product.dart';
import 'package:starnet/models/style.dart';
import 'package:starnet/screens/home/components/body.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final _SearchDemoSearchDelegate _delegate = _SearchDemoSearchDelegate();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final Product product;

  int _lastIntegerSelected;

  _HomeScreenState({this.product});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.white12,
                  Colors.blueGrey[200],
                ])),
          ),
          // backgroundColor: Colors.white,
          elevation: 10,
          // leading: Padding(
          //   padding: const EdgeInsets.only(left:15.0),
          //   child: IconButton(
          //     icon: Icon(Icons.search,size: 26.0,color: kTextColor),
          //     onPressed: () async {
          //       final int selected = await showSearch<dynamic>(
          //         context: context,
          //         delegate: _delegate,
          //       );
          //       if (selected != null && selected != _lastIntegerSelected) {
          //         setState(() {
          //           _lastIntegerSelected = selected;
          //         });
          //       }
          //     },
          //
          //   ),
          // ),
          title: Text(
            "ستار نت",
            style: TextStyle(
                letterSpacing: 1.0,
                // color: Col,
                foreground: Paint()..shader = linearGradient,
                fontFamily: 'Cairo-Black',
                fontWeight: FontWeight.bold,
                fontSize: 27),
          ),
          centerTitle: true,
          // actions: <Widget>[
          //   IconButton(
          //     icon: SvgPicture.asset(
          //       "assets/icons/cart.svg",
          //       // By default our  icon color is white
          //       color: kTextColor,
          //     ),
          //     onPressed: () {},
          //   ),
          //   SizedBox(width: kDefaultPaddin / 2)
          // ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                child: Text(
                  "رسيفر",
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'Cairo-Black',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.2),
                ),
              ),
              Tab(
                child: Text(
                  "متنوعات",
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'Cairo-Black',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
              Tab(
                child: Text(
                  "ريموت",
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'Cairo-Black',
                      fontWeight: FontWeight.bold,
                      fontSize: 15.2),
                ),
              ),
              Tab(
                child: Text(
                  "سيرفرات",
                  style: TextStyle(
                      color: kTextColor,
                      fontFamily: 'Cairo-Black',
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              ),
            ],
          ),
        ),

        body: Body(),
        // body: Categories(),
      ),
    );
  }
}

// Future<List<Product>> produts() async {
//   // Query the table for all The Dogs.
//   final List<Map<String, dynamic>> maps = await ;
//
//   return List.generate(maps.length, (i) {
//     return Product(
//       id: maps[i]['id'],
//       title: maps[i]['name'],
//     );
//   });
// }

// class _SearchDemoSearchDelegate extends SearchDelegate<dynamic> {
//   final List<dynamic> _data = List();
//   final List<String> _titles = List();
//   final List<dynamic> _history = [2070, 2050, 2030, 9000, 'hummer'];
//
//   _SearchDemoSearchDelegate() {
//     Product products = Product();
//     var product;
//     for (products in product.title) {
//       _titles.add(products.title);
//     }
//
//     _data.addAll([
//       product.title
//       // MyDatabase.lnbs.map((p) => p.title).toList(),
//       // MyDatabase.frees.map((p) => p.title).toList(),
//       // MyDatabase.remotes.map((p) => p.title).toList(),
//       // MyDatabase.selks.map((p) => p.title).toList(),
//       // MyDatabase.suns.map((p) => p.title).toList(),
//       // MyDatabase.stands.map((p) => p.title).toList(),
//       // MyDatabase.differents.map((p) => p.title).toList(),
//     ]);
//   }
//
//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       tooltip: 'Back',
//       icon: AnimatedIcon(
//         icon: AnimatedIcons.menu_arrow,
//         progress: transitionAnimation,
//       ),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> results = List();
//     String result;
//     for (result in _titles) {
//       if (result.contains(query)) {
//         results.add(result);
//       }
//     }
//     final Iterable<dynamic> suggestions = query.isEmpty ? _history : results;
//     // .where((var i) => '$i'.startsWith(query));
//
//     return _SuggestionList(
//       query: query,
//       suggestions: suggestions.map<String>((var i) => '$i').toList(),
//       onSelected: (String suggestion) {
//         query = suggestion;
//         showResults(context);
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     var searched = query;
//     if (searched == null || !_titles.contains(searched)) {
//       return Text(
//         '"$query"\n ليس صحيحا .\nحاول مرة أخري.',
//         textAlign: TextAlign.center,
//       );
//     } else {
//       return Text(
//         '"$query"\n  صحيحا .',
//         textAlign: TextAlign.center,
//       );
//     }
//
//     // return SingleChildScrollView(child: Body());
//   }
//
//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return <Widget>[
//       if (query.isEmpty)
//         IconButton(
//           tooltip: 'Voice Search',
//           icon: const Icon(
//             Icons.mic,
//             color: Colors.blueAccent,
//           ),
//           onPressed: () {},
//         )
//       else
//         IconButton(
//           tooltip: 'Clear',
//           icon: const Icon(Icons.clear, color: Colors.blueAccent),
//           onPressed: () {
//             query = '';
//             showSuggestions(context);
//           },
//         ),
//     ];
//   }
// }

// class _ResultCard extends StatelessWidget {
//    _ResultCard({this.integer, this.searchDelegate});
//
//    var integer;
//   final SearchDelegate<dynamic> searchDelegate;

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return GestureDetector(
//       onTap: () {
//         searchDelegate.close(context, integer);
//       },
//       child: Card(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: <Widget>[
//               Text(
//                 '$integer',
//                 style: theme.textTheme.headline.copyWith(fontSize: 72.0),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _SuggestionList extends StatelessWidget {
//   const _SuggestionList({this.suggestions, this.query, this.onSelected});
//
//   final List<String> suggestions;
//   final String query;
//   final ValueChanged<String> onSelected;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     return ListView.builder(
//       itemCount: suggestions.length,
//       itemBuilder: (BuildContext context, var i) {
//         final String suggestion = suggestions[i];
//         return ListTile(
//           leading: query.isEmpty ? const Icon(Icons.history) : const Icon(null),
//           title: RichText(
//             text: TextSpan(
//               text: suggestion.substring(0, query.length),
//               style:
//                   theme.textTheme.subhead.copyWith(fontWeight: FontWeight.bold),
//               children: <TextSpan>[
//                 TextSpan(
//                   text: suggestion.substring(query.length),
//                   style: theme.textTheme.subhead,
//                 ),
//               ],
//             ),
//           ),
//           onTap: () {
//             onSelected(suggestion);
//           },
//         );
//       },
//     );
//   }
// }
