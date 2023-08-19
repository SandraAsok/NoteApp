import 'package:flutter/material.dart';
import 'package:noteapp/styles/app_style.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(
        Icons.navigate_before,
        color: appbarcolor,
      ),
      elevation: 0.0,
      title: Text(
        title,
        style: appbarstyle,
      ),
      centerTitle: true,
      backgroundColor: appbarcolor,
    );
  }
}
