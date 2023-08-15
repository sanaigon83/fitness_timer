import 'package:flutter/cupertino.dart';

class HomeSettingText extends StatelessWidget {
  const HomeSettingText({
    super.key,
    required this.homeTextStyle,
    required this.title,
    required this.value,
  });

  final TextStyle homeTextStyle;
  final String value;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        title,
        style: homeTextStyle,
      ),
      SizedBox(width: 10),
      Text(
        value,
        style: homeTextStyle,
      ),
    ]);
  }
}
