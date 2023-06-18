import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import '../../../../models/player_models/on_boarding_model.dart';
import 'on_boarding_states.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingStatesInitState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  var boardingController = PageController();
  bool isLast = false;

  List<OnBoardingModel> boarding = [
    OnBoardingModel("assets/images/boarding1.jpg",
        "New Look App will find for your the nearest salon / Beauty Center & can make a reservation easier & can find and purchase all cosmetics you need",
    LocaleKeys.start.tr()
    ),
    OnBoardingModel("assets/images/boarding2.jpg",
        "New Look App will find for your the nearest salon / Beauty Center & can make a reservation easier & can find and purchase all cosmetics you need",
        LocaleKeys.next.tr(),
    ),

    OnBoardingModel("assets/images/boarding3.jpg",
        "New Look App will find for your the nearest salon / Beauty Center & can make a reservation easier & can find and purchase all cosmetics you need",
        LocaleKeys.finish.tr(),
    ),
  ];
}
