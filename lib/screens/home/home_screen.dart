import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:SPACtivity/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icon/menu.svg"), 
        onPressed: () {},
        ),
      );
  }
}