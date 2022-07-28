import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourate/app/app.nav.dart';
import '../home/home_view.dart';
import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
  static final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey =
      GlobalKey();
  MainView({Key? key}) : super(key: key);
  late BuildContext _context;
  List icons = [
    Icons.home,
    Icons.list,
    Icons.add,
    Icons.map_outlined,
    Icons.person,
  ];

  @override
  Widget build(BuildContext context) {
    _context = context;
    MainViewModel().runStartupLogic();
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (viewContext, model, child) => Scaffold(
          body: Navigator(
            key: Navigation.mainListNav,
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settings) =>
                Navigation.navigationRoutes(settings.name),
          ),
          bottomNavigationBar: bottomAppBar(context, model),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Visibility(
              visible: !keyboardIsOpened,
              child: FloatingActionButton(
                elevation: 10.0,
                backgroundColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.add,
                ),
                onPressed: () => getViewForIndex(2, model),
              ))),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  BottomAppBar bottomAppBar(BuildContext context, MainViewModel model) {
    return BottomAppBar(
      color: Theme.of(context).primaryColor,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildTabIcon(0, model),
          buildTabIcon(1, model),
          buildTabIcon(3, model),
          buildTabIcon(4, model),
        ],
      ),
    );
  }

  buildTabIcon(int index, MainViewModel model) {
    return Container(
      margin:
          EdgeInsets.fromLTRB(index == 3 ? 30 : 0, 0, index == 1 ? 30 : 0, 0),
      child: IconButton(
        icon: Icon(
          icons[index],
          size: 24.0,
        ),
        onPressed: () => getViewForIndex(index, model),
        color: model.currentIndex == index
            ? Theme.of(_context).secondaryHeaderColor
            : Theme.of(_context).textTheme.caption!.color,
      ),
    );
  }

  BottomNavigationBar bottomNavigationBar(MainViewModel model) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: model.currentIndex,
      onTap: model.setIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Add'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Map'),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Profile')
      ],
    );
  }

  curvedNavigationBar() {
    return CurvedNavigationBar(
        key: _bottomNavigationKey,
        items: <Widget>[
          Icon(icons[0], size: 30),
          Icon(icons[1], size: 30),
          Icon(icons[2], size: 30),
          Icon(icons[3], size: 30),
        ],
        onTap: (index) => getViewForIndex(index));
  }

  getViewForIndex(int currentIndex, [MainViewModel? model]) {
    model?.setIndex(currentIndex);
    switch (currentIndex) {
      case 0:
        return Navigation.mainListNav.currentState!
            .pushReplacementNamed(Routes.home);
      case 1:
        return Navigation.mainListNav.currentState!
            .pushReplacementNamed(Routes.restaurants);
      case 2:
        return Navigation.mainListNav.currentState!
            .pushReplacementNamed(Routes.addReview);
      case 3:
        return Navigation.mainListNav.currentState!
            .pushReplacementNamed(Routes.addressSelection);
      default:
        return const HomeView();
    }
  }
}
