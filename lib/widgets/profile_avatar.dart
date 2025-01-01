import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final double size;
  final ImageProvider? profileImage;
  final Color backgroundColor;
  final Color iconColor;

  const ProfileAvatar({
    super.key,
    this.size = 35,
    this.profileImage,
    this.backgroundColor = Colors.grey,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.pink[50],
        borderRadius: BorderRadius.circular(size),
      ),
      child: Stack(
        children: [
          // Profile image or placeholder
          Container(
            decoration: BoxDecoration(
              color: backgroundColor.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: profileImage != null
                ? CircleAvatar(
                    radius: size / 2,
                    backgroundImage: profileImage,
                  )
                : Icon(
                    Icons.person,
                    size: size * 1,
                    color: Colors.grey[400],
                  ),
          ),
          // Camera icon overlay
          Positioned(
            bottom: size * 0.05,
            right: size * 0.05,
            child: Container(
              padding: EdgeInsets.all(size * 0.06),
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.badge,
                size: size * 0.20,
                color: iconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
