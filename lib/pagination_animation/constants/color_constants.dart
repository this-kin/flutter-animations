import 'package:flutter/material.dart';

const paginationBlackColor = Colors.black;

const paginationBgColor = Colors.white;

Color paginationGreyColor = Colors.grey.withOpacity(0.3);

WidgetStateProperty<Color> paginationColor =
    WidgetStateProperty.all(paginationBgColor);

WidgetStateProperty<EdgeInsetsGeometry>? padding =
    WidgetStateProperty.all(const EdgeInsets.all(15));
