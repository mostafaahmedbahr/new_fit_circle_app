import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';

import '../../../../core/colors.dart';
import '../../../../widgets/custom_sized_box.dart';
import '../../../../widgets/custom_text.dart';

class PlayerChatScreen extends StatelessWidget {
  const PlayerChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors2.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors2.whiteColor,
        elevation: 0,
        title: Text(LocaleKeys.messages.tr(),
        style: const TextStyle(
          color: AppColors2.blackColor,
        ),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.separated(
          itemBuilder:(context,index){
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/Frame 1000003438.png",
                      height: 70,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const CustomSizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:   [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(text: "Mostafa Ahmed",
                              textColor: AppColors2.blackColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,),
                            CustomText(text: "1 day",
                              textColor: AppColors2.grey1Color,
                              fontSize: 16,
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Expanded(
                              child: Text("notification 1"*10,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColors2.mainColor,
                              ),
                              child: const Center(
                                child: Text("2",
                                style: TextStyle(
                                  color: AppColors2.whiteColor,
                                ),),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context,index){
            return   Container(
              height: 1,
              color: AppColors2.grey1Color,
              width: double.infinity,
            );
          },
          itemCount: 10,
        ),
      ),
    );
  }
}
