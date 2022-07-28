// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:places_service/places_service.dart' as _i4;
import 'package:stacked_services/stacked_services.dart' as _i3;

import '../services/third_party_services_module.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final thrirdPartyServicesModule = _$ThrirdPartyServicesModule();
  gh.lazySingleton<_i3.DialogService>(
      () => thrirdPartyServicesModule.dialogService);
  gh.lazySingleton<_i3.NavigationService>(
      () => thrirdPartyServicesModule.navigationService);
  gh.lazySingleton<_i4.PlacesService>(
      () => thrirdPartyServicesModule.placesService);
  return get;
}

class _$ThrirdPartyServicesModule extends _i5.ThrirdPartyServicesModule {
  @override
  _i3.DialogService get dialogService => _i3.DialogService();
  @override
  _i3.NavigationService get navigationService => _i3.NavigationService();
  @override
  _i4.PlacesService get placesService => _i4.PlacesService();
}
