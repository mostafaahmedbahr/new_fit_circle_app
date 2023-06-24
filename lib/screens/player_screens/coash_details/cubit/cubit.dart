

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/coash_details/cubit/states.dart';



class CoashesDetailsCubit extends Cubit<CoashesDetailsStates> {
  CoashesDetailsCubit() : super(CoashesDetailsInitState());

  static CoashesDetailsCubit get(context) => BlocProvider.of(context);

  int pageIndex = 1;
  changeSearchPage(index)
  {
    pageIndex = index;
    emit(ChangeSearchPage());
  }

}