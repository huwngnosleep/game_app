import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChartScreen extends StatefulWidget {
  @override
  _ChartScreenState createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  List users = [];
  bool _isLoading = true;
  int _selectedIndex = 0;
  String _game;
  String routeArgs;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    routeArgs = ModalRoute.of(context).settings.arguments.toString();
    // print(routeArgs.toString());
    _selectedIndex = int.parse(routeArgs.substring(1, 2));
    _setGame(_selectedIndex);
  }

  void _setGame(int index) {
    String _currentGame = "";
    switch (_selectedIndex) {
      case 0:
        _currentGame = "Tap The Black";
        break;
      case 1:
        _currentGame = "Snake";
        break;
      default:
        break;
    }
    return setState(() {
      _game = _currentGame;
    });
  }

  Future fetchData() async {
    List loadData = [];

    var url = Uri.parse(
        "https://flutter-app-b5379-default-rtdb.asia-southeast1.firebasedatabase.app/highScore.json");
    try {
      var response = await http.get(url);
      final loadedData = json.decode(response.body) as Map<String, dynamic>;
      loadedData.forEach((key, value) {
        // print("value: ${value}\nkey: ${key}");
        loadData.add({"name": value["name"], "score": value["score"]});
      });

      loadData.sort((a, b) => b["score"].compareTo(a["score"]));
      loadData.reversed;
      setState(() {
        users = loadData;
      });
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("️🏆 $_game ️🏆"),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left_rounded),
            onPressed: () => Navigator.pop(context)),
        backgroundColor: Colors.brown.shade200,
        centerTitle: true,
      ),
      body: Row(
        children: [
          LayoutBuilder(
              builder: (context, constraint) => SingleChildScrollView(
                    child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: NavigationRail(
                            elevation: 5.0,
                            minWidth: 56.0,
                            groupAlignment: 1,
                            selectedIndex: _selectedIndex,
                            onDestinationSelected: (int index) {
                              setState(() {
                                _selectedIndex = index;
                              });
                              _setGame(_selectedIndex);
                            },
                            labelType: NavigationRailLabelType.all,
                            leading: Column(
                              children: [
                                SizedBox(height: 16.0),
                                Center(
                                  child: CircleAvatar(
                                    radius: 16.0,
                                    backgroundImage: NetworkImage(
                                        "https://st4.depositphotos.com/4329009/19956/v/380/depositphotos_199564354-stock-illustration-creative-vector-illustration-default-avatar.jpg"),
                                  ),
                                ),
                                SizedBox(height: 60)
                              ],
                            ),
                            selectedLabelTextStyle: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              letterSpacing: 1.0,
                            ),
                            unselectedLabelTextStyle: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 0.8,
                            ),
                            destinations: [
                              buildNavigationRailDes("Tap The Black"),
                              buildNavigationRailDes("Snake"),
                            ],
                          ),
                        )),
                  )),
          GameChart(_game, context, users)
        ],
      ),
      //*************************************************************** */
      // !_isLoading
      //     ?
      // Container(
      //         color: Colors.black,
      //         width: MediaQuery.of(context).size.width,
      //         height: double.infinity,
      //         child: ListView.builder(
      //             itemCount: users.length,
      //             itemBuilder: (BuildContext context, int i) {
      //               var icon;
      //               if (i == 0) {
      //                 icon = Icon(Icons.grade_rounded,
      //                     color: Colors.yellow, size: 30.0);
      //               } else if (i == 1) {
      //                 icon = Icon(Icons.grade_rounded,
      //                     color: Colors.grey.shade600, size: 30.0);
      //               } else if (i == 2) {
      //                 icon = Icon(Icons.grade_rounded,
      //                     color: Colors.deepOrange.shade900, size: 30.0);
      //               } else {
      //                 icon = Text("#" + (i + 1).toString(),
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 20.0,
      //                         color: Colors.blueGrey));
      //               }

      //               return Container(
      //                 padding: const EdgeInsets.only(top: 10.0),
      //                 height: 100.0,
      //                 child: Card(
      //                   margin: const EdgeInsets.symmetric(
      //                       horizontal: 23.0, vertical: 3.0),
      //                   color: Colors.grey.shade900,
      //                   child: Row(
      //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                     children: [
      //                       Row(
      //                         children: [
      //                           Padding(
      //                               padding: const EdgeInsets.only(
      //                                   left: 10.0, right: 24.0),
      //                               child: icon),
      //                           Container(
      //                               margin: const EdgeInsets.all(16.0),
      //                               child: Text(
      //                                 users[i]["name"].toString(),
      //                                 style: TextStyle(
      //                                     color: Colors.white,
      //                                     fontWeight: FontWeight.bold),
      //                               )),
      //                         ],
      //                       ),
      //                       Container(
      //                           margin: const EdgeInsets.only(right: 24.0),
      //                           child: Text(
      //                             users[i]["score"].toString(),
      //                             style: TextStyle(
      //                                 color: Colors.white,
      //                                 fontWeight: FontWeight.w500),
      //                           )),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //             }),
      //       )
      //     : Container(
      //         color: Colors.black,
      //         child: Center(
      //           child: CircularProgressIndicator(
      //               color: Colors.white, strokeWidth: 5.0),
      //         ),
      //       )
    );
  }
}

NavigationRailDestination buildNavigationRailDes(String brandName) {
  return NavigationRailDestination(
      icon: SizedBox.shrink(),
      label: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RotatedBox(quarterTurns: -3, child: Text(brandName)),
      ));
}

class GameChart extends StatelessWidget {
  final String game;
  final List users;
  GameChart(this.game, BuildContext context, this.users);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 25.0, 0, 0),
            child: MediaQuery.removePadding(
                context: context,
                removeRight: true,
                child: ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (BuildContext context, int i) {
                      var icon;
                      if (i == 0) {
                        icon = Icon(Icons.grade_rounded,
                            color: Colors.yellow, size: 30.0);
                      } else if (i == 1) {
                        icon = Icon(Icons.grade_rounded,
                            color: Colors.grey.shade600, size: 30.0);
                      } else if (i == 2) {
                        icon = Icon(Icons.grade_rounded,
                            color: Colors.deepOrange.shade900, size: 30.0);
                      } else {
                        icon = Text("#" + (i + 1).toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                                color: Colors.blueGrey));
                      }
                      return Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 24.0),
                                    child: icon),
                                Container(
                                    margin: const EdgeInsets.all(16.0),
                                    child: Text(
                                      users[i]["name"].toString(),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                            Container(
                                margin: const EdgeInsets.only(right: 24.0),
                                child: Text(
                                  users[i]["score"].toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )),
                          ],
                        ),
                      );
                    }))));
    // return Container(
    //   color: Colors.black,
    //   width: MediaQuery.of(context).size.width,
    //   height: double.infinity,
    //   child: ListView.builder(
    //       itemCount: users.length,
    //       itemBuilder: (BuildContext context, int i) {

    //         return Expanded(
    //           child: Card(
    //             margin:
    //                 const EdgeInsets.symmetric(horizontal: 23.0, vertical: 3.0),
    //             color: Colors.grey.shade900,
    //             child:

    // ),
    //         );
    //       }),
    // );
  }
}
