import 'package:flutter/material.dart';
import 'package:svuce_app/app/colors.dart';
import 'package:svuce_app/app/icons.dart';
import 'package:svuce_app/core/models/home_view_item.dart';
import 'package:svuce_app/ui/utils/ui_helpers.dart';
import 'package:svuce_app/ui/screens/home/home_view_items.dart';
import 'package:svuce_app/ui/widgets/bottom_navigation.dart';

class HomeWrapper extends StatefulWidget {
  final Widget drawer;
  final List<HomeViewItem> homeViewItems;
  final List<Widget> homeItems;

  const HomeWrapper({Key key, this.drawer, this.homeItems, this.homeViewItems})
      : super(key: key);
  @override
  _HomeWrapperState createState() => _HomeWrapperState();
}

class _HomeWrapperState extends State<HomeWrapper> {
  int currentIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Text(widget.homeViewItems[currentIndex].title,
              style: UIHelpers.fromContext(context)
                  .headline
                  .copyWith(color: textPrimaryColor)),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  notificationIcon,
                  color: primaryColor,
                ),
                onPressed: () {
                  //TODO: Go to Notifications
                }),
            IconButton(
                icon: Icon(
                  keyPadIcon,
                  color: primaryColor,
                ),
                onPressed: () {
                  _scaffoldKey.currentState.openEndDrawer();
                }),
          ],
        ),
        endDrawer: widget.drawer,
        body: IndexedStack(
          index: currentIndex,
          children: widget.homeItems,
        ),
        backgroundColor: backgroundColor,
        bottomNavigationBar: AnimatedBottomBar(
          items: homeViewItems,
          itemTapped: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          currentIndex: currentIndex,
        ));
  }
}
