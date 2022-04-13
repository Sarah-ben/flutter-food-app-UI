import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food/shared/components/constants.dart';
import 'package:food/views/cart/cart_screen.dart';
import 'package:food/views/home/home_screen.dart';
import 'package:food/views/profile/profile_screen.dart';
import 'package:food/views/wishlist/wishlist_screen.dart';

import '../../views/Details/details_screen.dart';
import 'app_states.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialApp());

  static AppCubit get(context) => BlocProvider.of(context);
  int index = 0;

  List<Widget> screens =  const[
    Home(),
    Cart(),
    Wishlist(),
    Profile(),
  ];
 List titles=[
  '',
   'Your Cart',
   'Your Wishlist',
   'You',
 ];

  List<BottomNavigationBarItem> bottomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart,),label: 'Cart'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label: 'Wishlist'),
    BottomNavigationBarItem(icon: Icon(Icons.person_outline,),label: 'You'),
  ];

  void changeBottomNAvBar(int i) {
    index = i;
    emit(changeBottomNavBarState());
  }

  int number=0;
// SIMPLE FUNCTIONS TO INCREMENT THE NUMBER OF PRODUCTS IN WISHLIST ,  I PUT THEM HERE TO SHOW U HOW TO USE BLOC
  void plus(){
    number++;
    emit(changePlusState());
  }

  void minimize(){
    number--;
    emit(changeMinusState());
  }

}