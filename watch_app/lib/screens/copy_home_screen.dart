// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:watch_app/widgets/carasoul.dart';

// import '../widgets/drawer.dart';

// class MyHome extends StatefulWidget {
//   const MyHome({super.key});

//   @override
//   State<MyHome> createState() => _MyHomeState();
// }

// class _MyHomeState extends State<MyHome> {
//   @override
// // initializing products here
//   final CollectionReference productsCollection =
//       FirebaseFirestore.instance.collection('products');

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: (const Color(0xFF04364A)),
//         title: const Text("Time Elegance"),
//         actions: [],
//       ),
//       drawer: drawer(),
//       body: StreamBuilder(
//         stream: productsCollection.snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
//           if (streamSnapshot.hasData) {
//             return ListView.builder(
//               itemCount: streamSnapshot.data!.docs.length,
//               itemBuilder: (context, index) {
//                 final DocumentSnapshot documentSnapshot =
//                     streamSnapshot.data!.docs[index];
//                 // final name = (documentSnapshot['name']);
//                 // final image = (documentSnapshot['image']);
//                 // final price = (documentSnapshot['price']);
//                 // final s1image = (documentSnapshot['s1image']);
//                 // final s2image = (documentSnapshot['s2image']);
//                 // final s3image = (documentSnapshot['s3image']);

//                 return Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       TextField(
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.search,
//                               color: Color(0xFF04364A)),
//                           suffixIcon: IconButton(
//                             color: const Color(0xFF04364A),
//                             icon: const Icon(
//                               Icons.mic,
//                             ),
//                             onPressed: () {
//                               // Clear the search text
//                             },
//                           ),
//                           hintText: 'What are you looking for?',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10.0),
//                           ),
//                         ),
//                       ),

//                       // *************Adding carasoule in main page******************************************
//                       const SizedBox(height: 10),

//                       carasoul(),
// /////////////////////////////Carasoul ends here////////////////////////////////
//                       const SizedBox(height: 15),
//                       const Text(
//                         'Watches for',
//                         style: TextStyle(
//                             fontSize: 20, fontWeight: FontWeight.w500),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             Container(
//                               height: 200,
//                               width: 300,
//                               child: const Center(child: Text("data")),
//                               color: Colors.amber,
//                             ),
//                             const SizedBox(width: 10),
//                             Container(
//                               height: 200,
//                               width: 300,
//                               child: const Center(child: Text("data")),
//                               color: Colors.amber,
//                             ),
//                             const SizedBox(width: 10),
//                             Container(
//                               height: 200,
//                               width: 300,
//                               child: const Center(child: Text("data")),
//                               color: Colors.amber,
//                             ),
//                             const SizedBox(width: 10),
//                           ],
//                         ),
//                       ),
// ////////////////////////////////////////////Data row ends here /////////////////////////////////////////////////////////////
//                       const SizedBox(height: 10),

//                       Row(
//                         children: [
//                           Container(
//                             height: 200,
//                             width: 150,
//                             color: Colors.white,
//                             child: const Text("Smart watch"),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 200,
//                             width: 182,
//                             color: Colors.blue,
//                             child: const Text("Chronograph"),
//                           ),
//                         ],
//                       ),

//                       const SizedBox(
//                         height: 10,
//                       ),
//                       Row(
//                         children: [
//                           Container(
//                             height: 200,
//                             width: 183,
//                             color: Colors.orange,
//                             child: const Text("Automatic"),
//                           ),
//                           const SizedBox(
//                             width: 10,
//                           ),
//                           Container(
//                             height: 200,
//                             width: 182,
//                             color: Colors.purple,
//                             child: const Text("Quartz"),
//                           ),
//                         ],
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           }

//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         },
//       ),
//     );
//   }
// }
