import 'package:covid_tracker/business_logic/models/country_cases.dart';
import 'package:covid_tracker/business_logic/view_models/home_screen_viewmodel.dart';
import 'package:covid_tracker/business_logic/view_models/map_viewmodel.dart';
import 'package:covid_tracker/ui/numberFormatter.dart';
import 'package:covid_tracker/ui/pages/corona_cases.dart';
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
        _Home_list(),
        _BuildUI_Map(),
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
        Expanded(child: _Search_list(str_search)),
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
        });
      },
      icons: [Icons.search, Icons.home, Icons.map],
      textStyle: TextStyle(color: Colors.red),
    );
  }
}

class _Search_list extends StatelessWidget {
  String search_str;

  _Search_list(this.search_str);

  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Home_Screen_ViewModel>(context);
    return filter(model.attrs).isEmpty
        ? Container()
        : _List_view(filter(model.attrs));
  }

  List<Country_cases> filter(List<Country_cases> base_list) {
    List<Country_cases> dummy_list = [];
    base_list.forEach((country_cases) {
      if (search_str != null && country_cases.Country_Region.toLowerCase()
          .startsWith(search_str.toLowerCase())) {
        dummy_list.add(country_cases);
      }
    });
    return dummy_list;
  }

}

class _Home_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<Home_Screen_ViewModel>(context);
    model.loadData();
    return model.attrs == null || model.attrs.isEmpty
        ? Align(
            child: CircularProgressIndicator(),
          )
        : _List_view(model.attrs);
  }

}

class _List_view extends StatelessWidget {
  List<Country_cases> list;

  _List_view(this.list);

  @override
  Widget build(BuildContext context) {
    return _listView();
  }

  Widget _listView() {
    return Container(
      color: Colors.black12,
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: ListTile(
              title: _customRowList(context, list[index]),
              onTap: () {
                Navigator.of(context)
                    .pushNamed(Corona_cases.ROUTE, arguments: list[index]);
              },
            ),
          );
        },
      ),
    );
  }

  Widget _customRowList(BuildContext context, Country_cases cases) {
    return Row(
      children: <Widget>[
        Expanded(
          child: cases.Country_Region.length < 8
              ? Text(
            cases.Country_Region,
            style: Theme.of(context).textTheme.headline2,
          )
              : Text(
            cases.Country_Region.substring(0, 7),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Icon(
            Icons.flag_rounded,
            color: Colors.red,
            size: 20,
          ),
        ),
        Expanded(
          child: Text(
            NumberFormatter.formatter(cases.Confirmed),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Text(
            NumberFormatter.formatter(cases.Recovered),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: Text(
            '\t\t' + NumberFormatter.formatter(cases.Deaths),
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    );
  }
}


class _BuildUI_Map extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model_home = Provider.of<Home_Screen_ViewModel>(context);
    var model_map = Provider.of<Map_ViewModel>(context);
    if (model_home.attrs.isNotEmpty) {
      model_map.add_all(model_home.attrs);
      if (model_map.allMarkers.isNotEmpty) {
        return GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(26.8206, 30.8025),
            zoom: 5.0,
          ),
          mapType: MapType.normal,
          markers: Set.from(model_map.allMarkers),
          minMaxZoomPreference: MinMaxZoomPreference(5.0, 10.0),
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
