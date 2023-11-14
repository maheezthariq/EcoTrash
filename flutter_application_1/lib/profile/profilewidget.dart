import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  const ProfileWidget({
    Key? key, // Use 'key' instead of 'super.key'
    required this.icon,
    required this.title,
    required this.onPress,
    required this.endIcon,
    this.textColor,
  }) : super(key: key); // Initialize 'key' using 'super(key: key)'

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                color: Colors.black,
                size: 24,
              ),
              if (endIcon) // Use 'if' to conditionally include the Text widget
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
              ),
              onPressed: onPress,
            ),
          ),
        ],
      ),
    );
  }
}
