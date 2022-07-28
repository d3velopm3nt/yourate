import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:yourate/app/locator.dart';

class MainViewModel extends IndexTrackingViewModel {
  final String _title = "Main View";
  String get title => _title;

 final _placesService = locator<PlacesService>();

	Future<void> runStartupLogic() async {
    _placesService.initialize(apiKey: 'AIzaSyBwE-7TYTh8ci1lNOILNuy1eWr9NP9-rDc');
	}
}
