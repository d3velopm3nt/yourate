import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:flutter/material.dart';

import 'address_selection_view.form.dart';
import 'address_selection_viewmodel.dart';

@FormView(fields: [
  FormTextField(
    name: 'address',
  )
])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  // 2. Include the Generated Mixin for the form
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        body: ListView(
          children: [
            TextFormField(
			      decoration: const InputDecoration(hintText: 'Enter your address'),
			      controller: addressController,
			    ),
			    if (!model.hasAutoCompleteResults)
			     const Text('We have no suggestions for you'),
			    if (model.hasAutoCompleteResults)
			      ...model.autoCompleteResults.map((autoCompleteResult) => ListTile(
			            title: Text(autoCompleteResult.mainText ?? ''),
			            subtitle: Text(autoCompleteResult.secondaryText ?? ''),
			          ))
          ],
        ),
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}

