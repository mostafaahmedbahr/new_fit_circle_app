import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/login/login_cubit/states.dart';

import '../login_screen.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isVisible = true;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }

  var passCon = TextEditingController();
  var emailCon = TextEditingController();
  // LoginModel? loginModel;
  // void userLogin({
  //   required String email,
  //   required String password,
  // })
  // {
  //   emit(LoginLoadingState());
  //   DioHelper.postData(
  //     url: "auth/login",
  //     data: {
  //       "email":email,
  //       "password":password,
  //     },
  //   ).then((value)
  //   {
  //     print(value.data);
  //     loginModel= LoginModel.fromJson(value.data);
  //     print("------------login done ---------");
  //     emit(LoginSuccessState(loginModel!));
  //   }).catchError((error)
  //   {
  //     print("error in login ${error.toString()}");
  //     emit(LoginErrorState(error.toString()));
  //   });
  // }



  // LogoutModel? logoutModel;
  // void signOut(BuildContext context)
  // {
  //   SharedPreferencesHelper.removeData(
  //       key: "token").then((value)
  //   {
  //     if(value)
  //     {
  //       AppNav.customNavigator(
  //         context: context,
  //         screen: const LoginScreen(),
  //         finish: true,
  //       );
  //     }
  //   });
  // }
}