import 'package:animate_do/animate_do.dart';
import 'package:dev_rishikesh/providers/navigation_provider.dart';
import 'package:dev_rishikesh/screens/about_me.dart';
import 'package:dev_rishikesh/screens/contacts.dart';
import 'package:dev_rishikesh/screens/education.dart';
import 'package:dev_rishikesh/screens/experience.dart';
import 'package:dev_rishikesh/screens/project.dart';
import 'package:dev_rishikesh/screens/skills.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_navigation_bar/responsive_navigation_bar.dart';

// ignore: must_be_immutable
class Navigation extends StatelessWidget {
   Navigation({super.key});

  int _currentIndex = 0;

  final List<Widget> _tabs = [
    AboutMe(),
    SkillsTab(),
    EducationTab(),
    ExperienceTab(),
    ProjectsTab(),
  ];

  @override
  Widget build(BuildContext context) {
      final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Rishikesh Yadav',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => ContactsScreen()));
              },
              child: Row(
                children: [
                  Text('Contacts',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
                  Icon(Icons.perm_contact_calendar_rounded,color: Colors.white,)
                ],
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  
                ],
              ),
            ),
          ),
          _tabs[navigationProvider.currentIndex],
        ],
      ),
      bottomNavigationBar: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30,right: 8,left: 8,),
          child: 
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 1,
                  blurRadius: 20,
                ),
              ],
            ),
            child: ResponsiveNavigationBar(
              backgroundColor: Colors.teal,
              backgroundOpacity: 1,
              selectedIndex: navigationProvider.currentIndex,
              activeIconColor: Colors.teal,
              inactiveIconColor: Colors.white,
              textStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
              

              
              onTabChange: (index) {
                  navigationProvider.currentIndex = index;
              },
              navigationBarButtons: const [
                NavigationBarButton(
                  backgroundColor: Colors.white,
                  icon: Icons.person,
                  text: 'About Me',
                  padding: EdgeInsets.all(8)
                ),
                NavigationBarButton(
                  backgroundColor: Colors.white,
                  icon: Icons.star,
                  text: 'Skills',
                ),
                NavigationBarButton(
                  backgroundColor: Colors.white,
                  icon: Icons.school,
                  text: 'Education',
                ),
                NavigationBarButton(
                  backgroundColor: Colors.white,
                  icon: Icons.work,
                  text: 'Experience',
                ),
                NavigationBarButton(
                  backgroundColor: Colors.white,
                  icon: Icons.folder,
                  text: 'Projects',
                  
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}




