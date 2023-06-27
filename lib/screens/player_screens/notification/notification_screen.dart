import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:new_fit_circle_last_ui/core/colors.dart';
import 'package:new_fit_circle_last_ui/lang/locale_keys.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_sized_box.dart';
import 'package:new_fit_circle_last_ui/widgets/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors2.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColors2.whiteColor,
          elevation: 0,
          centerTitle: true,
          title: Text(LocaleKeys.notification.tr(),
          style: const TextStyle(
            color: AppColors2.blackColor,
          ),),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios,
                color: AppColors2.blackColor,
            ),
          ),
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
                            const CustomText(text: "NOTIFICATION 1 ",
                            textColor: AppColors2.blackColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,),
                            Row(
                              children: [
                                Expanded(
                                  child: Text("notification 1"*10,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const CustomText(text: "1 day",
                                  textColor: AppColors2.grey1Color,
                                  fontSize: 16,
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
      ),
    );
  }
}
