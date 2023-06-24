import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_button.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';

class CoursesForPlayerScreen extends StatelessWidget {
  const CoursesForPlayerScreen({Key? key}) : super(key: key);

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
              icon: const Icon(Icons.arrow_back_ios,color: AppColors2.blackColor,),
            ),
            title: Text(LocaleKeys.courses.tr(),
            style: const TextStyle(
              color: AppColors2.blackColor,
              fontSize: 20,
            ),),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.separated(
                itemBuilder: (context,index){
                  return SizedBox(
                    height: 170,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("assets/images/bg 1.png",
                                height: 170,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: CustomButton(
                                height: 30,
                                width: 120,
                                btnColor: AppColors2.mainColor,
                                btnText: const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.location_on,
                                      size: 20,
                                    ),
                                    CustomText(text: "private",),
                                  ],
                                ),
                                onPressed: (){},
                              ),
                            ),
                          ],
                        ),
                        const CustomSizedBox(width: 15,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("course name"*10,
                                style: const TextStyle(
                                  fontSize: 18,
                                fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const CustomSizedBox(height: 15,),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        CustomText(text: LocaleKeys.price.tr(),
                                          fontSize: 14,
                                          textColor: AppColors2.grey1Color,
                                        ),
                                        const CustomText(text: "500",
                                          fontSize: 18,
                                          textColor: AppColors2.blackColor,),
                                        CustomText(text: LocaleKeys.duration.tr(),
                                          fontSize: 14,
                                          textColor: AppColors2.grey1Color,
                                        ),
                                        const CustomText(text: "4 months",
                                          fontSize: 18,
                                          textColor: AppColors2.blackColor,),

                                      ],
                                    ),
                                    Container(
                                      height: 100,
                                      width: 1,
                                      color: AppColors2.grey1Color,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomButton(
                                          height: 30,
                                          width: 100,
                                          btnColor: AppColors2.yellow2Color,
                                          btnText: const CustomText(text: "Jump rope",
                                            fontSize: 14,
                                          ),
                                          onPressed: (){},
                                        ),
                                        CustomButton(
                                          height: 30,
                                          width: 100,
                                          btnColor: AppColors2.yellow2Color,
                                          btnText: const CustomText(text: "Jump rope",
                                            fontSize: 14,
                                          ),
                                          onPressed: (){},
                                        ),
                                        CustomButton(
                                          height: 30,
                                          width: 60,
                                          btnColor: AppColors2.yellow2Color,
                                          btnText: const CustomText(text: "+2",),
                                          onPressed: (){},
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context,index){
                  return const CustomSizedBox(height: 15,);
                },
                itemCount: 10,
            ),
          ),
        ),
    );
  }
}
