import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_dart/features/cats/cubit/app_cubit_states.dart';
import 'package:learning_dart/features/cats/cubit/app_cubits.dart';


import 'AppLargeText.dart';
import 'AppText.dart';

class CustomHorizontalList extends StatelessWidget {
  const CustomHorizontalList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var cats = state.cats;
        return Container(
            margin: const EdgeInsets.only(
              left: 10,
            ),
            height: 250,
            width: double.maxFinite,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cats.length,
              itemBuilder: (_, index) {
                final cat = cats[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      width: 250,
                      height: 150,
                      child: CachedNetworkImage(
                        imageUrl: cat.url,
                        height: 200,
                        width: 150,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Transform.scale(
                          scaleX: .2,
                          scaleY: .3,
                          child: CircularProgressIndicator(
                            strokeWidth: 4,
                          ),
                        ),

                        errorWidget: (context, url, error) {
                          print(
                              "Error loading image: $error"); // Print the error message
                          return const Icon(Icons.error); // Error widget
                        }, // Error widget
                      ),
                      /*decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('asset/images.jpeg'),
                              fit: BoxFit.cover)),*/
                    ),
                    const SizedBox(height: 8),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: AppLargeText(
                        size: 16,
                        text: "IELTS Course by John",
                        align: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
                      child: AppText(
                        size: 14,
                        text: "John Malkovich",
                        color: Colors.grey,
                        align: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      margin: const EdgeInsets.only(
                        right: 20,
                      ),
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
      } else {
        return const SizedBox
            .shrink(); // Return an empty widget if the state is not LoadedState
      }
    });
  }
}
