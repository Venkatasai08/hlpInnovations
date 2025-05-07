import 'dart:ui';

import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  const AppScaffold({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset("assets/images/appBg.jpg", fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: SizedBox(),
                ),
              ),
            ),
          ),
        ),
        Scaffold(body: body, backgroundColor: Colors.transparent),
      ],
    );
  }
}
