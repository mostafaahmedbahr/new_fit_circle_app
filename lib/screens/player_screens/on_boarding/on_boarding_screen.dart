 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/colors.dart';
import '../../../dio/sh/sh.dart';
import '../../../models/player_models/on_boarding_model.dart';
import '../../../widgets/custom_button.dart';
import '../auth/login/login_screen.dart';
import 'on_boarding_cubit/on_boarding_cubit.dart';
import 'on_boarding_cubit/on_boarding_states.dart';



class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit,OnBoardingStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = OnBoardingCubit.get(context);
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors2.blackColor,
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   elevation: 0.0,
            //   actions: [
            //     const SizedBox(width: 5,),
            //     TextButton(
            //       onPressed: () {
            //         SharedPreferencesHelper.saveData(key: 'isBoarding', value: true)
            //             .then((value) {
            //           if (value) {
            //             // Navigator.pushAndRemoveUntil(
            //             //     context,
            //             //     MaterialPageRoute(
            //             //         builder: (context) => const StartScreen()),
            //             //         (route) => false);
            //           }
            //         });
            //       },
            //       child: const Text(
            //         "تخطى ",
            //         style: TextStyle(
            //           fontSize: 18,
            //           letterSpacing: 1.2,
            //           color: Colors.black87,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: cubit.boardingController,
                        onPageChanged: (int index) {
                          if (index == cubit.boarding.length - 1) {
                            setState(() {
                              cubit.isLast = true;
                            });
                          } else {
                            setState(() {
                              cubit.isLast = false;
                            });
                          }
                        },
                        itemBuilder: (context, index) =>
                            buildOnBoarding(cubit.boarding[index]),
                        itemCount: cubit.boarding.length,
                      ),
                    ),

                  ],
                ),

                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       // SmoothPageIndicator(
                //       //   controller:cubit.boardingController,
                //       //   count: cubit.boarding.length,
                //       //   axisDirection: Axis.horizontal,
                //       //   effect:  const ExpandingDotsEffect(
                //       //     spacing: 10.0,
                //       //     dotWidth: 20,
                //       //     expansionFactor: 4.0,
                //       //     dotHeight: 16.0,
                //       //     dotColor: AppColors.whiteColor,
                //       //     activeDotColor: AppColors.mainColor,
                //       //   ),
                //       // ),
                //       // const CustomSizedBox(height: 20,),
                //       // CustomButton(
                //       //   width: double.infinity,
                //       //   height: 60,
                //       //   btnColor: AppColors.mainColor,
                //       //   btnText:  Text("cubit.boarding",
                //       //     style: const TextStyle(
                //       //       fontSize: 20,
                //       //     ),),
                //       //   onPressed: (){
                //       //     if (cubit.isLast) {
                //       //       SharedPreferencesHelper.saveData(key: 'isBoarding', value: true)
                //       //           .then((value) {
                //       //         if (value) {
                //       //           // Navigator.pushAndRemoveUntil(
                //       //           //     context,
                //       //           //     MaterialPageRoute(
                //       //           //         builder: (context) => const StartScreen()),
                //       //           //         (route) => false);
                //       //         }
                //       //       });
                //       //     } else {
                //       //       cubit.boardingController.nextPage(
                //       //         duration: const Duration(milliseconds: 750),
                //       //         curve: Curves.easeInOut,
                //       //       );
                //       //     }
                //       //   },
                //       // ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        );
      },

    );
  }

  Widget buildOnBoarding(OnBoardingModel model) => Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(model.image!,height: double.infinity,width: double.infinity,fit: BoxFit.fitHeight,),
      // Padding(
      //   padding: const EdgeInsets.only(right: 20,left: 20,top: 150),
      //   child: Text(
      //     model.head!,
      //     style: const TextStyle(
      //       fontSize: 24.0,
      //       color: AppColors.whiteColor,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      const SizedBox(height: 50,),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              model.head!,
              style: const TextStyle(
                fontSize: 24.0,
                color: AppColors2.whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const CustomSizedBox(height: 70,),
          SmoothPageIndicator(
            controller:OnBoardingCubit.get(context).boardingController,
            count: OnBoardingCubit.get(context).boarding.length,
            axisDirection: Axis.horizontal,
            effect:  const ExpandingDotsEffect(
              spacing: 10.0,
              dotWidth: 20,
              expansionFactor: 4.0,
              dotHeight: 16.0,
              dotColor: AppColors2.whiteColor,
              activeDotColor: AppColors2.mainColor,
            ),
          ),
          const CustomSizedBox(height: 60,),
          CustomButton(
            width: double.infinity,
            height: 60,
            btnColor: AppColors2.mainColor,
            btnText:  Text(model.buttonText,
              style: const TextStyle(
                fontSize: 20,
              ),),
            onPressed: (){
              if (OnBoardingCubit.get(context).isLast) {
                SharedPreferencesHelper.saveData(key: 'isBoarding', value: true)
                    .then((value) {
                  if (value) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PlayerLoginScreen()),
                            (route) => false);
                  }
                });
              } else {
                OnBoardingCubit.get(context).boardingController.nextPage(
                  duration: const Duration(milliseconds: 750),
                  curve: Curves.easeInOut,
                );
              }
            },
          ),
        ],),
      )
    ],
  );
}
