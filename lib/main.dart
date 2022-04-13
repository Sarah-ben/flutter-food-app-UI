import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/layout/nav_bar_layout.dart';

import 'layout/cubit/app_cubit.dart';
import 'layout/cubit/app_states.dart';

void main()async {

  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (BuildContext context)=>AppCubit(),
        child: BlocConsumer<AppCubit,AppStates>(
          builder: (context,state){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainLayout(),
            );},
          listener: (context,state){} ,
        ));
  }
}
