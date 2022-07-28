import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:yourate/ui/shared/address_selection/address_selection_view.dart';
import 'package:yourate/ui/views/home/home_view.dart';
import 'package:yourate/ui/views/restaurants/restaurants_view.dart';
import 'package:yourate/ui/views/reviews/review/review_view.dart';

class Navigation {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
 
  static String previousRoute = "";
  static String currentRoute = "";

  static navigationRoutes(String? name) {
    Widget page;
    previousRoute = (previousRoute == "" ? name : currentRoute)!;
    currentRoute = name!;
    switch (name) {
      case Routes.home:
        page = const HomeView();
        break;
      case Routes.restaurants:
        page = const Restaurants();
        break;
      case Routes.addReview:
        page = const ReviewView();
        break;
      case Routes.addressSelection:
        page = AddressSelectionView();
        break;
      default:
        page = const HomeView();
        break;
    }

    return PageRouteBuilder<dynamic>(
        pageBuilder: (_, __, ___) => page,
        transitionDuration: const Duration(seconds: 0));
  }

  static previousPage() {
    mainListNav.currentState!
            .pushReplacementNamed(previousRoute);
  }
}

class Routes {
  static const String home = "/";
  static const String restaurants = "/restaurants";
  static const String addressSelection = "/address-select";
  static const String addReview = "/add-review";
}
