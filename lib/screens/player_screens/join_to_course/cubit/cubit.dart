import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/join_to_course/cubit/states.dart';

class JoinToCourseCubit extends Cubit<JoinToCourseStates> {
  JoinToCourseCubit() : super(JoinToCourseInitState());

  static JoinToCourseCubit get(context) => BlocProvider.of(context);


  int currentValue = 150;

  changeCurrentValue(value)
  {
    currentValue = value;
    emit(ChangeCurrentValueState());
  }


  int currentWeightValue = 70;

  changeCurrentWeightValue(value)
  {
    currentWeightValue = value;
    emit(ChangeCurrentWeightValueState());
  }

  String? selectedGoal;
  String? selectedActivity;

  final List<String> goals = [
    'goal 1',
    'goal 2',
    'goal 3',
    'goal 4',
    'goal 5',
    'goal 6',
    'goal 7',
    'goal 8',
  ];

  final List<String> activities = [
    'activity 1',
    'activity 2',
    'activity 3',
    'activity 4',
    'activity 5',
    'activity 6',
    'activity 7',
    'activity 8',
  ];



  int val = 0;

  changeVal(value)
  {
    val = value;
    emit(ChangeValueState());
  }


}