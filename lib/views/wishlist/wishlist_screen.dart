import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/app_cubit.dart';
import '../../layout/cubit/app_states.dart';
import '../../shared/components/components.dart';

class Wishlist extends StatelessWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit=AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(builder: (context,states){
      return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              children: [
                Expanded(
                  child: Column(
                    children:[
                      wishListItem(name: 'Mango', desc: '4 in a packet', number:cubit.number.toString(),plusFunction: (){
                        cubit.plus();
                      },minusFunction: (){
                        cubit.minimize();
                      }, image: 'assets/images/mango.jpg'),
                      wishListItem(name: 'Broccoli', desc: '1 kg', number:cubit.number.toString(), image: 'assets/images/brocoli.jpg'  ),

                    ],
                  ),
                ),
                defaultButton(function: (){}, text: 'Add to wishlist'),
                SizedBox(height:5.0,)
              ],
            ),
        );
    }, listener: (context,states){});

  }
}
