import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'ItemDetailPage.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double SW = MediaQuery.of(context).size.width;
    double SH= MediaQuery.of(context).size.height;
    final List<Map<String, String>> cafeItems = [
      {'name': 'Hot Coffee', 'image': 'c3.png'},
      {'name': 'Hot Coffee', 'image': 'c2.png'},
      {'name': 'Hot Coffee', 'image': 'c4.png'},
      {'name': 'Hot Coffee', 'image': 'c1.png'},
      {'name': 'Hot Coffee', 'image': 'c2.png'},
      {'name': 'Hot Coffee', 'image': 'c1.png'},
      {'name': 'Hot Coffee', 'image': 'c2.png'},
      {'name': 'Hot Coffee', 'image': 'c3.png'},
      {'name': 'Hot Coffee', 'image': 'c4.png'},
    ];
    return Scaffold(
        appBar: AppBar(

              title: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '👋', // Emoji (hand icon)
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(width: 14),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("19/10/2024",style: TextStyle(fontSize: 13),),
                        Text(
                          'Swarup Usare',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ]
              ),
              actions: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width:40,
                      decoration: BoxDecoration(
                        color: Colors.white70, // Background color
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10), // Make it circular
                      ),
                      child:Center(
                        child: IconButton(
                        icon: Icon(Icons.shopping_cart,),
                        onPressed: () {

                        },
                      ),
                      ),
                    ),
                    SizedBox(width: 10), // Adds spacing between icons
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/pf.jpg'),
                    ),
                    SizedBox(width: 15),
                  ],
                ),

              ],
              backgroundColor:Color.fromARGB(255, 166, 159, 159),
            ),

        body:
        ListView(
             children: [
               // Search box below AppBar
               Container(
                 width: SW ,
                 height: 100,
                 decoration: const BoxDecoration(
                   color:Color.fromARGB(255, 166, 159, 159),
                 ),
                 child: Center(

                   child: SizedBox(
                     width: SW>=500?min(SW * 0.7, 700):(SW*0.9),
                     child:
                     TextField(
                       controller: _searchController,

                       decoration: InputDecoration(

                         labelText: 'Search',
                         hintText: 'Search items',
                         prefixIcon: Icon(Icons.search),
                         suffixIcon: Padding(padding: EdgeInsets.all(7.0) ,
                           child:  SvgPicture.asset(
                             'assets/filter.svg',
                             width: 7,
                             height: 0,
                           ),
                         ),
                         border: const OutlineInputBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         ),
                         filled: true,
                         fillColor: Colors.white70,
                         iconColor: Colors.white70,
                       ),

                     ),

                   ),
                 ),
               ),


               Container(
                 decoration: const BoxDecoration(
                   color: Color.fromARGB(255, 41, 146, 113),
                 ),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                     Padding(
                       padding: const EdgeInsets.fromLTRB(20,14,0,14),
                       child: Text(
                         'Most Popular Beverages',
                         style: TextStyle(
                           fontSize: 16,
                           fontWeight: FontWeight.bold,
                         ),
                       ),
                     ),
                     // Horizontally scrollable list of food images
                     Container(
                       height: 240,
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: cafeItems.length,
                         itemBuilder: (context, index) {
                           final citem = cafeItems[index];
                           return GestureDetector(
                             onTap: () {
                               // Navigate to detailed page when an image is tapped
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(
                                   builder: (context) => ItemDetailPage(
                                     itemName: citem['name']!,
                                     itemImage: citem['image']!,
                                   ),
                                 ),
                               );
                             },
                             child: Container(
                               margin: EdgeInsets.fromLTRB(8, 0, 8, 20),
                               width: 180,
                               decoration: BoxDecoration(

                                 color: Colors.white.withOpacity(0.2), // Transparent effect
                                 borderRadius:   BorderRadius.circular(20), // Same rounded corners
                                 border: Border.all(
                                   color: Colors.white.withOpacity(0.2), // Border with transparency
                                 ),
                               ),
                               child:Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                 children: [
                                   ClipRRect(
                                     borderRadius: BorderRadius.circular(8.0),
                                     child:
                                     Image.asset(
                                       'assets/${citem['image']}',
                                       height: 120,
                                       fit: BoxFit.cover,

                                     ),
                                   ),
                                   SizedBox(height: 8),
                                   Padding(
                                     padding:const EdgeInsets.fromLTRB(16,0,1,4),
                                     child:    Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         Text(
                                           citem['name']!,
                                           style: TextStyle(fontSize: 18,color: Colors.white70),
                                         ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             const Column(
                                               children: [
                                                 Text("THis is Nice"),
                                                 Text("4.6 #0344")
                                               ],
                                             ),
                                             IconButton(
                                               color: Colors.white60,
                                               icon: const Icon(Icons.add_box,color: Color.fromARGB(
                                                   255, 78, 234, 71,),size: 30,),
                                               onPressed: () {
                                                 // Handle notification icon press
                                               },
                                             ),
                                           ],
                                         ),
                                       ],
                                     )
                                     ,
                                   )


                                 ],
                               ),
                             ),
                           );
                         },
                       ),
                     ),

                   ],
                 ),

               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(19, 15, 0, 0),
                 child: Text("Get it instantly",style: TextStyle(fontSize: SW * 0.05,color: Colors.white60),),
               ),

               Padding(
                 padding: const EdgeInsets.fromLTRB(20.0,13,20,0),
                 child: Card(
                     elevation: 8, // Card elevation
                     color: Colors.white.withOpacity(0.4),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16.0),
                     ),
                   child:
                   SizedBox(
                      height: SW * 0.3,

                       child: Row(
                         children: [
                           Flexible(
                               flex: 6,
                               child:Padding(
                                   padding: EdgeInsets.fromLTRB(17,20,5,7),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Hot Tea",
                                        style: TextStyle(
                                          fontSize: SW*0.04,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text("4.5 ",
                                        style: TextStyle(
                                          fontSize: SW * 0.02,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      SizedBox(height: 2),
                                      Text(
                                        'Rise and grind, its coffee time! Life begins after coffee.Just brewed happiness in a cup',
                                        style: TextStyle(
                                          fontSize:SW * 0.02,
                                          color: Colors.white60,
                                        ),
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ) ,
                               )


                           ),
                           Flexible(
                             flex: 5,
                             child:Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Stack(
                                   children: [
                                     FractionallySizedBox(
                                       heightFactor:1,widthFactor: 1,
                                         child:ClipRRect (
                                           borderRadius: BorderRadius.circular(10),
                                           child:  Image.asset(
                                             'assets/cafe.png',
                                             fit: BoxFit.cover,

                                           ),
                                         )
                                     ),

                                   ]
                               ),
                             ),
                           )
                         ],
                       ),


                   )


                   
                 ),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(20.0,13,20,0),
                 child: Card(
                     elevation: 8, // Card elevation
                     color: Colors.white.withOpacity(0.4),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16.0),
                     ),
                     child:
                     SizedBox(
                       height: SW * 0.3,

                       child: Row(
                         children: [
                           Flexible(
                               flex: 6,
                               child:Padding(
                                 padding: EdgeInsets.fromLTRB(17,20,5,7),
                                 child:Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Hot Tea",
                                       style: TextStyle(
                                         fontSize: SW*0.04,
                                         color: Colors.white70,
                                       ),
                                     ),
                                     Text("4.5 ",
                                       style: TextStyle(
                                         fontSize: SW * 0.02,
                                         color: Colors.white70,
                                       ),
                                     ),
                                     SizedBox(height: 2),
                                     Text(
                                       'Rise and grind, its coffee time! Life begins after coffee.Just brewed happiness in a cup',
                                       style: TextStyle(
                                         fontSize:SW * 0.02,
                                         color: Colors.white60,
                                       ),
                                       maxLines: 4,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ) ,
                               )


                           ),
                           Flexible(
                             flex: 5,
                             child:Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Stack(
                                   children: [
                                     FractionallySizedBox(
                                         heightFactor:1,widthFactor: 1,
                                         child:ClipRRect (
                                           borderRadius: BorderRadius.circular(10),
                                           child:  Image.asset(
                                             'assets/cafe.png',
                                             fit: BoxFit.cover,

                                           ),
                                         )
                                     ),

                                   ]
                               ),
                             ),
                           )
                         ],
                       ),


                     )



                 ),
               ),
               Padding(
                 padding: const EdgeInsets.fromLTRB(20.0,13,20,0),
                 child: Card(
                     elevation: 8, // Card elevation
                     color: Colors.white.withOpacity(0.4),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(16.0),
                     ),
                     child:
                     SizedBox(
                       height: SW * 0.3,

                       child: Row(
                         children: [
                           Flexible(
                               flex: 6,
                               child:Padding(
                                 padding: EdgeInsets.fromLTRB(17,20,5,7),
                                 child:Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text("Hot Tea",
                                       style: TextStyle(
                                         fontSize: SW*0.04,
                                         color: Colors.white70,
                                       ),
                                     ),
                                     Text("4.5 ",
                                       style: TextStyle(
                                         fontSize: SW * 0.02,
                                         color: Colors.white70,
                                       ),
                                     ),
                                     SizedBox(height: 2),
                                     Text(
                                       'Rise and grind, its coffee time! Life begins after coffee.Just brewed happiness in a cup',
                                       style: TextStyle(
                                         fontSize:SW * 0.02,
                                         color: Colors.white60,
                                       ),
                                       maxLines: 4,
                                       overflow: TextOverflow.ellipsis,
                                     ),
                                   ],
                                 ) ,
                               )


                           ),
                           Flexible(
                             flex: 5,
                             child:Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Stack(
                                   children: [
                                     FractionallySizedBox(
                                         heightFactor:1,widthFactor: 1,
                                         child:ClipRRect (
                                           borderRadius: BorderRadius.circular(10),
                                           child:  Image.asset(
                                             'assets/cafe.png',
                                             fit: BoxFit.cover,

                                           ),
                                         )
                                     ),

                                   ]
                               ),
                             ),
                           )
                         ],
                       ),


                     )



                 ),
               ),


             ],


           ),

       );
  }
}

