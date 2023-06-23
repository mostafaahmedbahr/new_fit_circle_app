import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/bottom_nav_bar_screens/player_home/cubit/states.dart';

class PlayerHomeCubit extends Cubit<PlayerHomeStates> {
  PlayerHomeCubit() : super(PlayerHomeInitState());

  static PlayerHomeCubit get(context) => BlocProvider.of(context);


  List sliderImages = [
    "assets/images/bg 1.png",
    "assets/images/bg 1.png",
    "assets/images/bg 1.png",
  ];

  var carouselCon = CarouselController();
  int activeIndex = 0;

  changeActiveIndex(index)
  {
    activeIndex = index;
    emit(ChangeActiveIndexState());
  }
}