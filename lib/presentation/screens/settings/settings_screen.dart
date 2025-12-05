import 'package:flutter/material.dart';
import 'package:assignment/core/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar with Logo
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(child: Image.asset("assets/task.png", height: 110)),

            const SizedBox(height: 20),

            const Text(
              "App Settings",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),

            const SizedBox(height: 20),

            ListTile(
              leading: const Icon(Icons.person, color: AppColors.primary),
              title: const Text(
                "Edit Profile",
                style: TextStyle(color: AppColors.primary),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: AppColors.primary,
              ),
              title: const Text(
                "Notifications",
                style: TextStyle(color: AppColors.primary),
              ),
              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primary,
              ),
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.lock, color: AppColors.primary),
              title: const Text(
                "Privacy",
                style: TextStyle(color: AppColors.primary),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.color_lens, color: AppColors.primary),
              title: const Text(
                "Theme",
                style: TextStyle(color: AppColors.primary),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.info_outline, color: AppColors.primary),
              title: const Text(
                "About App",
                style: TextStyle(color: AppColors.primary),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
