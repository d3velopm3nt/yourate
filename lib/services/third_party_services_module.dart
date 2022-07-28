import 'package:injectable/injectable.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_services/stacked_services.dart';

@module
abstract class ThrirdPartyServicesModule {
  @lazySingleton
  NavigationService get navigationService;
  @lazySingleton
  DialogService get dialogService;
  @lazySingleton
  PlacesService get placesService;

}
