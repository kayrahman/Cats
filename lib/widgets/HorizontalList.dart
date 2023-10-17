import 'package:flutter/material.dart';

import 'AppLargeText.dart';
import 'AppText.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10,),
        height: 250,
        width: double.maxFinite,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 4,
          itemBuilder: (_, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20,),
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage('asset/images.jpeg'),
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.only(right: 20, ),
                  child: AppLargeText(
                    size: 16,
                    text: "IELTS Course by John",
                    align: TextAlign.left,
                  ),
                ),
                SizedBox(height: 4),
                Container(
                  margin: EdgeInsets.only(right: 20,),
                  child: AppText(
                    size: 14,
                    text: "John Malkovich",
                    color: Colors.grey,
                    align: TextAlign.left,
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  margin: EdgeInsets.only(right: 20,),
                  child: AppLargeText(
                    size: 16,
                    text: "990TK",
                    color: Colors.cyan,
                    align: TextAlign.left,
                  ),
                ),
              ],
            );
          },
        ));
  }
}
