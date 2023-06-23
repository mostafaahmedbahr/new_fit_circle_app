
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/register/register_cubit/states.dart';
import 'dart:io';



class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
    'Item5',
    'Item6',
    'Item7',
    'Item8',
  ];
  final List<String> genders = [
    'male',
    'female',
  ];
  final List<String> types = [
    'user',
    'admin',
    'superAdmin',
  ];
  String? selectedValue;
  String? selectedGender;
  String? selectedType;
  int pageIndex = 1;
  var value = "1";
  changeSearchPage(index)
  {
    pageIndex = index;
    emit(ChangeStartPage());
  }

  var nameCon = TextEditingController();
  var userNameCon = TextEditingController();
  var passCon = TextEditingController();
  var confirmPassCon = TextEditingController();
  var emailCon = TextEditingController();
  var phoneCon = TextEditingController();
  var countryCon = TextEditingController();
  var birthDateCon = TextEditingController();


  bool isVisible = true;
  void changeSuffixIcon()
  {
    isVisible =! isVisible;
    emit(ChangeSuffixIconState());
  }
  bool isVisible2 = true;
  void changeSuffixIcon2()
  {
    isVisible2 =! isVisible2;
    emit(ChangeSuffixIconState2());
  }

  //
  // RegisterModel? registerModel;
  // void userRegister(
  //     {
  //
  //   required String name,
  //   required String userName,
  //   required String gender,
  //       required String email,
  //   required String phoneCountry,
  //   required String birthdate,
  //   required String countryId,
  //   required String passwordConfirmation,
  //   required String password,
  // }
  // )
  // {
  //   emit(RegisterLoadingState());
  //   DioHelper.postData(
  //     url: "v1/register",
  //     data: {
  //       // "name" : "name111111",
  //       // "user_name":"userName111111",
  //       // "gender":"male",
  //       // "email":"email@gmail.com111111",
  //       // "phone":"01127249119",
  //       // "phone_country" : "EG",
  //       // "birthdate" : "1998-08-24",
  //       // "country_id" : "1",
  //       // "password":'00000000',
  //       // "password_confirmation" :"00000000",
  //       "name" : name,
  //       "user_name":userName,
  //       "gender":gender,
  //       if(email.contains("@"))"email":email,
  //       if(!email.contains("@"))"phone":email,
  //       "phone_country" : phoneCountry,
  //       "birthdate" : birthdate,
  //       "country_id" : countryId,
  //       "password":password,
  //       "password_confirmation" :passwordConfirmation,
  //     },
  //   ).then((value)
  //   {
  //     print(value.statusCode);
  //     if(value.statusCode==201){
  //       ToastConfig.showToast(
  //         msg: "Register in successfully",
  //         toastStates: ToastStates.Success,
  //       );
  //     }
  //     registerModel = RegisterModel.fromJson(value.data);
  //     print("------------ register done ---------");
  //     emit(RegisterSuccessState(registerModel!));
  //   }).catchError((error)
  //   {
  //     if (error is DioError && error.response?.statusCode == 422){
  //       final data = error.response?.data;
  //       final message = data['message'];
  //       // final errors = Map<String, List<String>>.from(data['errors']);
  //       ToastConfig.showToast(
  //         msg: "${message}",
  //         toastStates: ToastStates.Error,
  //       );
  //     }
  //     print("error in register ${error.toString()}");
  //     emit(RegisterErrorState(error.toString()));
  //   });
  // }


  File? file;
  Future uploadOnlyImage() async {
    emit(UploadLoadingState());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ["jpg", "png", "jpeg"],
      type: FileType.custom,
    );
    file = File(result?.files.single.path ?? "");
    debugPrint(result!.files.single.path);
    debugPrint("---------- upload is done ------------");
    emit(UploadSuccessState());
  }
}