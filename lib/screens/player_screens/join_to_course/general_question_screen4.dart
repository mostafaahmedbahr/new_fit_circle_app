import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/join_to_course/cubit/states.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:numberpicker/numberpicker.dart';


import '../../../widgets/custom_button.dart';
import 'cubit/cubit.dart';
import 'general_question_screen5.dart';


class GeneralQuestionScreen4 extends StatefulWidget {
  const GeneralQuestionScreen4({Key? key}) : super(key: key);

  @override
  State<GeneralQuestionScreen4> createState() => _GeneralQuestionScreen4State();
}

class _GeneralQuestionScreen4State extends State<GeneralQuestionScreen4> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<JoinToCourseCubit,JoinToCourseStates>(
      listener:(context,state){},
      builder: (context,state){
        var cubit = JoinToCourseCubit.get(context);
        return  SafeArea(
          child: Scaffold(
            backgroundColor: AppColors2.whiteColor,
            appBar: AppBar(
              backgroundColor: AppColors2.whiteColor,
              elevation: 0,
              leading: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios,
                  color: AppColors2.blackColor,
                ),
              ),
              centerTitle: true,
              title: CustomText(
                text: LocaleKeys.generalQuestions.tr(),
                textColor: AppColors2.blackColor,
              ),
            ),
            body:  Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomSizedBox(height: 40,),
                  Text(LocaleKeys.yourGoalAndActivity.tr(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSizedBox(height: 10,),
                  Text(LocaleKeys.youCanChangeOrUpdateItLater.tr(),
                    style:   TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors2.grey1Color.withOpacity(0.5),
                    ),
                  ),
                  const CustomSizedBox(height: 30,),
                  const Text(
                      "04 / 05",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  const CustomSizedBox(height: 10,),
                  StepProgressIndicator(
                    totalSteps: 5,
                    currentStep: 4,
                    selectedColor: AppColors2.mainColor,
                    unselectedColor: AppColors2.grey2Color.withOpacity(0.5),
                  ),
                  const CustomSizedBox(height: 70,),
                  Text(LocaleKeys.selectYourGoal.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSizedBox(height: 10,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint:   Text(LocaleKeys.select.tr()),
                      items: cubit.goals
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
                      value: cubit.selectedGoal,
                      onChanged: (value) {
                        setState(() {
                          cubit.selectedGoal = value as String;
                          print(cubit.selectedGoal);
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 56,
                        padding:
                        const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors2.grey1Color.withOpacity(0.5),
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
                  const CustomSizedBox(height: 20,),
                  Text(LocaleKeys.selectYourActivity.tr(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSizedBox(height: 10,),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint:   Text(LocaleKeys.select.tr()),
                      items: cubit.activities
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
                      value: cubit.selectedActivity,
                      onChanged: (value) {
                        setState(() {
                          cubit.selectedActivity = value as String;
                          print(cubit.selectedActivity);
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        height: 56,
                        padding:
                        const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppColors2.grey1Color.withOpacity(0.5),
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
                  const CustomSizedBox(height: 20,),
                  Align(
                    alignment: Alignment.center,
                    child: CustomButton(
                      width: 170,
                      height: 60,
                      btnColor: AppColors2.yellow2Color,
                      btnText:  Text(LocaleKeys.submit.tr(),
                        style: const TextStyle(
                          fontSize: 20,
                        ),),
                      onPressed: (){
                        cubit.changeVal(cubit.val=1);
                        // PersistentNavBarNavigator.pushNewScreen(
                        //   context,
                        //   screen: const GeneralQuestionScreen2(),
                        //   withNavBar: false, // OPTIONAL VALUE. True by default.
                        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                        // );

                      },
                    ),
                  ),
                  const CustomSizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors2.whiteColor,
                          border: Border.all(
                            color: AppColors2.mainColor.withOpacity(0.2),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text("BMR",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors2.grey1Color,
                            )
                            ),
                            const Text(
                                "2,549",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                             Text(LocaleKeys.caloriesDay.tr(),
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppColors2.grey1Color,
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors2.whiteColor,
                          border: Border.all(
                            width: 10,
                            color: AppColors2.mainColor.withOpacity(0.2),
                          ),
                        ),
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("BMI",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors2.grey1Color,
                                )
                            ),
                            Text(
                                "25",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                )
                            ),
                            Text("Normal",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColors2.grey1Color,
                                )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    width: double.infinity,
                    height: 60,
                    btnColor:cubit.val==1 ?  AppColors2.mainColor : AppColors2.grey1Color.withOpacity(0.3),
                    btnText:  Text(LocaleKeys.next.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const GeneralQuestionScreen5(),
                        withNavBar: false, // OPTIONAL VALUE. True by default.
                        pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      );

                    },
                  ),
                  // Expanded(
                  //   child: PageView.builder(
                  //     physics: const BouncingScrollPhysics(),
                  //     controller: cubit.boardingController,
                  //     onPageChanged: (int index) {
                  //       if (index == cubit.boarding.length - 1) {
                  //         setState(() {
                  //           cubit.isLast = true;
                  //         });
                  //       } else {
                  //         setState(() {
                  //           cubit.isLast = false;
                  //         });
                  //       }
                  //     },
                  //     itemBuilder: (context, index) =>
                  //         buildOnBoarding(cubit.boarding[index]),
                  //     itemCount: cubit.boarding.length,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
      
    );
  }
}
