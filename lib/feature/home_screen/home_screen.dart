import 'package:flutter/material.dart';

import '../../main.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFD),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Welcome Back Reem',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF192A56),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Student Code :20210248',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 28),

              // Search Bar
              // Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(18),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.05),
              //         spreadRadius: 0,
              //         blurRadius: 10,
              //         offset: const Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       hintText: 'How Can We Help?',
              //       hintStyle: TextStyle(color: Colors.grey[500]),
              //       prefixIcon:
              //           Icon(Icons.search, color: Colors.grey[500], size: 24),
              //       border: InputBorder.none,
              //       contentPadding: const EdgeInsets.symmetric(
              //           vertical: 16, horizontal: 16),
              //     ),
              //   ),
              // ),

              const SizedBox(height: 28),

              // Options List (Final Exam, Degrees, My Assignments, Subjects Material)
              _buildOptionCard(
                context,
                icon: Icons.calendar_today_outlined,
                title: 'Final exam schedule',
                continueText: 'continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinalExamTablePage()),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                icon: Icons.check_box_outlined,
                title: 'Degrees',
                continueText: 'continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DegreesPage()),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                icon: Icons.assignment_outlined,
                title: 'My Assignments',
                continueText: 'continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyAssignmentsPage()),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                context,
                icon: Icons.folder_open_outlined,
                title: 'Subjects Material',
                continueText: 'continue',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SubjectsMaterialPage()),
                  );
                },
              ),
              const SizedBox(height: 36),

              // Chat With Your Doctor Button (UPDATED)
              // Center(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: const Color(0xFF4285F4),
              //       padding: const EdgeInsets.symmetric(
              //           horizontal: 30, vertical: 16),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       elevation: 5,
              //     ),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) =>
              //                 ChatListScreen()), // Navigate to ChatListScreen
              //       );
              //     },
              //     child: const Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(Icons.message, color: Colors.white, size: 24),
              //         SizedBox(width: 12),
              //         Text(
              //           'Chat With Your Doctor',
              //           style: TextStyle(
              //             color: Colors.white,
              //             fontSize: 18,
              //             fontWeight: FontWeight.bold,
              //           ),
              //         ),
              //         SizedBox(width: 12),
              //         Icon(Icons.arrow_forward_ios,
              //             color: Colors.white, size: 18),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each option card
  Widget _buildOptionCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String continueText,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(10),
                child: Icon(icon, size: 28, color: const Color(0xFF2196F3)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF192A56),
                  ),
                ),
              ),
              Text(
                continueText,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
