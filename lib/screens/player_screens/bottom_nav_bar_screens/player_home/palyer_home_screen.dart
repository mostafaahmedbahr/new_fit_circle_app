 import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/screens/player_screens/bottom_nav_bar_screens/player_home/cubit/states.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/nav.dart';
import '../../articles_details/articles_details_screen.dart';
import '../../coashes_for_player/coashes_for_player_screen.dart';
import 'cubit/cubit.dart';
 import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PlayerHomeScreen extends StatelessWidget {
  const PlayerHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>PlayerHomeCubit(),
      child: BlocConsumer<PlayerHomeCubit, PlayerHomeStates>(
  listener: (context, state) {},
  builder: (context, state) {
    var cubit = PlayerHomeCubit.get(context);
    return SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //slider
                SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      CarouselSlider.builder(
                        carouselController: cubit.carouselCon,
                        itemCount: cubit.sliderImages.length,
                        itemBuilder: (context,index,realIndex)
                        {
                          return   InkWell(
                            onTap: (){
                              // AppNav.customNavigator(
                              //   context: context,
                              //   screen:   SalonDetailsScreen(
                              //     salonId: cubit.homeModel!.data!.banners![index].id!,
                              //   ),
                              //   finish: false,
                              // );
                            },
                            child:ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset("${cubit.sliderImages[index]}",
                              height: 160,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                        options: CarouselOptions(
                          initialPage: 0,
                          height: 160,
                          autoPlay: true,
                          reverse: true,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          pageSnapping: true,
                          onPageChanged: (index,reason){
                            cubit.changeActiveIndex(index);
                          },
                        ),
                      ),
                      const CustomSizedBox(height: 10,),
                      AnimatedSmoothIndicator(
                        activeIndex: cubit.activeIndex,
                        count: cubit.sliderImages.length,
                        effect: SlideEffect(
                          dotWidth: 10,
                          dotHeight: 10,
                          activeDotColor: AppColors2.mainColor,
                          dotColor: Colors.grey.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
                ),
                // coashes
                CustomText(text: LocaleKeys.coashes.tr(),
                  textColor: AppColors2.blackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,),
                const CustomSizedBox(height: 10,),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: 3/6,
                    mainAxisSpacing: 5,
                    children: List.generate(10, (index) {
                      return
                        index==9 ? SizedBox(
                          height: 130,
                          width: 90,
                          child: InkWell(
                            onTap: (){
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const CoashesForPlayerScreen(),
                                withNavBar: false, // OPTIONAL VALUE. True by default.
                                pageTransitionAnimation: PageTransitionAnimation.cupertino,
                              );
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 90,
                                  width: 90,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                    color: AppColors2.grey1Color.withOpacity(0.5),
                                  ),
                                  child:  const Center(
                                    child: Text("+22",
                                      style: TextStyle(
                                        fontSize: 30,
                                          fontWeight: FontWeight.bold
                                      ),),
                                  ),
                                ),
                                  Text(LocaleKeys.viewAll.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),),
                              ],
                            ),
                          ),
                        ):
                        SizedBox(
                        height: 130,
                        width: 90,
                        child: Column(
                          children: [
                            Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Image.asset("assets/images/Frame 1000003438.png",
                                height: 90,
                                width: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Text("mostafa"),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("( 5 )"),
                                Icon(Icons.star,
                                  color: AppColors2.yellowColor,
                                  size: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
                //articles
                CustomText(text: LocaleKeys.recentArticles.tr(),
                textColor: AppColors2.blackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,),
                const CustomSizedBox(height: 10,),
                SizedBox(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder:  (context,index){
                        return InkWell(
                          onTap: (){
                            PersistentNavBarNavigator.pushNewScreen(
                              context,
                              screen: const ArticlesDetailsScreen(),
                              withNavBar: false, // OPTIONAL VALUE. True by default.
                              pageTransitionAnimation: PageTransitionAnimation.cupertino,
                            );
                          },
                          child: Container(
                            height: 150,
                            width: MediaQuery.sizeOf(context).width*0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child:Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset("assets/images/bg 1.png",
                                  fit: BoxFit.cover,
                                    width: MediaQuery.sizeOf(context).width*0.8,
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
                        return const CustomSizedBox(width: 15,);
                      },
                      itemCount: 10,
                  ),
                )
              ],
            ),
          ),
        ),
      );
  },
),
    );
  }
}
