import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../data/models/product_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}


class _ListScreenState extends State<ListScreen> {

  List <ProductData> myList = [];
  Future<List <ProductData>> getData() async{
    final res =
    await http.get(Uri.parse('https://dummyjson.com/products'));
    List<ProductData> dataA =[];

    {
    Map<String,dynamic> responseData = jsonDecode(res.body);
    for (var item in  responseData   ['products']){
      dataA.add(ProductData.fromJson(item));
      }
    }
    return dataA;
  }
  @override
  void initState()
  {
    super.initState();
    Future.delayed(
      Duration.zero,
          ()async{
        var data = await getData();

        setState(() {
          myList = data ;
          isLoading = false;
        });

          },
    );



  }
  bool isLoading = true ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F8),
      appBar: AppBar(
        title:SvgPicture.network('images/icon1.svg'),
        leading: SvgPicture.network('images/icon1.svg'),


        backgroundColor: const Color(0xFF252837 ),

      ),
      body: isLoading ? const Center(
        child: CircularProgressIndicator(),
    ) :
      SafeArea(
        child: GridView.builder(
          itemCount: myList.length,
          itemBuilder: (context, index){
            return Container(
              height: MediaQuery.of(context).size.height *0.2,
             width: MediaQuery.of(context).size.width *0.4,
              decoration:  BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(myList[index].images,
                        fit: BoxFit.fill,).image
                  )
              ),
              alignment:Alignment.bottomCenter ,


              margin: const EdgeInsets.all(10),
              child: Container(
                height: 50,
                width: double.infinity,

                decoration: const BoxDecoration(
                  color:Color(0xFF252837 ) ,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight:Radius.circular(30),
                )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                  Expanded(
                    child:   Text(
                  myList[index].name
             ,  style: const TextStyle(fontSize: 15,color:
                  Colors.white,fontWeight: FontWeight.bold),
                      overflow: TextOverflow.fade,
                  ),
                  ),
                 Expanded(child:
                    Text(
                    '${myList[index].price.toString()}\$',
                    style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,fontWeight: FontWeight.bold
                    ),
                    ),
                 )


                  ],
                ),
              ),
            );
          }, gridDelegate: const
        SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        ),
      )





    );
  }
}





