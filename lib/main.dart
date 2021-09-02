import 'package:flutter/material.dart';
import 'package:venuebooking_app/bloc/home_bloc.dart';
import 'package:venuebooking_app/components/about_us.dart';
import 'package:venuebooking_app/screens/success.dart';

import 'screens/home/home_screen.dart';

void main() {
  homeBloc.getCategoryList();
  homeBloc.getVenueList();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
