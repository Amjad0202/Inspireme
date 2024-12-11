// lib/widgets/common/app_background.dart
import 'package:flutter/material.dart';
import 'dart:ui';

class AppBackground extends StatelessWidget {
  final Widget child;
  final bool useGradient;

  const AppBackground({
    super.key,
    required this.child,
    this.useGradient = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: useGradient ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor.withOpacity(0.8),
            Theme.of(context).primaryColor.withOpacity(0.6),
          ],
        ) : null,
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
                opacity: 0.4,
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}