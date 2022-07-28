
import 'package:stacked/stacked_annotations.dart';
import 'package:yourate/ui/views/startup/startup_view.dart';

import '../ui/views/home/home_view.dart';

@StackedApp(routes: [
  MaterialRoute(page:HomeView, initial:true),
  CupertinoRoute(page: StartupView)
])
class AppSetup{}