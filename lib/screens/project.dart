import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ProjectsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInLeft(child: Text('Projects', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white))),
          SizedBox(height: 10),
             _buildProjectCard(
            context,
            title: '1. Health2Mama',
            description:
                'A pregnancy tracking app designed to help expecting mothers monitor their health and baby\'s growth. Built from scratch with features like reminders, health tips, and progress tracking.',
          ),
          _buildProjectCard(
            context,
            title: '2. HealthTrust',
            description:
                'A healthcare app where patients can book appointments, visit hospitals on pre-booked slots, order medicines, and manage their health records.',
          ),
          _buildProjectCard(
            context,
            title: '3. AsianSchool App',
            description:
                'A large-scale school management app for managing student records, attendance, exams, and communication between teachers, students, and parents.',
          ),
          _buildProjectCard(
            context,
            title: '4. DataMede',
            description:
                'An AI-powered app designed to handle hospital billing and reduce the effort of surgeons by automating repetitive tasks and providing intelligent insights.',
          ),
          _buildProjectCard(
            context,
            title: '5. DMOPS',
            description:
                'An admin app for DataMede, used to manage and monitor the operations of the DataMede platform.',
          ),
       
        ],
      ),
    );
  }
 Widget _buildProjectCard(BuildContext context, {required String title, required String description}) {
    return FadeInUp(
      
      child: Card(
        elevation: 10,
        color: Colors.white,
        margin: EdgeInsets.only(bottom: 16),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SlideInRight(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  
}