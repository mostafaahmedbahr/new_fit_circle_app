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
import 'general_question_screen3.dart';


class GeneralQuestionScreen5 extends StatefulWidget {
  const GeneralQuestionScreen5({Key? key}) : super(key: key);

  @override
  State<GeneralQuestionScreen5> createState() => _GeneralQuestionScreen5State();
}

class _GeneralQuestionScreen5State extends State<GeneralQuestionScreen5> {
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
                  // Text(LocaleKeys.yourHeight.tr(),
                  //   style: const TextStyle(
                  //     fontSize: 24,
                  //     fontWeight: FontWeight.w500,
                  //   ),
                  // ),
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
                      "05 / 05",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      )
                  ),
                  const CustomSizedBox(height: 10,),
                  StepProgressIndicator(
                    totalSteps: 5,
                    currentStep: 5,
                    selectedColor: AppColors2.mainColor,
                    unselectedColor: AppColors2.grey2Color.withOpacity(0.5),
                  ),
                  const CustomSizedBox(height: 70,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors2.grey1Color.withOpacity(0.5),
                              ),
                              color: AppColors2.whiteColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft:  Radius.circular(10),
                              ),
                              color: AppColors2.grey1Color.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/upload.svg"),
                                Text(
                                    LocaleKeys.upload.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors2.blackColor,
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors2.grey1Color.withOpacity(0.5),
                              ),
                              color: AppColors2.whiteColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft:  Radius.circular(10),
                              ),
                              color: AppColors2.grey1Color.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/upload.svg"),
                                Text(
                                    LocaleKeys.upload.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors2.blackColor,
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CustomSizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors2.grey1Color.withOpacity(0.5),
                              ),
                              color: AppColors2.whiteColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft:  Radius.circular(10),
                              ),
                              color: AppColors2.grey1Color.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/upload.svg"),
                                Text(
                                    LocaleKeys.upload.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors2.blackColor,
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Container(
                            height: 165,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: AppColors2.grey1Color.withOpacity(0.5),
                              ),
                              color: AppColors2.whiteColor,
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 165,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft:  Radius.circular(10),
                              ),
                              color: AppColors2.grey1Color.withOpacity(0.5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SvgPicture.asset("assets/images/upload.svg"),
                                Text(
                                    LocaleKeys.upload.tr(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: AppColors2.blackColor,
                                    )
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    width: double.infinity,
                    height: 60,
                    btnColor: AppColors2.mainColor,
                    btnText:  Text(LocaleKeys.finish.tr(),
                      style: const TextStyle(
                        fontSize: 20,
                      ),),
                    onPressed: (){
                      // PersistentNavBarNavigator.pushNewScreen(
                      //   context,
                      //   screen: const GeneralQuestionScreen3(),
                      //   withNavBar: false, // OPTIONAL VALUE. True by default.
                      //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                      // );
                      // AppNav.customNavigator(
                      //   context: context,
                      //   screen: const PlayerLayoutScreen(),
                      //   finish: true,
                      // );
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
