import 'package:assignment/presentation/widgets/app_drawer.dart';
import 'package:assignment/presentation/widgets/gif_viewer.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, size: 30, color: AppColors.primary),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            Image.asset("assets/task.png", height: 50),
            const SizedBox(width: 10),
            const Text(
              "",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),

              const Text(
                "Welcome ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Explore your posts,\nreview details,\nand enjoy a smooth experience!",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 30),

              const Center(
                child: GifBanner(
                  path: "assets/gif/avatar.gif",
                  height: 400,
                  title: "Let's Explore Your Posts!",
                  subtitle:
                      "Your posts come alive here — enjoy browsing smoothly.",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
