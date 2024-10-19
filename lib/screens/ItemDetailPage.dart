import 'package:flutter/material.dart';

class ItemDetailPage extends StatefulWidget {
  final String itemName;
  final String itemImage;

  const ItemDetailPage({super.key, required this.itemName, required this.itemImage,  });

  @override
  State<ItemDetailPage> createState() => _ItemDetailPageState();

}


class _ItemDetailPageState extends State<ItemDetailPage> {

  @override
  Widget build(BuildContext context) {
    double SW = MediaQuery.of(context).size.width;
    double SH= MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.itemName),
      ),
      body:
       ListView(
         children: [ Padding(
           padding: const EdgeInsets.all(16.0),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               ClipRRect(
                 borderRadius: BorderRadius.circular(12.0),
                 child: Image.asset(
                   'assets/${widget.itemImage}',
                   height: 300,
                   width: 300,
                   fit: BoxFit.cover,
                 ),
               ),
               SizedBox(height: 20),
               Text(
                 widget.itemName,
                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold,color: Colors.white60),
               ),
               SizedBox(height: 16),
               Text(
                 'Nice ${widget.itemName}, perfect for you!',
                 style: TextStyle(fontSize: 18,color: Colors.white60),
                 textAlign: TextAlign.center,
               ),
             ],
           ),
         ),],
       )

    );
  }}