import 'package:flutter/material.dart';
import 'package:game_app/model/achivement.dart';

String anhDaiDien =
    "https://thumbs.dreamstime.com/b/default-avatar-profile-icon-vector-social-media-user-portrait-176256935.jpg";

String cover =
    "https://1.bp.blogspot.com/-NAkkiZQDXPs/XqZhmJcQwzI/AAAAAAAAjLU/xOH13rRxIrQartXVb56Ppm9QsZeJSlzQwCLcBGAsYHQ/s1600/Anh-Bia-Dep-Chat-Fb%2B%25281%2529.jpg";
final userAchievement = Achievement.userAchievement;

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  _renderRank(int rank) {
    if (rank > 2) {
      return Text("#${rank + 1}");
    }

    if (rank == 0) {
      Icon icon = Icon(Icons.star_rate_rounded, color: Colors.yellow);
      return icon;
    } else if (rank == 1) {
      Icon icon = Icon(Icons.star_rate_rounded, color: Colors.grey);
      return icon;
    } else {
      Icon icon = Icon(Icons.star_rate_rounded, color: Colors.orange.shade700);

      return icon;
    }
  }

  _customList(userAchievement) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _renderRank(userAchievement.rank),
          Spacer(),
          Text(userAchievement.game),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Text(userAchievement.point),
          )
          //
        ],
      ),
    );
  }

  _customItemsTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
      ),
    );
  }

  _customDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Divider(thickness: 1.0),
    );
  }

  _userListTile(BuildContext context, String title, String subtitle, int index,
      color, onPress) {
    return Material(
        color: Colors.transparent,
        child: InkWell(
            child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          leading: Icon(_userTitleIcons[index], color: color),
          onTap: onPress,
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            elevation: 4.0,
            expandedHeight: 200.0,
            pinned: true,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    centerTitle: true,
                    background: Stack(
                      children: [
                        SizedBox(
                          height: 220,
                          width: MediaQuery.of(context).size.width,
                          child: Image(
                            fit: BoxFit.fill,
                            image: NetworkImage(cover),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.purpleAccent,
                              )),
                        ),
                      ],
                    ),
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(width: 12.0),
                        Container(
                            height: kToolbarHeight / 1.8,
                            width: kToolbarHeight / 1.8,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.black),
                              ],
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(anhDaiDien)),
                            )),
                        SizedBox(width: 12),
                        Text("Guest",
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                _customItemsTitle("User Information"),
                _customDivider(),
                //user information
                _userListTile(context, "Email", "example@example.com", 0,
                    Colors.cyan, () {}),
                _userListTile(
                    context, "Phone", "0913115560", 1, Colors.green, () {}),
                _userListTile(
                    context, "Joined Date", "12/01/2002", 2, null, () {}),
                _userListTile(
                    context, "Favorite games", "", 4, Colors.pink, () {}),
                //
                _customItemsTitle("Achievement"),
                _customDivider(),
                //achievement of each game if exists ***************************************
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("RANK"),
                          Spacer(),
                          Text("GAME"),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text("SCORE"),
                          )
                          // Icon(Icons.star_rate_rounded)
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: userAchievement.length,
                          itemBuilder: (BuildContext context, int i) =>
                              _customList(userAchievement[i])),
                    )
                  ],
                ),
                //
                //setting ***************************************
                _customItemsTitle("Settings"),
                _customDivider(),
                _userListTile(context, "Log out", "", 3, null, () {})
              ]))
        ],
      ),
    );
  }
}

List<IconData> _userTitleIcons = [
  Icons.email,
  Icons.phone,
  Icons.watch_later,
  Icons.exit_to_app_rounded,
  Icons.favorite
];
