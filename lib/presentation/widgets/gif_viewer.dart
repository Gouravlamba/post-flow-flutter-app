import 'package:flutter/material.dart';

class GifBanner extends StatefulWidget {
  final String path;
  final double height;
  final bool showTitle;
  final String title;
  final String subtitle;

  const GifBanner({
    super.key,
    this.path = "assets/gif/avatar.gif",
    this.height = 180,
    this.showTitle = true,
    this.title = "Let's Explore Your Posts!",
    this.subtitle = "Your posts, your world — visualized beautifully.",
  });

  @override
  State<GifBanner> createState() => _GifBannerState();
}

class _GifBannerState extends State<GifBanner> {
  bool _isLoaded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (!_isLoaded)
                const CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),

              Image.asset(
                widget.path,
                height: widget.height,
                fit: BoxFit.contain,
                gaplessPlayback: true,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) {
                    _isLoaded = true;
                    return child;
                  }
                  if (frame == null) {
                    return Opacity(opacity: 0, child: child);
                  }
                  Future.microtask(() {
                    if (mounted) {
                      setState(() => _isLoaded = true);
                    }
                  });
                  return AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 400),
                    child: child,
                  );
                },
              ),
            ],
          ),
        ),

        const SizedBox(height: 1),

        if (widget.showTitle)
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),

        const SizedBox(height: 6),

        if (widget.showTitle)
          Text(
            widget.subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              fontSize: 17,
              height: 1.4,
            ),
          ),
      ],
    );
  }
}
