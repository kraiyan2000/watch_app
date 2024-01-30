import 'package:flutter/material.dart';
import 'package:watch_app/screens/automatic.dart';
import 'package:watch_app/screens/cart.dart';
import 'package:watch_app/screens/chronograph.dart';
import 'package:watch_app/screens/quartz.dart';
import 'package:watch_app/screens/smart_coll.dart';
import 'package:watch_app/widgets/carasoul.dart';
import 'package:watch_app/widgets/search.dart';
import '../widgets/drawer.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: (const Color(0xFF04364A)),
          title: const Text("Time Elegance"),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const cart()));

                print('Search Button Pressed');
              },
            ),
          ],
        ),
        // drawer
        drawer: const drawer(),
        body: Container(
          color: const Color(0xffffffff),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const searchbar(),
                  // *************Adding carasoule in main page******************************************
                  const SizedBox(height: 10),

                  const carasoul(),
                  /////////////////////////////Carasoul ends here////////////////////////////////
                  const SizedBox(height: 5),
                  const Text(
                    'SHOP FOR',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  // Slider for gender in row
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 200,
                          child: Center(
                            child: Image(
                                image: AssetImage('assets/images/men.jpeg')),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 200,
                          child: Center(
                            child: Image(
                                image: AssetImage('assets/images/women.jpeg')),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 200,
                          child: Center(
                            child: Image(
                                image: AssetImage('assets/images/kids.jpeg')),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 200,
                          child: Center(
                            child: Image(
                                image:
                                    AssetImage('assets/images/couples.jpeg')),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ////////////////////////////////////////////Data row ends here /////////////////////////////////////////////////////////////
                  const SizedBox(height: 5),
                  const Text(
                    'COLLECTIONS',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                //  collection of watches
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const smartcoll()));
                        },
                        child: Container(
                            height: 180,
                            width: 158,
                            color: Colors.white,
                            child: const Image(
                                image: AssetImage('assets/images/smart.jpeg'))),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const chronographcoll()));
                        },
                        child: const InkWell(
                          child: SizedBox(
                            height: 158,
                            width: 160,
                            child: Image(
                                image: AssetImage(
                                    'assets/images/chronograph.jpeg')),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const automaticcoll()));
                        },
                        child: const SizedBox(
                            height: 158,
                            width: 160,
                            child: Image(
                              image: AssetImage('assets/images/automatic.jpeg'),
                            )),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const quartzcoll()));
                        },
                        child: const SizedBox(
                          height: 158,
                          width: 158,
                          child: Image(
                            image: AssetImage('assets/images/quartz.jpeg'),
                          ),
                        ),
                      ),
                    ],
                  ),

//Collections row eds here//////////////////////////////////////////
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'INTERNATIONAL BRANDS',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 250,
                          child: Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/offer slide (1).jpeg')),
                          ),
                        ),
                        // const SizedBox(width: 5),
                        SizedBox(
                          height: 150,
                          width: 250,
                          child: Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/offer slide (2).jpeg')),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 150,
                          width: 250,
                          child: Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/offer slide (3).jpeg')),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          height: 150,
                          width: 250,
                          child: Center(
                            child: Image(
                                image: AssetImage(
                                    'assets/images/offer slide (4).jpeg')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
