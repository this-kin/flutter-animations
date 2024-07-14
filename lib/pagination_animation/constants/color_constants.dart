import 'package:flutter/material.dart';

const paginationBlackColor = Colors.black;

const paginationBgColor = Colors.white;

Color paginationGreyColor = Colors.grey.withOpacity(0.3);

MaterialStateProperty<Color> paginationColor =
    MaterialStateProperty.all(paginationBgColor);

MaterialStateProperty<EdgeInsetsGeometry>? padding =
    MaterialStateProperty.all(const EdgeInsets.all(15));
