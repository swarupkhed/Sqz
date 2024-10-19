

import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sqz/screens/Home.dart';

class Login extends StatefulWidget{
  const Login({super.key});



  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _namecontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double SW = MediaQuery.of(context).size.width;
   double SH= MediaQuery.of(context).size.height;
    //     // Calculate 80% of the width
   double desiredWidth = SW * 0.85;
    double desiredHeight = SH * 0.8;

    return  Scaffold(



          body:
           SingleChildScrollView(

             child:Container(

              height: max(SH, 710) ,

               child: Stack(
                 children: [
                   Container(
                     width:SW,
                   height: max(SH , 710) ,

                     decoration: const BoxDecoration(
                       color: Colors.red,

                     ),
                     child: const Image(image: AssetImage('assets/bgcf.jpg'),fit: BoxFit.cover,),
                   ),


                   Center(
                       child:  BackdropFilter(
                         filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                         child: ConstrainedBox(
                           constraints:  const BoxConstraints(
                             minWidth: 0,
                             maxWidth: 800,
                             minHeight: 610,//620
                             maxHeight: 900,
                           ),
                           child:  Container(
                             width: desiredWidth,
                             height: desiredHeight,

                             decoration: BoxDecoration(
                               color: Colors.white.withOpacity(0.2),
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(
                                 color: Colors.white.withOpacity(0.2),
                               ),
                             ),
                             child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.center,
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Image.asset('assets/cup.png',width: SW * 0.2,height:SW>=400?80:(SH*0.1),),
                                    Text("Swift",style: TextStyle(fontSize: SW>=400?80:60,height: 1,color: Colors.white)),
                                     Text("Cafe",style: TextStyle(fontSize: SW>=400?30:20,height: 0.4,color: Colors.white)),
                                   const Text("Latte but never late",style: TextStyle(fontSize: 17,height: 3,color: Colors.white60)),
                                   SizedBox(height:SH>=900?130:max(46,SH * 0.07 )),//46 //0.07
                                   Container(

                                     width: min(400, SW * 0.7),
                                     child: TextField(
                                       controller: _namecontroller,
                                       cursorColor: Colors.white,
                                       decoration: const InputDecoration(
                                         hintText: 'User Name ',
                                         hintStyle: TextStyle(color: Colors.white70),
                                         enabledBorder: UnderlineInputBorder(
                                           borderSide: BorderSide(color:Colors.white60),
                                         ),
                                         focusedBorder: UnderlineInputBorder(
                                           borderSide: BorderSide(color: Colors.lightBlue),
                                         ),

                                       ),
                                       style: TextStyle(color: Colors.white),
                                     ) ,
                                   ),
                                   SizedBox(height: SH>=900?50:max(20,SH * 0.03)),//30 // 0.04
                                   Container(
                                     width: min(400, SW * 0.7),
                                     child: TextField(
                                       controller: _passwordcontroller,
                                       cursorColor: Colors.white,
                                       obscureText: _obscureText,
                                       decoration: InputDecoration(
                                         hintText: 'Password ',

                                         hintStyle: const TextStyle(color: Colors.white70),
                                         enabledBorder: const UnderlineInputBorder(
                                           borderSide: BorderSide(color:Colors.white60),
                                         ),
                                         focusedBorder: const UnderlineInputBorder(
                                           borderSide: BorderSide(color: Colors.lightBlue),
                                         ),
                                         suffixIcon: IconButton(
                                           color: Colors.white60,
                                           icon: Icon(
                                             _obscureText ? Icons.visibility : Icons.visibility_off,
                                           ),
                                           onPressed: () {
                                             setState(() {
                                               _obscureText = !_obscureText;
                                             });
                                           },
                                         ),
                                       ),
                                       style: const TextStyle(color: Colors.white),
                                     ) ,
                                   ),
                                   SizedBox(height:SH>=900?90:max(40,SH * 0.06 )),//60 // 0.08

                                Container(
                                 width: 200, // Set the width as needed
                                 height: 50, // Set the height as needed
                                 decoration: BoxDecoration(
                                   gradient: const LinearGradient(
                                     colors: [Colors.blueAccent, Colors.white],
                                     begin: Alignment.centerLeft,
                                     end: Alignment.centerRight,
                                   ),
                                   borderRadius: BorderRadius.circular(30),
                                   boxShadow: const [
                                     BoxShadow(
                                       color: Colors.black26,
                                       offset: Offset(0, 6),
                                       blurRadius: 5,
                                     ),
                                   ],
                                 ),
                                 child: ElevatedButton(
                                   onPressed: () {
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   Home() ));
                                   },
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: Colors.transparent,
                                     shadowColor: Colors.transparent,
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(30),
                                     ),

                                   ),
                                   child: const Text(
                                     'Login',
                                     style: TextStyle(
                                       color: Colors.white,
                                       fontSize: 18,
                                       fontWeight: FontWeight.bold,
                                     ),
                                   ),

                                 ),
                                ),

                                 SizedBox(height: SH>=900?16:max(13, SH * 0.02)),//17 // 0.03
                                   Container(
                                     width: 200,
                                     height: 50,
                                     child: ElevatedButton(
                                       onPressed: () {
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>   Home() ));
                                       },

                                       style: ElevatedButton.styleFrom(
                                         backgroundColor: Colors.transparent,
                                         shadowColor: Colors.transparent,
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(30),
                                         ),
                                         side: const BorderSide(
                                           color: Colors.white70,
                                           width: 2,
                                         ),
                                       ),
                                       child: const Text(
                                         'Sign Up',
                                         style: TextStyle(
                                           color: Colors.white,
                                           fontSize: 18,
                                           fontWeight: FontWeight.bold,
                                         ),
                                       ),

                                     ),
                                   ),
                                   SizedBox(height: max(10,SH * 0.03) ),//0.05, 30
                                   RichText(


                                     text: TextSpan(
                                       text: 'Privacy Policy',
                                       style: const TextStyle(color: Colors.white, fontSize: 13),
                                       recognizer: TapGestureRecognizer()
                                         ..onTap = () {

                                         },
                                     ),
                                   ),
                                   SizedBox(height: 10),






                                 ]
                             ),
                           ),
                         ),
                       )

                   ),

                 ],

               ),
             )

           )
         );
  }
}