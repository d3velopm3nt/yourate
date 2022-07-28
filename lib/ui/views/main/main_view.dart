import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:yourate/app/app.router.dart';
import 'package:yourate/ui/shared/address_selection/address_selection_view.dart';
import 'package:yourate/ui/views/restaurants/restaurants_view.dart';
import 'package:yourate/ui/views/reviews/review/review_view.dart';
import '../home/home_view.dart';
import 'main_viewmodel.dart';

class MainView extends StatelessWidget {
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
            key: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
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
                onPressed: () => model.setIndex(2),
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
        onPressed: () => model.setIndex(index),
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

  getViewForIndex(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return const HomeView();
      case 1:
        return const Restaurants();
      case 2:
        return AddressSelectionView();
      default:
        return const HomeView();
    }
  }
}
