import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/shared/components/components.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
bool isFav=false;
bool addToCart=false;
class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: buildDetailItem(width,onTap: (){
        setState(() {
           isFav=!isFav;
        });
      },
      onPressed: (){
        setState(() {
          addToCart=!addToCart;
        });
      }),

    );
  }
}


/*
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
 */