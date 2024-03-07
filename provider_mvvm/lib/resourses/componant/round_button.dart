import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final double hight;
  final bool loading;
  final double width;
  final String title;
  final Color color;
  final VoidCallback onPress;

  const RoundButton({
    Key? key,
    required this.hight,
    required this.width,
    required this.title,
    required this.onPress,
    required this.color,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: hight,
        width: width,
        decoration: BoxDecoration(color: color),
        child: Center(
          child: Visibility(
            visible: loading,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
            replacement: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
