import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/ui/components/buildui_map.dart';
import 'package:covid_tracker/ui/components/home_list.dart';
import 'package:covid_tracker/ui/components/search_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static final ROUTE = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  MotionTabController _tabController;

  // search
  String str_search;

  @override
  void initState() {
    _tabController = MotionTabController(initialIndex: 1, vsync: this);
    Provider.of<Home_Screen_ViewModel>(context, listen: false).loadData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppBar(),
        body: _buildUi(),
        bottomNavigationBar: _navigationBar());
  }

  Widget _buildAppBar() {
    if (_tabController.index == 0 || _tabController.index == 1) {
      return AppBar(
        title: _customRowBar(),
        backgroundColor: Colors.redAccent,
        elevation: 0,
      );
    }
  }

  Widget _customRowBar() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            'Location',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: Icon(
            Icons.arrow_downward_sharp,
            color: Colors.white,
            size: 20,
          ),
        ),
        Expanded(
          child: Text(
            '  Cases',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: Text(
            'Recovered',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: Text(
            '    Deaths',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
      ],
    );
  }

  Widget _buildUi() {
    return MotionTabBarView(
      controller: _tabController,
      children: <Widget>[
        _buildUI_Search(),
        Home_list(),
        BuildUI_Map(
          latLng: LatLng(26.8206, 30.8025),
          zoom: 5.0,
        ),
      ],
    );
  }

  Widget _buildUI_Search() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            cursorColor: Colors.green,
            decoration: InputDecoration(
              hintText: 'Search...',
              labelText: 'Search',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            onChanged: (value) {
              setState(() {
                str_search = value.toString().trim();
              });
            },
          ),
        ),
        Expanded(
          child: Search_list(str_search),
        ),
      ],
    );
  }

  Widget _navigationBar() {
    return MotionTabBar(
      labels: ["Search", "Home", "Map"],
      initialSelectedTab: "Home",
      tabIconColor: Colors.green,
      tabSelectedColor: Colors.red,
      onTabItemSelected: (int value) {
        setState(() {
          _tabController.index = value;
          str_search = '';
        });
      },
      icons: [Icons.search, Icons.home, Icons.map],
      textStyle: TextStyle(color: Colors.red),
    );
  }
}
