import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_dart/cubit/app_cubits.dart';
import 'package:learning_dart/features/top_courses/presentation/widgets/CustomMainPageVerticalList.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
  //  BlocProvider.of<AppCubits>(context).fetchCats();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 46),
                padding:
                    EdgeInsets.only(top: 30, bottom: 30, right: 10, left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .black54, // Customize the icon background color
                      ),
                      child: const Icon(
                        Icons.person, // Replace with your user icon
                        size: 40, // Customize the icon size
                        color: Colors.purple, // Customize the icon color
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Add spacing between icon and text
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "User Name", // Replace with the actual user name
                          style: TextStyle(
                            fontSize: 20, // Customize the font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black54, // Customize the text color
                          ),
                        ),
                        Text(
                          "Language Learning Course",
                          // Replace with the course name
                          style: TextStyle(
                            fontSize: 16, // Customize the font size
                            color: Colors.black54, // Customize the text color
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.search, // Replace with your search icon
                      color: Colors.purple, // Customize the icon color
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.notifications,
                      // Replace with your notifications icon
                      color: Colors.purple, // Customize the icon color
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: CustomMainPageVerticalList(),
              )
            ],
          )
        ],
      ),
    );
  }
}
