import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment_integration/core/utils/styles.dart';

AppBar buildAppBar({String? title}) {
  return AppBar(
    leading: Center(child: SvgPicture.asset('assets/images/arrow.svg')),
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      title ?? '',
      textAlign: TextAlign.center,
      style: Styles.style25,
    ),
  );
}
