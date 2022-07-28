import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:yourate/app/locator.dart';
import './address_selection_view.form.dart';

class AddressSelectionViewModel extends FormViewModel {
  final _placesService = locator<PlacesService>();

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (addressValue != "") {
      final placesResults = await _placesService.getAutoComplete(addressValue!,types: ['restaurant'],region: 'za');

      if (placesResults != null) {
        _autoCompleteResults = placesResults;
        notifyListeners();
      }
    }
  }
}
