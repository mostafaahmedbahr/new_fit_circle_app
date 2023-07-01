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
import 'general_question_screen4.dart';


class GeneralQuestionScreen3 extends StatefulWidget {
  const GeneralQuestionScreen3({Key? key}) : super(key: key);

  @override
  State<GeneralQuestionScreen3> createState() => _GeneralQuestionScreen3State();
}

class _GeneralQuestionScreen3State extends State<GeneralQuestionScreen3> {
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
                  Text(LocaleKeys.yourWeight.tr(),
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
                      "03 / 05",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  const CustomSizedBox(height: 10,),
                  StepProgressIndicator(
                    totalSteps: 5,
                    currentStep: 3,
                    selectedColor: AppColors2.mainColor,
                    unselectedColor: AppColors2.grey2Color.withOpacity(0.5),
                  ),
                  const CustomSizedBox(height: 70,),
                  NumberPicker(
                    axis: Axis.horizontal,
                    value: cubit.currentWeightValue,
                    minValue: 0,
                    maxValue: 200,
                    onChanged: (value) {
                      cubit.changeCurrentWeightValue(value);
                    },
                  ),
                  Text('Current value: ${cubit.currentWeightValue}'),
                  const Spacer(),
                  CustomButton(
                    width: double.infinity,
                    height: 60,
                    btnColor: AppColors2.mainColor,
                    btnText:  Text(LocaleKeys.next.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed: (){
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: const GeneralQuestionScreen4(),
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
