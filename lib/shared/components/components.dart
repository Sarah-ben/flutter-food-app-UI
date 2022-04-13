import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/layout/cubit/app_cubit.dart';
import 'package:food/views/Details/details_screen.dart';
import '../../views/home/home_screen.dart';
import 'custom_painter.dart';


// for YOU screen
Widget customListTile({
  required IconData icon,
  required String text,
}) =>
    InkWell(
      onTap: () {},
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );


PreferredSizeWidget customAppBar(context,
        {elevation = .3,
        required double size,
        required String text,
        Color color = Colors.white}) =>
    PreferredSize(
      preferredSize: Size.fromHeight(size),
      child: AppBar(
        backgroundColor: color,
        title: Text(
          text,
          style: const TextStyle(color: Colors.black),
        ),
        //toolbarHeight: 140,
        elevation: elevation,
        // AppCubit.get(context).index == 0 : IF IT'S IN THE  HOME PAGE
        flexibleSpace: AppCubit.get(context).index == 0
            ? Padding(
                padding:
                    const EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
                child: Row(
                  children: [
                    const Image(image: AssetImage('assets/images/fod.webp'),width: 60.0,),
                    /*const Icon(
                      Icons.payment,
                      color: Colors.yellowAccent,
                      size: 30,
                    ),*/
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Card(
                        elevation: 3.0,
                        child: Container(
                            //width: MediaQuery.of(context).size.width - 70,
                            height: 40,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: const TextField(
                              //textAlign: TextAlign.center,
                              // controller: search,
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  filled: true,
                                  fillColor: Colors.white,
                                  suffixIcon:
                                      Icon(Icons.search, color: Colors.grey),
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20.0)),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintStyle: TextStyle(color: Colors.black38),
                                  hintText: "Search products"),
                            )),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        /* actions: [
    AppCubit.get(context).index==0?
    Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Container(
        //margin:const EdgeInsets.only(right: 10.0,top: 30.0),
        width: MediaQuery.of(context).size.width-50,
        //height: 70.0,
        child: Container(
          color: Colors.red,
            height: 60.0,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        decoration:const InputDecoration(
                            border:   OutlineInputBorder(
                              borderRadius:BorderRadius.all(Radius.circular(20.0)),
                              borderSide:  BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:   BorderSide.none,
                            ),
                            enabledBorder:  OutlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: 'Search Products'
                        ),
                      ),
                    ),
                  ),
                 const Icon(Icons.search,color: Colors.grey)
                ],
              ),
            ),
          ),

      ),
    ):Icon(Icons.add,)
  ],*/
      ),
    );

// for Wishlist and cart screen
Widget wishListItem({
  required String name,
  required String desc,
  required String number,
  required String image,
  plusFunction,
  minusFunction,
}) =>
    Container(
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      height: 120.0,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage(image),
                width: 90,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.5),
                    ),
                    Text(desc, style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: plusFunction,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 11.0,
                          child: Icon(
                            Icons.add,
                            size: 6.0,
                            color: Colors.white,
                          ),
                        )),
                    //FloatingActionButton(elevation: 0.0,mini: true,onPressed: (){},child:const Icon(Icons.add,size: 15.0,),),
                    // MaterialButton(minWidth: 15.0,clipBehavior: Clip.antiAliasWithSaveLayer,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),color: Colors.green,onPressed: (){},child: Icon(Icons.add,size: 15.0,),),
                    Text(number),
                    InkWell(
                        onTap: minusFunction,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 11.0,
                          child: Icon(
                            Icons.minimize,
                            size: 6.0,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blueAccent,
  @required function,
  @required text,
  bool iconText = false,
  icon,
}) =>
    Container(
      color: Colors.green,
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: function,
        child: iconText == false
            ? Text(
                text,
                style: const TextStyle(color: Colors.white),
              )
            : Icon(icon),
      ),
    );

// for food types
Widget buildKindItem({required String name, required Color color}) => InkWell(
      onTap: () => null,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        margin: const EdgeInsets.only(right: 10.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        height: 90.0,
        width: 100.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 25.0,
            ),
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );

// for each product in NEW ARRIVALS
Widget buildProductItem(
        {required String name,
        required String desc,
        required String image,
        promotion = 0,
        context}) =>
    InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => DetailsScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 10.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: 170,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    child: Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: [
                        Container(
                          width: 170,
                          height: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              image,
                            ),
                          )),
                        ),
                        promotion > 0
                            ? Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(3.0)),
                                child: Text(
                                  '$promotion% off',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              )
                            : Container()
                        //   Image.asset(image)
                      ],
                    )),
                const SizedBox(
                  height: 10.0,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            height: 1.5),
                      ),
                      Text(desc, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () => null,
                  child: Container(
                    color: Colors.yellowAccent,
                    width: 170,
                    height: 30.0,
                    alignment: AlignmentDirectional.center,
                    child: const Text('Add to Cart'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

// for each product in DAILY NEEDS
Widget buildDailyProductItem({
  required String name,
  required String desc,
  required String image,
  onPressedFav,
  onPressedCart,
}) => InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 5.0),
        height: 120.0,
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(image),
                  width: 90,
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            height: 1.5),
                      ),
                      Text(desc, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                          minWidth: 30.0,
                          onPressed: onPressedFav,
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.05),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: dailyFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black54,
                                  ),
                          )),
                      MaterialButton(
                          minWidth: 30.0,
                          onPressed: onPressedCart,
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.05),
                                borderRadius: BorderRadius.circular(20.0)),
                            child: dailyCart
                                ? const Icon(
                                    Icons.remove_shopping_cart_outlined,
                                    color: Colors.black54,
                                  )
                                : Icon(
                                    Icons.shopping_cart_outlined,
                                    color: Colors.black54,
                                  ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

//for details screen
Widget buildDetailItem(width, {onTap, onPressed}) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            CustomPaint(
              child: Container(
                height: 200.0,
              ),
              painter: CurvePainter(),
            ),
            /*Container(
          height: 100,
          decoration:const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(10.0),bottomRight: Radius.circular(10.0))
          ),
        ),*/
            Padding(
              padding: EdgeInsets.symmetric(horizontal: (width - 345) / 2),
              child: Card(
                child: SizedBox(
                  width: 345,
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: MaterialButton(
                              minWidth: 30.0,
                              onPressed: () {},
                              child: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(.05),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: InkWell(
                                    onTap: onTap,
                                    child: isFav
                                        ?const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            Icons.favorite_border,
                                            color: Colors.black,
                                          )),
                              )),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        const Image(
                          image: AssetImage('assets/images/mango.jpg'),
                          width: 150.0,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Local Mango',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              height: 1.5),
                        ),
                        const Text('5 in a packet',
                            style: TextStyle(color: Colors.grey)),
                        const SizedBox(height: 10.0,),
                        const Text('100 §',
                            style: TextStyle(color: Colors.black)),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum it anim id est lab.',
              style: TextStyle(
                  fontSize: 15.0, height: 1.4, color: Colors.black54)),
        ),
        const Spacer(),
        const Text(
          '  Related Items',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 3.0,
        ),
        SizedBox(
            height: 45.0,
            child: MaterialButton(
              minWidth: double.infinity,
              color: Colors.green,
              onPressed: onPressed,
              child: addToCart
                  ? const Text(
                      'Added to Cart',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    )
                  : const Text(
                      'Add to Cart',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
            ))
      ],
    );
