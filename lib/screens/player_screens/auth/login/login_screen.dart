
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/nav.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_sized_box.dart';
import '../../../../widgets/custom_text.dart';
import '../register/register_screen.dart';
import 'login_cubit/cubit.dart';
import 'login_cubit/states.dart';


class PlayerLoginScreen extends StatelessWidget {
  const PlayerLoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    return   BlocProvider(
      create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {
          // if(state is LoginSuccessState) {
          //   if (state.loginModel.code == 200 && state.loginModel.message=="مرحبًا بعودتك") {
          //     TOKEN = state.loginModel.token;
          //     debugPrint(state.loginModel.token);
          //     debugPrint("------------ token ---------------");
          //     SharedPreferencesHelper.saveData(
          //       key: "token",
          //       value: state.loginModel.token,
          //     );
          //     SharedPreferencesHelper.saveData(
          //       key: "proId",
          //       value: state.loginModel.data.profile.toString(),
          //     );
          //     print(state.loginModel.data.profile.toString(),);
          //     ToastConfig.showToast(
          //       msg: state.loginModel.message,
          //       toastStates: ToastStates.Success,
          //     );
          //     AppNav.customNavigator(
          //       context: context,
          //       screen:   LayOutScreen(),
          //       finish: false,
          //     );
          //   }
          //   if(state.loginModel.code==401 && state.loginModel.message=="حسابك غير نشط")
          //   {
          //     ToastConfig.showToast(
          //       msg: state.loginModel.message,
          //       toastStates: ToastStates.Error,
          //     );
          //   }
          // }
          // if(state is LoginErrorState){
          //   ToastConfig.showToast(
          //     msg: "حسابك غير نشط",
          //     toastStates: ToastStates.Error,
          //   );
          // }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return StreamBuilder<ConnectivityResult>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context,snapshot){
              return SafeArea(
                child: Scaffold(
                  body:snapshot.data == ConnectivityResult.none ?
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/wifi.png",
                          height: 100,),
                        const CustomSizedBox(
                          height: 20,
                        ),
                        const CustomText(text: "No Internet",
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          textColor: Colors.black87,),
                      ],
                    ),
                  ):
                  Center(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/Group.png",
                                width: 150,
                                height: 120,
                                color: AppColors2.mainColor,
                              ),
                              const CustomSizedBox(
                                height: 50,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(LocaleKeys.transform.tr(),style: const TextStyle(
                                      color: AppColors2.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                    Text(LocaleKeys.yourBody.tr(),style: const TextStyle(
                                      color: AppColors2.blackColor,
                                      fontSize: 20,
                                    ),),
                                    Text(" , ${LocaleKeys.transform.tr()}",style: const TextStyle(
                                      color: AppColors2.mainColor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),),
                                  ],
                                ),
                              ),
                              Text(LocaleKeys.yourLifeWithOurGymApp.tr(),style: const TextStyle(
                                color: AppColors2.blackColor,
                                fontSize: 20,
                              ),),
                              const CustomSizedBox(
                                height: 50,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                    text: LocaleKeys.emailOrPhone.tr(),
                                textColor: AppColors2.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const CustomSizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: cubit.emailCon,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                validator: (value)
                                {
                                  if(value!.isEmpty)
                                  {
                                    return LocaleKeys.validateEmailOrPhone.tr();
                                  }
                                  return null;
                                },
                                decoration:     InputDecoration(
                                  border:  const OutlineInputBorder(),
                                  enabledBorder:     OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: AppColors2.grey2Color,
                                      )
                                  ),
                                  focusedBorder:   OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                      borderSide: const BorderSide(
                                        color: AppColors2.mainColor,
                                      )
                                  ),
                                  hintText: LocaleKeys.emailOrPhone.tr(),
                                  hintStyle: const TextStyle(
                                    color: AppColors2.grey2Color,
                                  ),
                                ),
                              ),
                              const CustomSizedBox(
                                height: 15,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                  text: LocaleKeys.password.tr(),
                                  textColor: AppColors2.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              const CustomSizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                onFieldSubmitted: (value)
                                {
                                  if(formKey.currentState!.validate())
                                  {

                                  }
                                },
                                obscureText: cubit.isVisible,
                                controller: cubit.passCon,
                                validator: (value){
                                  if(value!.isEmpty)
                                  {
                                    return LocaleKeys.validatePassword.tr();
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border:const OutlineInputBorder(),
                                  enabledBorder:const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors2.grey2Color,
                                      )
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors2.mainColor,
                                      )
                                  ),
                                  hintText: LocaleKeys.password.tr(),
                                  hintStyle: const TextStyle(
                                    color: AppColors2.grey2Color,
                                  ),
                                  suffixIcon: IconButton(
                                    color: Colors.black,
                                    icon: cubit.isVisible ?const Icon(Icons.visibility_off):const Icon(Icons.visibility),
                                    onPressed: (){
                                      cubit.changeSuffixIcon();
                                    },
                                  ),
                                ),
                              ),
                              const CustomSizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: CustomText(
                                  text: LocaleKeys.forgetPassword.tr(),
                                  textColor: AppColors2.grey2Color,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              const CustomSizedBox(
                                height: 30,
                              ),
                              ConditionalBuilder(
                                condition: state is! LoginLoadingState,
                                builder: (context){
                                  return CustomButton(
                                    width: double.infinity,
                                    height: 60,
                                    btnColor: AppColors2.mainColor,
                                    btnText:  Text(LocaleKeys.login.tr(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),),
                                    onPressed: (){},
                                  );
                                },
                                fallback: (context)=>const Center(
                                  child: CircularProgressIndicator(color: AppColors2.mainColor,),
                                ),
                              ),
                              const CustomSizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                   CustomText(text: LocaleKeys.doNotHaveAnAccount.tr(),
                                    textColor: AppColors2.blackColor,
                                     fontSize: 14,
                                     fontWeight: FontWeight.w400,
                                  ),
                                  TextButton(
                                    onPressed: (){
                                      AppNav.customNavigator(
                                          context: context,
                                          screen: const PlayerRegisterScreen(),
                                          finish: false,
                                      );
                                    },
                                    child:  CustomText(text:LocaleKeys.register.tr(),
                                      textColor: AppColors2.mainColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const CustomSizedBox(
                                height: 15,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}