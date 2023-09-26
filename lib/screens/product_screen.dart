import 'package:flutter/material.dart';
import 'package:task_2c/data/models/product_model.dart';
class ProductScreen extends StatelessWidget {
  final ProductData dataS ;
  const ProductScreen({super.key, required this.dataS});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          ClipRRect(
            borderRadius:const  BorderRadius.only(
              bottomRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
            ),
            child: Image.network(fit: BoxFit.fill,
              dataS.images,
              height: 300,
              width: double.infinity,

            ),
          ),
          const SizedBox(height: 50,),
          Text(
            dataS.detail,
            textAlign: TextAlign.center,
            style:const TextStyle(
              fontSize: 29



          ),

          ),
           const SizedBox(height: 50,),
          Container(
            width: double.infinity,
            height: 70,
            padding:const EdgeInsets.all(20),
            margin: const  EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(70),

              color:const Color(0xFF252837 ),

            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(

                  child: Text(dataS.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style:const TextStyle(
                      fontSize: 22,
                    color: Colors.white



                  ),),
                ),
               const Expanded(
                  child: Icon(Icons.monetization_on_outlined,color: Colors.white
               ),
                ),
                Expanded(
                  child: Text('price: ${dataS.price.toString()}\$',  style:const TextStyle(
                      fontSize: 22,color: Colors.white



                  ),),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
