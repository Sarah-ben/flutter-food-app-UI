import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/shared/components/components.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}
bool dailyFav=false;
bool dailyCart=false;
class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                buildKindItem(
                    name: 'Vegetables', color: Colors.green.withOpacity(.2)),
                buildKindItem(
                    name: 'Fruits', color: Colors.red.withOpacity(.2)),
                buildKindItem(
                    name: 'Masala', color: Colors.grey.withOpacity(.3)),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 30.0,
                  width: 110.0,
                  color: Colors.red,
                  child: const Text(
                    'NEW ARRIVALS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SEE ALL',
                      style: TextStyle(color: Colors.red, fontSize: 15.0),
                    )),
              ],
            ),
            //const SizedBox(height: 20.0,),

            Row(
              children: [
                buildProductItem(
                    name: 'Local Mango',
                    desc: '1 Kg',
                    image: 'assets/images/brocoli.jpg',
                    promotion: 10,
                context: context),
                buildProductItem(
                    name: 'Broccoli',
                    desc: '5 in a packet',
                    image: 'assets/images/mango.jpg',
                    context: context),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 30.0,
                  width: 110.0,
                  color: Colors.red,
                  child: const Text(
                    'DAILY NEEDS',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'SEE ALL',
                      style: TextStyle(color: Colors.red, fontSize: 15.0),
                    )),
              ],
            ),
            Column(
              children: [
                buildDailyProductItem(name: 'Broccoli', desc: '1 Kg', image: 'assets/images/brocoli.jpg',onPressedFav: (){
                  setState(() {
                    dailyFav=!dailyFav;
                  });
                },
                onPressedCart: (){
                  setState(() {
                    dailyCart=!dailyCart;
                  });
                }),
                buildDailyProductItem(name: 'Local Manga', desc: '10 in a packet', image: 'assets/images/mango.jpg',
                    onPressedFav: (){
                      setState(() {
                        dailyFav=!dailyFav;
                      });
                    },
                    onPressedCart: (){
                      setState(() {
                        dailyCart=!dailyCart;
                      });
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
