import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/app_cubit.dart';
import '../../layout/cubit/app_states.dart';
import '../../shared/components/components.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppCubit cubit=AppCubit.get(context);
    return BlocConsumer<AppCubit,AppStates>(builder: (context,states){
      return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
              ),
              Container(
                height: 150,
                padding:const EdgeInsets.only(right: 20.0,left: 20.0,top: 10.0),
                decoration:  BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius:const BorderRadius.only(topLeft: Radius.circular(40),topRight:Radius.circular(40) )
                ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                        Text('Subtotal'),
                        Text('Rs. 1500')
                      ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Text('Delivery fee'),
                          Text('Rs. 100')
                        ],),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const[
                          Text('Total'),
                          Text('Rs. 1600')
                        ],),
                      defaultButton(function: (){}, text: 'Add to wishlist')
                    ],
                  )),
              const SizedBox(height:5.0,)
            ],
      );
    }, listener: (context,states){});

  }
}
