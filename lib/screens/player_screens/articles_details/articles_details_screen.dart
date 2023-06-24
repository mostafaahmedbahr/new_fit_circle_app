import 'package:custom_rating_bar/custom_rating_bar.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';

 import '../../../widgets/custom_sized_box.dart';
import '../../../widgets/custom_text.dart';

class ArticlesDetailsScreen extends StatelessWidget {
  const ArticlesDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image.asset(
                    "assets/images/bg 1.png",
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
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
                        color: AppColors2.whiteColor,
                      ),
                      child: Center(
                        child: SvgPicture.asset("assets/images/Frame.svg"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20 , left: 20),
                    child: SizedBox(
                      height: 30,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context,index){
                          return
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
                            );
                        },
                        separatorBuilder: (context,index){
                          return const CustomSizedBox(width: 10,);
                        },
                        itemCount: 3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("The Role of Nutrition in Achieving YourGym Goals."*10,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors2.blackColor,
                      fontSize: 20,
                    ),),
                 const CustomSizedBox(height: 10,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.calendar_month),
                          CustomSizedBox(width: 5,),
                          Text("24/6/2023",
                            style: TextStyle(
                              fontSize: 14,

                            ),),
                        ],
                      ),
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
                  const CustomSizedBox(height: 20,),
                  Row(
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: "mostafa bahr",
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
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
                    ],
                  ),
                  const CustomSizedBox(height: 20,),
                  Text("The Role of Nutrition in Achieving YourGym Goals."*15),
                  const CustomSizedBox(height: 20,),
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
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
