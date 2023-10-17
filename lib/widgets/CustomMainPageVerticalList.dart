import 'package:flutter/material.dart';
import 'package:learning_dart/widgets/HorizontalList.dart';

import 'AppLargeText.dart';
import 'AppText.dart';

class CustomMainPageVerticalList extends StatelessWidget {
  const CustomMainPageVerticalList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: 4,
      itemBuilder: (_, index) {
        return Card(
            elevation: 2,
            margin: EdgeInsets.only(bottom: 20),
            // Add margin to the Card
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30, left: 10, right: 10),
                  child: Row(
                    children: [
                      AppLargeText(text: "Language Learning Course"),
                      Expanded(child: Container()),
                      AppText(text: "See More"),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                CustomHorizontalList()
              ],
            ));
      },
    ));
  }
}
