import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';

class CoashesForPlayerScreen extends StatelessWidget {
  const CoashesForPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors2.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors2.whiteColor,
          elevation: 0,
          title: CustomText(
            text: LocaleKeys.coashes.tr(),
            textColor: AppColors2.blackColor,
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: (){},
            icon: const Icon(Icons.arrow_back_ios,
            color: AppColors2.blackColor,
            ),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(CupertinoIcons.search,
              color: AppColors2.blackColor,),
            ),
            IconButton(
              onPressed: (){},
              icon: SvgPicture.asset("assets/images/filtter.svg",
              color: AppColors2.blackColor,
              ),
            ),
            const SizedBox(width: 20,),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return
                        index==0 ? Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors2.mainColor,
                          ),
                          child:   Center(
                            child: CustomText(
                              text: LocaleKeys.all.tr(),
                              textColor: AppColors2.whiteColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ):
                        Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors2.mainColor,
                        ),
                        child: const Center(
                          child: CustomText(
                            text: "Sport",
                            textColor: AppColors2.whiteColor,
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context,index){
                      return const CustomSizedBox(width: 10,);
                    },
                    itemCount: 10,
                ),
              ),
              const CustomSizedBox(height: 30,),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context,index){
                      return SizedBox(
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Image.asset("assets/images/Frame 1000003439.png",
                              height: 100,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            const CustomSizedBox(width: 20,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const  Text("mostafa bahr",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis ,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),),
                                  const Text("ID : 190179"),
                                  Row(
                                    children: [
                                      RatingBar(
                                        filledIcon: Icons.star,
                                        emptyIcon: Icons.star_border,
                                        size: 20,
                                        onRatingChanged: (value) => debugPrint('$value'),
                                        initialRating: 3,
                                        maxRating: 5,
                                      ),
                                      const CustomSizedBox(width: 10,),
                                      const CustomText(text: "( 7 )"),
                                    ],
                                  ),
                                  Container(
                                    height: 25,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors2.yellow2Color,
                                    ),
                                    child: const Center(
                                      child: CustomText(
                                        text: "Sport",
                                        textColor: AppColors2.whiteColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset("assets/images/Vector.svg"),
                                const CustomText(text: "5"),
                              ],
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
            ],
          ),
        ),
      ),
    );
  }
}
