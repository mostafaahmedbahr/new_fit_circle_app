import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/login/login_screen.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/register/register_cubit/cubit.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/auth/register/register_cubit/states.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';
import '../../../../core/colors.dart';
import '../../../../core/utils/nav.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_sized_box.dart';

class PlayerRegisterScreen extends StatefulWidget {
  const PlayerRegisterScreen({Key? key}) : super(key: key);

  @override
  State<PlayerRegisterScreen> createState() => _PlayerRegisterScreenState();
}

class _PlayerRegisterScreenState extends State<PlayerRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          var formKey = GlobalKey<FormState>();
          return   SafeArea(
            child: Scaffold(
              body:   Padding(
                padding: const EdgeInsets.all(20.0),
                child:  SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: LocaleKeys.joinUs.tr(),
                          textColor: Colors.blue,
                          fontWeight: FontWeight.bold ,
                          fontSize: 25,
                          ),
                          SvgPicture.asset("assets/images/logo.svg"),
                        ],
                      ),
                      Center(
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            cubit.file != null
                                ? Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(100)),
                                height: 150,
                                width: 150,
                                child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  child: Image.file(
                                    cubit.file!,
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 150,
                                  ),
                                ))
                                : SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                "assets/images/profile.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                            CircleAvatar(
                              child: IconButton(
                                  onPressed: (){
                                    cubit.uploadOnlyImage();
                                  },
                                  icon: const Icon(Icons.edit),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const CustomSizedBox(
                        height: 27,
                      ),
                      // name
                      CustomText(text: LocaleKeys.name.tr(),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        controller: cubit.nameCon,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Name Must Not Be Empty ..";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors2.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.grey1Color,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.mainColor,
                              )),
                          hintText:  LocaleKeys.name.tr(),
                          hintStyle: const TextStyle(
                            color: AppColors2.grey1Color,
                          ),
                          // prefixIcon: Icon(Icons.email,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      // phone number
                      CustomText(text: LocaleKeys.phoneNumber.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        controller: cubit.phoneCon,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Name Must Not Be Empty ..";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors2.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.grey1Color,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.mainColor,
                              )),
                          hintText: LocaleKeys.phoneNumber.tr(),
                          hintStyle: const TextStyle(
                            color: AppColors2.grey1Color,
                          ),
                          // prefixIcon: Icon(Icons.email,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      // country
                      CustomText(text: LocaleKeys.country.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        controller: cubit.countryCon,
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Name Must Not Be Empty ..";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors2.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.grey1Color,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.mainColor,
                              )),
                          hintText: LocaleKeys.country.tr(),
                          hintStyle: const TextStyle(
                            color: AppColors2.grey1Color,
                          ),
                          // prefixIcon: Icon(Icons.email,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      //gender
                      CustomText(text: LocaleKeys.gender.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      DropdownButtonHideUnderline(
                        child: DropdownButton2(
                          isExpanded: true,
                          hint: Text(LocaleKeys.gender.tr()),
                          items: cubit.genders
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppColors2.blackColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ))
                              .toList(),
                          value: cubit.selectedGender,
                          onChanged: (value) {
                            setState(() {
                              cubit.selectedGender = value as String;
                              print(cubit.selectedGender);
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: 56,
                            padding:
                            const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors2.grey1Color,
                              ),
                              color: AppColors2.whiteColor,
                            ),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                            ),
                            iconSize: 20,
                            iconEnabledColor: AppColors2.grey1Color,
                            iconDisabledColor: AppColors2.grey1Color,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            maxHeight: 200,
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: null,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: AppColors2.mainColor,
                            ),
                            elevation: 8,
                            offset: const Offset(-20, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness:
                              MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.symmetric(horizontal: 40),
                          ),
                        ),
                      ),
                      // TextFormField(
                      //   controller: cubit.countryCon,
                      //   keyboardType: TextInputType.name,
                      //   style: const TextStyle(
                      //     color: Colors.black,
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return "The Name Must Not Be Empty ..";
                      //     }
                      //     return null;
                      //   },
                      //   decoration: InputDecoration(
                      //     filled: true,
                      //     fillColor: AppColors2.whiteColor,
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         borderSide: const BorderSide(
                      //           color: AppColors2.grey1Color,
                      //         )),
                      //     focusedBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(10.0),
                      //         borderSide: const BorderSide(
                      //           color: AppColors2.mainColor,
                      //         )),
                      //     hintText: LocaleKeys.country.tr(),
                      //     hintStyle: const TextStyle(
                      //       color: AppColors2.grey1Color,
                      //     ),
                      //     // prefixIcon: Icon(Icons.email,
                      //     //   color: Colors.black,
                      //     // ),
                      //   ),
                      // ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      // birth date
                      CustomText(text: LocaleKeys.birthDate.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "please Enter Your Visit Time";
                          }
                          return null;
                        },
                        readOnly: true,
                        controller: cubit.birthDateCon,
                        decoration:  InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors2.grey1Color,
                              )
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors2.grey1Color,
                              )
                          ),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors2.grey1Color,
                              )
                          ),
                          contentPadding:
                          const EdgeInsets
                              .symmetric(
                              horizontal: 10,
                              vertical: 10),
                        hintText: LocaleKeys.birthDate.tr(),
                          labelStyle: const TextStyle(
                            color: AppColors2.blackColor,
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2030),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              cubit.birthDateCon.text = DateFormat(
                                  "yyyy-MM-dd")
                                  .format(
                                  pickedDate);
                              print(cubit.birthDateCon.text);
                            });
                          }

                        },
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      //PASSWORD
                      CustomText(text: LocaleKeys.password.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        controller: cubit.passCon,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Name Must Not Be Empty ..";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors2.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.grey1Color,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.mainColor,
                              )),
                          hintText: LocaleKeys.password.tr(),
                          hintStyle: const TextStyle(
                            color: AppColors2.grey1Color,
                          ),
                          // prefixIcon: Icon(Icons.email,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 20,
                      ),
                      //CONFIRM PASSWORD
                      CustomText(text: LocaleKeys.confirmPassword.tr(),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const CustomSizedBox(height: 5,),
                      TextFormField(
                        controller: cubit.confirmPassCon,
                        keyboardType: TextInputType.visiblePassword,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "The Name Must Not Be Empty ..";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors2.whiteColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.grey1Color,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: const BorderSide(
                                color: AppColors2.mainColor,
                              )),
                          hintText: LocaleKeys.confirmPassword.tr(),
                          hintStyle: const TextStyle(
                            color: AppColors2.grey1Color,
                          ),
                          // prefixIcon: Icon(Icons.email,
                          //   color: Colors.black,
                          // ),
                        ),
                      ),
                      const CustomSizedBox(
                        height: 30,
                      ),
                      ConditionalBuilder(
                        condition: state is! RegisterLoadingState,
                        builder: (context){
                          return CustomButton(
                            width: double.infinity,
                            height: 60,
                            btnColor: AppColors2.mainColor,
                            btnText:  Text(LocaleKeys.register.tr(),
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
                                screen: const PlayerLoginScreen(),
                                finish: false,
                              );
                            },
                            child:  CustomText(text:LocaleKeys.login.tr(),
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
          );
        },
      ),
    );
  }
}
