import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
 import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';
import 'package:flutter_linear_datepicker/month_name_handler.dart';
import 'package:flutter_linear_datepicker/number_picker.dart';

import '../../../widgets/custom_button.dart';
import 'general_question_screen2.dart';


class GeneralQuestionScreen1 extends StatefulWidget {
  const GeneralQuestionScreen1({Key? key}) : super(key: key);

  @override
  State<GeneralQuestionScreen1> createState() => _GeneralQuestionScreen1State();
}

class _GeneralQuestionScreen1State extends State<GeneralQuestionScreen1> {
  int activeStep = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              Text(LocaleKeys.theseInformationWillHelpTheCoachToPersonalizeYourCourse.tr(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
              ),
              const CustomSizedBox(height: 30,),
              const Text(
                  "01 / 05",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  )
              ),
              const CustomSizedBox(height: 10,),
              StepProgressIndicator(
                totalSteps: 5,
                currentStep: 1,
                selectedColor: AppColors2.mainColor,
                unselectedColor: AppColors2.grey2Color.withOpacity(0.5),
              ),
              const CustomSizedBox(height: 70,),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: LocaleKeys.gender.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors2.blackColor,
                ),
              ),
              const CustomSizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Container(
                      height:50 ,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors2.mainColor.withOpacity(0.3),
                        border: Border.all(
                          color: AppColors2.mainColor,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset("assets/images/female.svg"),
                          Text(
                              LocaleKeys.female.tr(),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height:50 ,
                    width: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors2.mainColor.withOpacity(0.3),
                      border: Border.all(
                        color: AppColors2.mainColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/images/male.svg"),
                        Text(
                            LocaleKeys.male.tr(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            )
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const CustomSizedBox(height: 70,),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: LocaleKeys.age.tr(),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  textColor: AppColors2.blackColor,
                ),
              ),
              const CustomSizedBox(height: 40,),
              LinearDatePicker(
                  startDate: "1950/10/17", //yyyy/mm/dd
                  endDate: "2020/02/20",
                  initialDate: "2010/11/15",
                  addLeadingZero: true,
                  dateChangeListener: (String selectedDate) {
                    print(selectedDate);
                  },
                  showDay: true,  //false -> only select year & month
                  labelStyle: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  selectedRowStyle: const TextStyle(
                    fontSize: 18.0,
                    color: AppColors2.mainColor,
                  ),
                  unselectedRowStyle: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.blueGrey,
                  ),
                  yearText: LocaleKeys.year.tr(),
                  monthText:  LocaleKeys.month.tr(),
                  dayText:  LocaleKeys.day.tr(),
                  showLabels: true, // to show column captions, eg. year, month, etc.
                  columnWidth: 100,
                  showMonthName: true,
                  isJalaali: false  // false -> Gregorian
              ),
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
                screen: const GeneralQuestionScreen2(),
                withNavBar: false, // OPTIONAL VALUE. True by default.
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
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
  }
}
