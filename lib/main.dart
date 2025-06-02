import 'package:flutter/material.dart';
import 'package:portal_app/feature/home_screen/home_screen.dart';

import 'feature/login_screen/login_screen.dart';
import 'feature/profile_screen/profile_screen.dart';

void main() => runApp(const BeSmartApp());

class BeSmartApp extends StatelessWidget {
  const BeSmartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'College Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily:
            'Inter', // Assuming 'Inter' font is available or similar system font
      ),
      home: LoginScreen(), // Start with the LoginPage
    );
  }
}

// --- Login Page ---

// --- Main Screen with Bottom Navigation Bar ---
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    NotificationsPage(),
    ChatListScreen(),
    const ProfileScreen(), // ProfilePage is now richly detailed
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomNavItem(Icons.home_rounded, 'Home', 0),
            _buildBottomNavItem(Icons.notifications_rounded, 'Notification', 1),
            _buildBottomNavItem(Icons.chat_bubble_rounded, 'Chat', 2),
            _buildBottomNavItem(Icons.person_rounded, 'Profile', 3),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                color: const Color(0xFFE0E8F9),
                borderRadius: BorderRadius.circular(25),
              )
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? const Color(0xFF2196F3) : Colors.grey[600],
              size: 26,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? const Color(0xFF2196F3) : Colors.grey[600],
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Home Page ---

// --- Placeholder ChatPage (will be replaced by ChatListScreen) ---
// This class is kept for MainScreen's bottom navigation bar, but its content will be empty
// as ChatListScreen will be the actual chat entry point.
class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[600],
        elevation: 0,
        iconTheme: const IconThemeData(
            color: Colors.white), // Ensures back button is white
      ),
      backgroundColor: const Color(0xFFEBF8FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.chat_bubble_outline, size: 80, color: Colors.blue[400]),
            const SizedBox(height: 20),
            Text(
              'No direct content here. This tab leads to chat list.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.blue[800]),
            ),
          ],
        ),
      ),
    );
  }
}

// --- ProfilePage ---

// --- Final Exam Table Page ---
class FinalExamTablePage extends StatelessWidget {
  final List<Map<String, String>> exams = [
    {'subject': 'Expert System', 'date': 'Friday, June 2', 'time': '9:00 AM'},
    {'subject': 'Data Mining', 'date': 'Monday, June 5', 'time': '1:00 PM'},
    {'subject': 'Web Design', 'date': 'Thursday, June 8', 'time': '11:00 AM'},
    {'subject': 'Multimedia', 'date': 'Tuesday, June 13', 'time': '10:00 AM'},
  ];

  FinalExamTablePage({super.key});

  @override
  Widget build(BuildContext context) {
    final blueTextStyle = TextStyle(
      color: Colors.blue[800],
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
    final subtitleStyle = TextStyle(color: Colors.blue[600]);

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAF8),
      appBar: AppBar(
        // Added AppBar
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[800]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Final Exam Schedule', // Changed title to be more specific
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 20, // Slightly smaller font for app bar title
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Center the title for a cleaner look
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical:
                  0), // Adjust vertical padding as app bar now provides it
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed redundant title and icon from body as AppBar handles it
              const SizedBox(height: 20), // Added some space below the app bar
              Expanded(
                child: ListView(
                  children: exams
                      .map((exam) => Container(
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                const BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  offset: Offset(0, 3),
                                )
                              ],
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(exam['subject']!,
                                        style: blueTextStyle),
                                    const SizedBox(height: 4),
                                    Text(exam['date']!, style: subtitleStyle),
                                  ],
                                ),
                                Text(
                                  exam['time']!,
                                  style: blueTextStyle.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Degrees Page ---
class DegreesPage extends StatelessWidget {
  final List<Map<String, String>> grades = [
    {'subject': 'Expert System', 'grade': '90%', 'status': 'Pass'},
    {'subject': 'Data Mining', 'grade': '85%', 'status': 'Pass'},
    {'subject': 'Web Design', 'grade': '74%', 'status': 'Almost there'},
    {'subject': 'Multimedia', 'grade': '88%', 'status': 'Pass'},
  ];

  DegreesPage({super.key});

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Pass':
        return Colors.green[700]!;
      case 'Almost there':
        return Colors.orange[700]!;
      case 'Fail':
        return Colors.red[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final blueColor = Colors.blue[800];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        // Added AppBar
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[800]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Grades / Degrees', // Changed title to be more specific
          style: TextStyle(
            color: blueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 0), // Adjust vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed redundant title and icon from body
              const SizedBox(height: 20), // Added some space below the app bar
              Expanded(
                child: ListView(
                  children: grades.map((grade) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                grade['subject']!,
                                style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    grade['grade']!,
                                    style: TextStyle(
                                      color: blueColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Text(
                                    grade['status']!,
                                    style: TextStyle(
                                      color: _getStatusColor(grade['status']!),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        if (grade != grades.last)
                          Divider(height: 1, color: Colors.grey[300]),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- My Assignments Page ---
class MyAssignmentsPage extends StatelessWidget {
  final Color blueColor = Colors.blue[800]!;

  MyAssignmentsPage({super.key});

  Widget _assignmentCard({
    required String title,
    required String status,
    IconData icon = Icons.assignment_turned_in,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          )
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: blueColor, size: 28),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: blueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  status,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        // Added AppBar
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: blueColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'My Assignments',
          style: TextStyle(
            color: blueColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 24.0, vertical: 0), // Adjust vertical padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Removed redundant title and icon from body
              const SizedBox(height: 20), // Added some space below the app bar
              Expanded(
                child: ListView(
                  children: [
                    _assignmentCard(
                      title:
                          'Web Design Assignment has been uploaded successfully',
                      status: 'Thank You',
                      icon: Icons.check_circle_outline,
                    ),
                    _assignmentCard(
                      title: '1 Assignment for Expert System required',
                      status: 'The due date is 26th of May',
                      icon: Icons.warning_amber_rounded,
                    ),
                    _assignmentCard(
                      title: 'Upcoming Assignments: Data Mining & Multimedia',
                      status: 'Due on 31st of May',
                      icon: Icons.access_time,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- LectureCard Widget ---
class LectureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;

  LectureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to individual lecture details page if needed
          print('Tapped on ${title} lectures');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, size: 32, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Subjects Material Page ---
class SubjectsMaterialPage extends StatelessWidget {
  const SubjectsMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        centerTitle: false,
        leading: IconButton(
          // Added back button
          icon: Icon(Icons.arrow_back_ios, color: Colors.blue[800]),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Subjects Material',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 20, // Adjusted font size for consistency
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.sort, color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement sort options
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              LectureCard(
                icon: Icons.account_tree,
                title: 'Expert System',
                subtitle: '4 Lectures available',
                iconColor: Colors.blue[700]!,
              ),
              LectureCard(
                icon: Icons.analytics,
                title: 'Data Mining',
                subtitle: '5 Lectures available',
                iconColor: Colors.green[700]!,
              ),
              LectureCard(
                icon: Icons.web,
                title: 'Web Design',
                subtitle: '1 Lecture available',
                iconColor: Colors.red[700]!,
              ),
              LectureCard(
                icon: Icons.play_circle_fill,
                title: 'Multimedia',
                subtitle: '3 Lectures available',
                iconColor: Colors.purple[700]!,
              ),
              LectureCard(
                icon: Icons.code,
                title: 'Programming II',
                subtitle: '6 Lectures available',
                iconColor: Colors.orange[700]!,
              ),
              LectureCard(
                icon: Icons.calculate,
                title: 'Calculus I',
                subtitle: '8 Lectures available',
                iconColor: Colors.indigo[700]!,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- NotificationCard Widget ---
class NotificationCard extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final IconData icon;
  final Color iconColor;

  NotificationCard({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    required this.icon,
    this.iconColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, size: 28, color: iconColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blue[800],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    message,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[500],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- NotificationsPage ---
class NotificationsPage extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'type': 'announcement',
      'title': 'Important: Final Exam Schedule Update',
      'message':
          'The final exam schedule has been revised. Please check the "Final Exam Schedule" section for details.',
      'time': '2 hours ago',
    },
    {
      'type': 'assignment_due',
      'title': 'Assignment Due: Expert System',
      'message': 'Your Expert System assignment is due tomorrow, May 27th!',
      'time': '5 hours ago',
    },
    {
      'type': 'grade_release',
      'title': 'Grades Released for Data Mining Quiz 2',
      'message':
          'Your grades for the Data Mining Quiz 2 are now available in the "Degrees" section.',
      'time': 'Yesterday',
    },
    {
      'type': 'lecture_upload',
      'title': 'New Lecture Material: Web Design',
      'message':
          'Lecture 3 slides for Web Design have been uploaded. Find them in "Subjects Material".',
      'time': 'May 24, 2025',
    },
    {
      'type': 'announcement',
      'title': 'Campus Event: Annual Tech Fair',
      'message':
          'Join us for the Annual Tech Fair on June 10th at the main hall!',
      'time': 'May 20, 2025',
    },
    {
      'type': 'chat_message',
      'title': 'New Message from Dr. Ahmed',
      'message':
          'You have a new message from Dr. Ahmed regarding your project proposal.',
      'time': 'May 19, 2025',
    },
  ];

  NotificationsPage({super.key});

  // Helper to determine icon and color based on notification type
  Map<String, dynamic> _getNotificationIconAndColor(String type) {
    switch (type) {
      case 'announcement':
        return {'icon': Icons.campaign, 'color': Colors.blue[700]};
      case 'assignment_due':
        return {'icon': Icons.assignment_late, 'color': Colors.orange[700]};
      case 'grade_release':
        return {'icon': Icons.leaderboard, 'color': Colors.green[700]};
      case 'lecture_upload':
        return {'icon': Icons.menu_book, 'color': Colors.purple[700]};
      case 'chat_message':
        return {'icon': Icons.chat_bubble, 'color': Colors.teal[700]};
      default:
        return {'icon': Icons.info, 'color': Colors.grey[700]};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement more options
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      backgroundColor: const Color(0xFFFAFAFA),
      body: notifications.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_off,
                      size: 80, color: Colors.blue[400]),
                  const SizedBox(height: 20),
                  Text(
                    'You have no new notifications.',
                    style: TextStyle(fontSize: 20, color: Colors.blue[800]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                final iconData =
                    _getNotificationIconAndColor(notification['type']!);
                return NotificationCard(
                  title: notification['title']!,
                  message: notification['message']!,
                  time: notification['time']!,
                  icon: iconData['icon'],
                  iconColor: iconData['color'],
                );
              },
            ),
    );
  }
}

// --- ChatContactCard Widget ---
class ChatContactCard extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarText;
  final Color avatarColor;

  ChatContactCard({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarText,
    this.avatarColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to individual chat screen
          print('Tapped on chat with $name');
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: avatarColor.withOpacity(0.2),
                child: Text(
                  avatarText,
                  style: TextStyle(
                    color: avatarColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blue[800],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lastMessage,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}

// --- ChatListScreen ---
class ChatListScreen extends StatelessWidget {
  final List<Map<String, String>> chatContacts = [
    {
      'name': 'Dr. Ahmed Hassan',
      'lastMessage': 'Okay, I will review your assignment.',
      'time': '10:30 AM',
      'avatarText': 'AH',
      'avatarColor': 'blue',
    },
    {
      'name': 'Dr. Sheref Morad',
      'lastMessage': 'Remember the deadline for the project.',
      'time': 'Yesterday',
      'avatarText': 'SM',
      'avatarColor': 'green',
    },
    {
      'name': 'Dr. Eman Moner',
      'lastMessage': 'Please prepare for next week\'s lecture.',
      'time': 'May 20',
      'avatarText': 'EM',
      'avatarColor': 'purple',
    },
    {
      'name': 'Dr. Sara Ali',
      'lastMessage': 'Your query has been addressed.',
      'time': 'May 18',
      'avatarText': 'SA',
      'avatarColor': 'orange',
    },
  ];

  ChatListScreen({super.key});

  // Helper to get Color object from string (for avatarColor)
  Color _getColorFromString(String colorName) {
    switch (colorName) {
      case 'blue':
        return Colors.blue[700]!;
      case 'green':
        return Colors.green[700]!;
      case 'purple':
        return Colors.purple[700]!;
      case 'orange':
        return Colors.orange[700]!;
      default:
        return Colors.grey[700]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF9FAFD),
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Chats',
          style: TextStyle(
            color: Colors.blue[800],
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.add_comment_outlined,
                color: Colors.grey[600], size: 28),
            onPressed: () {
              // Implement new chat functionality
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: chatContacts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.chat_bubble_outline,
                      size: 80, color: Colors.blue[400]),
                  const SizedBox(height: 20),
                  Text(
                    'No active chats. Start a new conversation!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.blue[800]),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: chatContacts.length,
              itemBuilder: (context, index) {
                final contact = chatContacts[index];
                return ChatContactCard(
                  name: contact['name']!,
                  lastMessage: contact['lastMessage']!,
                  time: contact['time']!,
                  avatarText: contact['avatarText']!,
                  avatarColor: _getColorFromString(contact['avatarColor']!),
                );
              },
            ),
    );
  }
}
