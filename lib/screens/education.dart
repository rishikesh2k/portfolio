import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class EducationTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(child: Text('Education', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white))),
          SizedBox(height: 10),
          _buildEducationCard(
            context,
            'B.Tech in Computer Science and Engineering',
            'Roorkee Institute of Technology (2020 - 2024)',
            'I have completed my greduation from Roorkee Institute of Technology. in Computer Science and Engineering.Along with my degree I learn various technologies likeJava, C, C++,and many more For my final year project. I have also worked on various projects to enhance my skills.',
          ),
          SizedBox(height: 10),
          _buildEducationCard(
            context,
            'Intermediate of Science',
            'J.S.G.S Public School (2018 - 2019)',
            'Details about your Intermediate education...',
          ),
          SizedBox(height: 10),
          _buildEducationCard(
            context,
            'Matriculation',
            'Abdulla Qureshi High School (2016 - 2017)',
            'Details about your Matriculation education...',
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, String title, String subtitle, String details) {
    return FadeInUp(
      child: Card(
        elevation: 10,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EducationDetailsScreen(
                  title: title,
                  subtitle: subtitle,
                  details: details,
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SlideInRight(child: Text(title, style: TextStyle(fontWeight: FontWeight.bold,color: Colors.teal))),
                  Text(subtitle),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Read More →',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EducationDetailsScreen extends StatelessWidget {
  final String title;
  final String subtitle;
  final String details;

  EducationDetailsScreen({required this.title, required this.subtitle, required this.details});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded,color : Colors.white,)),
        backgroundColor: Colors.teal,
        
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
                
                  
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.text.size(24).bold.white.make(),
                10.heightBox,
                subtitle.text.size(18).white.make(),
                20.heightBox,
                details.text.size(16).black.make(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}