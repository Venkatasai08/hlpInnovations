import 'dart:ui';

import 'package:flutter/material.dart';

class BackgroundImageWidget extends StatelessWidget {
  final String image;
  final double height;
  const BackgroundImageWidget({
    super.key,
    required this.image,
    this.height = 200,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Transform.scale(
                      scale: 5,
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),

                        child: Image.asset(image, fit: BoxFit.cover),
                      ),
                    ),
                  ),

                  Center(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return RadialGradient(
                          colors: [Colors.black, Colors.transparent],
                        ).createShader(bounds);
                      },
                      blendMode: BlendMode.dstIn,
                      child: Image.asset(image, fit: BoxFit.cover),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
