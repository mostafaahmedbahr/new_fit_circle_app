import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/coash_details/cubit/cubit.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/coash_details/cubit/states.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../widgets/custom_text.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import '../articles_details/articles_details_screen.dart';
import '../coashes_for_player/coashes_for_player_screen.dart';

class CoashDetailsScreen extends StatelessWidget {
  const CoashDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>CoashesDetailsCubit(),
      child: BlocConsumer<CoashesDetailsCubit,CoashesDetailsStates>(
        listener:(context,state){} ,
        builder: (context,state){
          var cubit = CoashesDetailsCubit.get(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: AppColors2.whiteColor,
              body: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              height: 210,
                              width: double.infinity,
                              color: AppColors2.whiteColor,
                              child: Stack(
                                children: [
                                  SizedBox(
                                    height: 170,
                                    width: double.infinity,
                                    child: SvgPicture.asset("assets/images/Rectangle 2561.svg",
                                      width: double.infinity,
                                      height: 170,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Positioned(
                                    left: 20,
                                    top: 20,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: AppColors2.whiteColor,
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 20,
                                    top: 20,
                                    child: Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(100),
                                        color: AppColors2.mainColor,
                                      ),
                                      child: const Center(
                                        child: Icon(CupertinoIcons.chat_bubble_text_fill,
                                          color: AppColors2.whiteColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors2.mainColor,
                              ),
                              child: Image.asset("assets/images/Frame 1000003439.png",
                                height:100 ,
                                width: 100 ,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        const CustomSizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("( 5 )"),
                            RatingBar(
                              filledIcon: Icons.star,
                              emptyIcon: Icons.star_border,
                              size: 20,
                              onRatingChanged: (value) => debugPrint('$value'),
                              initialRating: 3,
                              maxRating: 5,
                            ),
                          ],
                        ),
                        const CustomSizedBox(height: 5,),
                        const Text("Mostafa Bahr",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),),
                        const CustomSizedBox(height: 5,),
                        const Text("ID : 190179",
                          style: TextStyle(
                            fontSize: 14,
                          ),),
                        const CustomSizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text("descrition"*50,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  height: 1.5,
                                  fontSize: 14,
                                  color: AppColors2.grey1Color,
                                ),
                              ),
                              const CustomSizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 80,
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
                                  ),
                                  Row(
                                    children: [
                                      const CustomText(text: "EXP"),
                                      const CustomSizedBox(width: 10,),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset("assets/images/Vector.svg"),
                                          const CustomText(text: "5"),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const CustomSizedBox(height: 15,),
                              Container(
                                padding:const EdgeInsets.all(5),
                                width: double.infinity,
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors2.grey1Color.withOpacity(0.5),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          cubit.changeSearchPage(cubit.pageIndex=1);
                                        },
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:cubit.pageIndex==1 ?  AppColors2.mainColor :Colors.transparent,
                                          ),
                                          child:  Center(
                                            child: Text(LocaleKeys.articles.tr(),
                                              style: TextStyle(
                                                color:cubit.pageIndex==1 ?  AppColors2.whiteColor : AppColors2.blackColor,
                                                fontSize: 20,
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          cubit.changeSearchPage(cubit.pageIndex=2);
                                        },
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:cubit.pageIndex==2 ? AppColors2.mainColor : Colors.transparent,
                                          ),
                                          child:  Center(
                                            child: Text(LocaleKeys.review.tr(),
                                              style: TextStyle(
                                                color:cubit.pageIndex==2 ?  AppColors2.whiteColor : AppColors2.blackColor,
                                                fontSize: 20,
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: (){
                                          cubit.changeSearchPage(cubit.pageIndex=3);
                                        },
                                        child: Container(
                                          height: 55,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color:cubit.pageIndex==3 ? AppColors2.mainColor : Colors.transparent,
                                          ),
                                          child:  Center(
                                            child: Text(LocaleKeys.album.tr(),
                                              style: TextStyle(
                                                color:cubit.pageIndex==3 ?  AppColors2.whiteColor : AppColors2.blackColor,
                                                fontSize: 20,
                                              ),),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const CustomSizedBox(height: 15,),
                              if(cubit.pageIndex==1)
                                ListView.separated(
                                shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  itemBuilder:  (context,index){
                                    return InkWell(
                                      onTap: (){
                                        // PersistentNavBarNavigator.pushNewScreen(
                                        //   context,
                                        //   screen: const ArticlesDetailsScreen(),
                                        //   withNavBar: false, // OPTIONAL VALUE. True by default.
                                        //   pageTransitionAnimation: PageTransitionAnimation.cupertino,
                                        // );
                                      },
                                      child: Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        child:Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image.asset("assets/images/bg 1.png",
                                                fit: BoxFit.cover,
                                                width: MediaQuery.sizeOf(context).width,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                              child: SizedBox(
                                                height: 35,
                                                child: ListView.separated(
                                                  scrollDirection: Axis.horizontal,
                                                  itemBuilder: (context,index){
                                                    return Container(
                                                      padding: const EdgeInsets.all(10),
                                                      height: 35,
                                                      width: 70,
                                                      decoration:   BoxDecoration(
                                                        color: AppColors2.mainColor,
                                                        borderRadius: BorderRadius.circular(50),
                                                      ),
                                                      child: const Center(
                                                        child: CustomText(
                                                          text: "Food",
                                                          textColor: AppColors2.whiteColor,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder: (context,index){
                                                    return const SizedBox(width: 10,);
                                                  },
                                                  itemCount: 3,
                                                ),
                                              ),
                                            ),
                                            const Center(
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text("The Role of Nutrition in Achieving YourGym Goals.",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: AppColors2.whiteColor
                                                      ),
                                                      maxLines: 2,
                                                      overflow: TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Positioned(
                                              bottom: 10,
                                              left: 10,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Icon(Icons.calendar_month),
                                                      CustomSizedBox(width: 5,),
                                                      Text("24/6/2023",
                                                        style: TextStyle(
                                                          fontSize: 14,

                                                        ),),
                                                    ],
                                                  ),
                                                  CustomSizedBox(width: 10,),
                                                  CircleAvatar(radius: 3,
                                                    backgroundColor: AppColors2.whiteColor,
                                                  ),
                                                  CustomSizedBox(width: 10,),
                                                  Row(
                                                    children: [
                                                      Text("5"),
                                                      Icon(Icons.star,
                                                        color: AppColors2.yellowColor,)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 10,
                                              right: 10,
                                              child: Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                                child: Image.asset("assets/images/profile.png",
                                                  height: 30,
                                                  width: 30,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context,index){
                                    return const CustomSizedBox(height: 15,);
                                  },
                                  itemCount: 10,
                                ),
                              if(cubit.pageIndex==2)
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context,index){
                                  return SizedBox(
                                    height: 70,
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(100),
                                          ),
                                          child: Image.asset("assets/images/profile.png",
                                            height: 30,
                                            width: 30,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        const CustomSizedBox(width: 20,),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                const CustomText(text: "mostafa"),
                                                const CustomSizedBox(width: 100,),
                                                Row(
                                                  children: [
                                                    const Text("( 5 )"),
                                                    RatingBar(
                                                      filledIcon: Icons.star,
                                                      emptyIcon: Icons.star_border,
                                                      size: 20,
                                                      onRatingChanged: (value) => debugPrint('$value'),
                                                      initialRating: 3,
                                                      maxRating: 5,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const CustomText(text: "2 days ago"),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                                separatorBuilder: (context,index){
                                  return const CustomSizedBox(height: 20,);
                                },
                                itemCount: 5,
                              ),
                              if(cubit.pageIndex==3)
                                GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1,
                                  mainAxisSpacing: 20,
                                  children: List.generate(10, (index) {
                                    return Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset("assets/images/bg 1.png",
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    color: AppColors2.yellow2Color,
                    child: const Center(
                      child: CustomText(text: "Courses",
                      textColor: AppColors2.whiteColor,
                      fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } ,

      ),
    );
  }

}
