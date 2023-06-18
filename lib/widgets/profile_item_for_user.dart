import 'package:flutter/material.dart';

import '../core/colors.dart';
import 'custom_sized_box.dart';
import 'custom_text.dart';
class ProfileItemForUser extends StatelessWidget {
    ProfileItemForUser({Key? key, required this.label, required this.subLabel,   this.isLeft}) : super(key: key);
  final String label;
  final String subLabel;
    bool? isLeft = true ;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
              style: TextStyle(
                fontSize: 21,
                color: AppColors.buttonColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment:isLeft==true  ?  Alignment.topRight :  Alignment.topLeft,
              child: Text(  subLabel,
                style: TextStyle(
                  fontSize: 21,
                  color: AppColors.blackColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            CustomSizedBox(height: 5,),
            Container(
              height: 1,
              width: MediaQuery.of(context).size.width*0.4,
              color: AppColors.grey1Color,
            ),
          ],
        ),
        const CustomSizedBox(height: 20,),
      ],
    );
  }
}
