import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final String? imageUrl;
  final Color? bgColor;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    this.bgColor,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (imageUrl != null)
              Positioned(
                left: 10,
                child: Image.asset(
                  imageUrl!,
                  width: 24,
                  height: 24,
                ),
              ),
            Align(
              alignment: Alignment.centerLeft,
              child: icon,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
