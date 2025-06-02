import 'package:flutter/material.dart';
import 'package:portal_app/core/utils/shared_widgets/app_text.dart';

import '../login_screen/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper to build a single profile detail row
  Widget _buildProfileDetailRow(String label, String value, {IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: Colors.grey[600]),
            const SizedBox(width: 12),
          ],
          Text(
            '$label:',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.blue[800],
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build an option row within an expandable section
  Widget _buildOptionRow(String title, {IconData? icon, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        child: Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 24, color: Colors.blue[600]),
              const SizedBox(width: 16),
            ],
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue[800],
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFFAFAFA), // Consistent light background
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Header Section ---
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue[100],
                    child:
                        Icon(Icons.person, size: 50, color: Colors.blue[700]),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reem Eissa',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[800],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Student Code: 20210248',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- Profile Details Section ---
              Text(
                'Profile Details',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              const SizedBox(height: 12),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      _buildProfileDetailRow('Major', 'Computer Science',
                          icon: Icons.laptop_mac),
                      Divider(color: Colors.grey[200], height: 16),
                      _buildProfileDetailRow('Academic Level', '3rd Year',
                          icon: Icons.trending_up),
                      Divider(color: Colors.grey[200], height: 16),
                      _buildProfileDetailRow(
                          'Email Address', 'noemail@gmail.com',
                          icon: Icons.email),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // --- Main Sections & Options ---
              Text(
                'Main Sections & Options',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              const SizedBox(height: 12),

              // Academic Info
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    '📚 Academic Info',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  children: <Widget>[
                    _buildOptionRow('Courses Enrolled', icon: Icons.book,
                        onTap: () {
                      /* Navigate */
                      showModalBottomSheet( //!Sheet
                        context: context,
                        isScrollControlled: true, // This is crucial
                        builder: (context) {
                          return Padding(
                            // Add padding to handle the keyboard
                            padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Your content here
                                  TextFormField(),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  AppText("text"),
                                  // Other widgets
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }),
                    _buildOptionRow('Current Semester', icon: Icons.date_range,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Grades / GPA', icon: Icons.bar_chart,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Class Schedule', icon: Icons.schedule,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Attendance Record',
                        icon: Icons.check_circle_outline,
                        onTap: () {/* Navigate */}),
                  ],
                ),
              ),

              // Documents
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    '🧾 Documents',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  children: <Widget>[
                    _buildOptionRow('ID Card (view/download)',
                        icon: Icons.credit_card, onTap: () {/* Navigate */}),
                    _buildOptionRow('Transcript', icon: Icons.description,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Registration Form', icon: Icons.assignment,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Fee Receipts / Invoices',
                        icon: Icons.receipt, onTap: () {/* Navigate */}),
                  ],
                ),
              ),

              // Settings
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    '⚙️ Settings',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  children: <Widget>[
                    _buildOptionRow('Edit Profile', icon: Icons.edit,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Change Password', icon: Icons.lock,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Notification Preferences',
                        icon: Icons.notifications_active,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('App Theme (Dark/Light Mode)',
                        icon: Icons.brightness_6, onTap: () {/* Navigate */}),
                  ],
                ),
              ),

              // Actions
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                margin: const EdgeInsets.only(bottom: 16),
                child: ExpansionTile(
                  tilePadding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  title: Text(
                    '📤 Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  children: <Widget>[
                    _buildOptionRow('Log Out', icon: Icons.logout, onTap: () {
                      // Implement logout logic here
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false,
                      );
                    }),
                    _buildOptionRow('Contact Support',
                        icon: Icons.contact_support,
                        onTap: () {/* Navigate */}),
                    _buildOptionRow('Feedback / Report a Problem',
                        icon: Icons.feedback, onTap: () {/* Navigate */}),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
