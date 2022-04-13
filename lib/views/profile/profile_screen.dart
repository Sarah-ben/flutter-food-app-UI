import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/shared/components/components.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 20.0,top: 30.0),
        child: Column(
          children: [
            customListTile(icon: Icons.edit, text: 'My Orders'),
            customListTile(icon: Icons.favorite_border, text: 'My Favorites'),
            customListTile(icon: Icons.payment, text: 'Payment Details'),
            customListTile(icon: Icons.settings, text: 'My Account'),
          ],
        ),

    );
  }
}
