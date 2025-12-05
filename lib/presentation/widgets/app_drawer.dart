import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: 40),

          Center(child: Image.asset("assets/task.png", height: 60)),

          const SizedBox(height: 20),

          const Center(
            child: CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/avatarman.png"),
            ),
          ),

          const SizedBox(height: 10),

          const Center(
            child: Text(
              "Gourav Kumar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 5),

          const Center(
            child: Text(
              "Flutter Developer",
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
          ),

          const SizedBox(height: 25),

          Divider(color: Colors.white24, thickness: 1),

          ListTile(
            leading: const Icon(Icons.person, color: Colors.white),
            title: const Text("Profile", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),

          Divider(color: Colors.white24, thickness: 1),

          ListTile(
            leading: const Icon(Icons.settings, color: Colors.white),
            title: const Text(
              "Settings",
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),

          Divider(color: Colors.white24, thickness: 1),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.white),
            title: const Text("Logout", style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
