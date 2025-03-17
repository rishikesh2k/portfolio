import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:velocity_x/velocity_x.dart';

class ExperienceTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Animated "Experience" heading
          FadeInLeft(
            duration: Duration(seconds: 1),
            child: Text(
              'Experience',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
          SizedBox(height: 20),

          // Techabet Experience Card
          _buildExperienceCard(
            context,
            company: 'Techabet Pvt Ltd',
            role: 'Flutter Developer',
            duration: 'Jul 2024 - Present',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExperienceDetailsPage(
                    company: 'Techabet Pvt Ltd',
                    points: techabetPoints,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20),

          // Mobiloitte Experience Card
          _buildExperienceCard(
            context,
            company: 'Mobiloitte Technologies Pvt Ltd',
            role: 'Flutter Developer',
            duration: 'Feb 2024 - Jul 2024',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExperienceDetailsPage(
                    company: 'Mobiloitte Technologies Pvt Ltd',
                    points: mobiloittePoints,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // Helper method to build experience cards with animations
  Widget _buildExperienceCard(
    BuildContext context, {
    required String company,
    required String role,
    required String duration,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: FadeInUp(
        child: Card(elevation: 10,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: 16),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Role and company
                SlideInRight(
                  child: Text(
                    role,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                              
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  maxLines: 2,
                  '$company ($duration)',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, color: Colors.black54,),
                ),
                
                SizedBox(height: 10),
            
                // Read More Button
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
    );
  }
}

// FadeIn animation widget

class ExperienceDetailsPage extends StatefulWidget {
  final String company;
  final List<ExperiencePoint> points;

  const ExperienceDetailsPage({
    required this.company,
    required this.points,
  });

  @override
  _ExperienceDetailsPageState createState() => _ExperienceDetailsPageState();
}

class _ExperienceDetailsPageState extends State<ExperienceDetailsPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back_rounded,color : Colors.white,)),
        backgroundColor: Colors.teal,
        title: Text(widget.company,style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold)),
        
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
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.points.length,
                  itemBuilder: (context, index) {
                    final point = widget.points[index];
                    return Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title and Icon
                          Row(
                            children: [
                              Icon(point.icon, color: Colors.white, size: 30),
                              SizedBox(width: 10),
                              point.title.text.size(22).white.bold.make(),
                             
                            ],
                          ),
                          20.heightBox,
          
                          // Description
                          Expanded(
                            child: SingleChildScrollView(
                              child: Text(
                                point.description,
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          
              // Navigation Buttons
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        if (_pageController.page! > 0) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: 'Back'.text.white.make(),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                      ),
                      onPressed: () {
                        if (_pageController.page! < widget.points.length - 1) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      child: "Next".text.white.make(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}class ExperiencePoint {
  final IconData icon;
  final String title;
  final String description;

  ExperiencePoint({
    required this.icon,
    required this.title,
    required this.description,
  });
}

// Data for Techabet Points
final List<ExperiencePoint> techabetPoints = [
  ExperiencePoint(
    icon: Icons.code,
    title: 'GetX',
    description:
        'Used GetX for state management, navigation, and toast messages. It simplified the app architecture and improved performance.',
  ),
  ExperiencePoint(
    icon: Icons.storage,
    title: 'Hive & SharedPreferences',
    description:
        'Implemented Hive for local data storage and SharedPreferences for lightweight data persistence.',
  ),
  ExperiencePoint(
    icon: Icons.security,
    title: 'Biometric Authentication',
    description:
        'Integrated biometric authentication (fingerprint and face recognition) for secure user access.',
  ),
  ExperiencePoint(
    icon: Icons.dynamic_feed,
    title: 'Dynamic UI from Server',
    description:
        'Developed UIs that dynamically generate components based on server data, ensuring flexibility and scalability.',
  ),
  ExperiencePoint(
    icon: Icons.chat,
    title: 'Socket.IO for Real-Time Chat',
    description:
        'Integrated Socket.IO for real-time chat functionality and user status updates.',
  ),
  ExperiencePoint(
    icon: Icons.bug_report,
    title: 'Firebase Crashlytics',
    description:
        'Used Firebase Crashlytics to track and resolve production errors, improving app stability.',
  ),
  ExperiencePoint(
    icon: Icons.notifications,
    title: 'Firebase Messaging',
    description:
        'Implemented Firebase Background and Foreground Messaging for push notifications.',
  ),
  ExperiencePoint(
    icon: Icons.architecture,
    title: 'Clean Architecture',
    description:
        'Followed Clean Architecture principles to build scalable and maintainable apps.',
  ),
  ExperiencePoint(
    icon: Icons.fireplace,
    title: 'Firebase CLI Setup',
    description:
        'Set up Firebase using CLI for seamless backend integration and configuration.',
  ),
  ExperiencePoint(
    icon: Icons.animation,
    title: 'Custom Animations',
    description:
        'Created custom animations to enhance user experience and make the app more engaging.',
  ),
  ExperiencePoint(
    icon: Icons.build,
    title: 'Bug Fixing & Optimization',
    description:
        'Improved skills in debugging and optimizing app performance for smoother user experiences.',
  ),
  ExperiencePoint(
    icon: Icons.phone_iphone,
    title: 'TestFlight Deployment',
    description:
        'Uploaded apps to TestFlight (iOS) and managed the approval process for beta testing.',
  ),
  ExperiencePoint(
    icon: Icons.play_arrow,
    title: 'Google Play Console',
    description:
        'Published apps on Google Play Console, generated release keys, and managed app updates.',
  ),
];

// Data for Mobiloitte Points
final List<ExperiencePoint> mobiloittePoints = [
  ExperiencePoint(
    icon: BoxIcons.bx_git_branch,
    title: 'Git & Branching',
    description:
        'Learned Git commands and branching strategies to manage projects efficiently. Created development branches, merged changes, and resolved conflicts.',
  ),
  ExperiencePoint(
    icon: BoxIcons.bxl_jquery,
    title: 'Responsive UI',
    description:
        'Developed responsive UIs that adapt to different screen sizes and orientations.',
  ),
  ExperiencePoint(
    icon:  BoxIcons.bxl_redux,
    title: 'BLoC Architecture',
    description:
        'Managed app state using BLoC architecture, ensuring a clean separation of business logic and UI.',
  ),
  ExperiencePoint(
    icon: Icons.format_list_numbered,
    title: 'Pagination',
    description:
        'Implemented pagination to load data in chunks, improving app performance and user experience.',
  ),
  ExperiencePoint(
    icon: Icons.assignment,
    title: 'Form Validations & Regex',
    description:
        'Added form validations and regex patterns to ensure data integrity and user-friendly input handling.',
  ),
  ExperiencePoint(
    icon: Icons.timer,
    title: 'Time Management',
    description:
        'Improved time management skills to deliver projects on schedule and meet deadlines.',
  ),
  ExperiencePoint(
    icon: Icons.bug_report,
    title: 'Debug Builds',
    description:
        'Created debug builds to track app progress and identify issues during development.',
  ),
  ExperiencePoint(
    icon: Icons.api,
    title: 'API Integration with Swagger',
    description:
        'Integrated APIs using Swagger for seamless backend communication and data fetching.',
  ),
];