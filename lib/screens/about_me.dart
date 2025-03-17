import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dev_rishikesh/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class AboutMe extends StatelessWidget {
  @override
  final List<Map<String, dynamic>> gridItems = [
    {'title': 'A large-scale school management app for managing student records... ','image':'asian_school', },
    {'title': 'A pregnancy tracking app designed to help expecting mothers ...','image':'health2mama', },
    
  ];
   final List<Map<String, dynamic>> stateItems = [
    {'title': 'Use Bloc to manage app state it help to handle complex state ','image':'bloc', },
    {'title': 'A pregnancy tracking app designed to help expecting mothers ...','image':'bloc', },
    
  ];
  Widget build(BuildContext context) {
          final navigationProvider = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated introduction
          FadeInLeft(
            child: Text(
              'About Me',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            height: 210,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.teal,
                          Colors.teal,
                        ],
                      )),
                ),
                SlideInRight(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                      ),
                      child: Image.asset(
                        'assets/images/me.png',
                        // width: 200,
                        height: 200,

                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.3),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Hi, I am Rishikesh Yadav',
                          textStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                      totalRepeatCount: 1,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 65, left: 12),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: FadeIn(
                        duration: Duration(seconds: 3),
                        child: Text(
                          'Flutter Developer',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:  16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     Icon(BoxIcons.bxl_flutter,color: Colors.white,),
                     Icon(Bootstrap.github,color: Colors.white,),
                     Icon(Bootstrap.code,color: Colors.white,),
                     Icon(BoxIcons.bxl_android,color: Colors.white,),
                     Icon(BoxIcons.bxl_apple,color: Colors.white,),
                     Icon(BoxIcons.bxl_java,color: Colors.white,),
                     Icon(BoxIcons.bxl_nodejs,color: Colors.white,),
                     Icon(BoxIcons.bxl_react,color: Colors.white,),
                     
                    ],
                  ),
                ),
              ],
            ),
          ),
          // About Me heading with animation

          10.heightBox,

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // About Me Content
              FadeInUp(
                child: Text(
                  'I am a passionate Flutter developer with 1 year of experience in building cross-platform mobile applications. I love solving problems and learning new technologies. Below are some of the projects I have worked on:',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              
              // Staggered Grid View
              FadeInUp(child: AutoScrollPageView(gridItems: gridItems)),
               GestureDetector(
                onTap: () {
                  navigationProvider.currentIndex=4;
                  
                },
                 child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'See More →',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
               ),
              // "State management I Used".text.bold.black.size(16).make(),
              // FadeInUp(child: AutoScrollPageView(gridItems: stateItems)),
            ],
          ),
        ],
      ),
    );
  }

  // Helper method to build project cards with animations
}


class AutoScrollPageView extends StatelessWidget {
  final List<Map<String, dynamic>> gridItems;

  AutoScrollPageView({required this.gridItems});

  @override
  Widget build(BuildContext context) {
    final pageViewProvider = Provider.of<NavigationProvider>(context);

    // Start auto-scroll when the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageViewProvider.startAutoScroll(gridItems);
    });

    return SizedBox(
      height: 250,
      child: PageView.builder(
        controller: pageViewProvider.pageController,
        scrollDirection: Axis.horizontal,
        itemCount: gridItems.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.teal,
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 20, right: 20,bottom: 20),
                child: Image.asset(
                  'assets/images/${gridItems[index]['image']}.png',
                  height: 100,
                  width: 100,
                  color: gridItems[index]['image'] == 'asian_school' ? Colors.blue : null,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 140, left: 8, right: 8),
                child: Center(
                  child: Text(
                    gridItems[index]['title'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}