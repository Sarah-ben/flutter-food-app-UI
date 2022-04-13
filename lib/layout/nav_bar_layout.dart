import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/shared/components/components.dart';
import 'package:food/shared/components/constants.dart';

import 'cubit/app_cubit.dart';
import 'cubit/app_states.dart';

class MainLayout extends StatefulWidget {
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    AppCubit cubit=AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(builder: (context,states){
      return Scaffold(
        appBar: customAppBar(context,text: cubit.titles[cubit.index],size: cubit.index==0?100.0:60.0,elevation: cubit.index==0?0.0:.3 ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: defaultColor,
          unselectedItemColor: itemColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          currentIndex: cubit.index,
          items:cubit.bottomItems,
          onTap:(index){
            cubit.changeBottomNAvBar(index);
          },
        ),
        body:cubit.screens[cubit.index],
      );
    }, listener: (context,states){});
  }
}
