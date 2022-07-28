import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:yourate/database/constants.dart';
import 'package:yourate/ui/shared/address_selection/address_selection_view.dart';
import 'package:yourate/ui/views/reviews/review/review_viewmodel.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewViewModel>.reactive(
      builder: (viewContext, model, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            title: const Text('New Review'),
          ),
          body: Theme(
              data: Constants.lightTheme,
              child: Stepper(
                currentStep: model.currentIndex,
                onStepCancel: () {
                  if (model.currentIndex > 0) {
                    model.setIndex(model.currentIndex - 1);
                  }
                },
                onStepContinue: () {
                  if (model.currentIndex <= 0) {
                    model.setIndex(model.currentIndex + 1);
                  }
                },
                onStepTapped: (int index) {
                  model.setIndex(index);
                },
                steps: <Step>[
                  Step(
                    title: const Text('Step 1 - Where did you eat?'),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text('Content for Step 1'),
                    ),
                  ),
                  const Step(
                    title: Text('Step 2 title'),
                    content: Text('Content for Step 2'),
                  ),
                ],
              ))),
      viewModelBuilder: () => ReviewViewModel(),
    );
  }
}
