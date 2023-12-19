

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/vehicles.dart';

class ProductBox extends StatefulWidget {
  const ProductBox({Key? key, required this.vehicle,required this.img}) : super(key: key);

  final Vehicle vehicle;
  final String img;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Color(0xFF419CE1),
                borderRadius: BorderRadius.circular(40.0),
              ),
              width: 320,
              height: 200,
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Color(0x8F57DC90),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 140,
                          height: 110,
                          child: Image.asset(widget.img),
                        ),
                      ),
                      Text(
                        widget.vehicle.price.toString(), // Access vehicle's price
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                      Text("Journalier", style: TextStyle(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(115, 10, 0, 0),
                        child: Icon(Icons.location_on_sharp, color: Colors.white, size: 30),
                      ),
                      Text(widget.vehicle.brand, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Icon(Icons.star, size: 18, color: Colors.amberAccent),
                          Icon(Icons.star, size: 18, color: Colors.amberAccent),
                          Icon(Icons.star, size: 18, color: Colors.amberAccent),
                          Icon(Icons.star, size: 18, color: Colors.amberAccent),
                          Icon(Icons.star_border_outlined, size: 18, color: Colors.amberAccent),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(5, 70, 0, 0),
                        child: Row(
                          children: [
                            Text("Voir plus", style: TextStyle(fontSize: 25, color: Colors.white)),
                            IconButton(
                              onPressed: null,
                              icon: Icon(Icons.arrow_forward, color: Colors.white, size: 30),
                              alignment: Alignment.bottomRight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  Vehicle vehicle1 = Vehicle(
    id: "abc123",
    agency_id: "xyz456",
    brand: "TOYOTA",
    model: "Camry",
    type: "moto",
    price: 40000,
    status: "Available",
  );
  Vehicle vehicle2 = Vehicle(
    id: "abc173",
    agency_id: "xyz556",
    brand: "SUZUKI",
    model: "Camry",
    type: "moto",
    price: 40000,
    status: "Available",
  );
  Vehicle vehicle3 = Vehicle(
    id: "abc773",
    agency_id: "xyz956",
    brand: "PEUGEOT",
    model: "Camry",
    type: "moto",
    price: 40000,
    status: "Available",
  );



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
     backgroundColor: Color(0xFF5371E9),
        title:Text("Catalogue",style: TextStyle(),),
        centerTitle: true,
        actions: const [
          IconButton(onPressed: null, icon: Icon(Icons.add_alert, color:Color(0xFF57DC90),)),

        ],
      ),
      drawer: Drawer(
        surfaceTintColor:Color(0xFF57DC90) ,
          backgroundColor: Color(0xFFF5E0C3),
          child: ListView(
            children: <Widget>[
              DrawerHeader(decoration: BoxDecoration(color:Color(0xFF5371E9),
              ),
                child: Text("user",style:TextStyle(color: Colors.white,fontSize: 20,
                ),
                ),
              ),
              ListTile(leading: Icon(Icons.message),
                title: Text('Messages'),
              ),
              ListTile(leading: Icon(Icons.person),
                title: Text('Profile'),
              ),

              ListTile(leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],

          )

      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 60.0),
            child: Column(
              children: [

                Image.asset("assets/images/scooter.png",scale: 8,),

                    Padding(padding: EdgeInsets.fromLTRB(70,10,0,0),
                      child:Row(
                        children: [
                          IconButton(onPressed: null, icon: Icon(Icons.arrow_back,color: Colors.black,size: 50,)),
                        Padding(padding: EdgeInsets.fromLTRB(5,10,0,0),
                          child:
                        Text(vehicle1.type,style: TextStyle(fontSize: 25),),
                        ),
                        ],
                      )
                    ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(70,10,0,0),
                      child:  Container(
                        padding:  EdgeInsets.zero,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey, // Set the border color
                            width: 2.0, // Set the border width
                          ),

                          borderRadius: BorderRadius.circular(50.0), // Set the border radius
                        ),
                        width: 195,
                        height: 50,
                        child: SearchBar(
                          elevation: MaterialStateProperty.all(0.0),
                          hintText: "Rechercher par marque",
                          hintStyle: MaterialStateProperty.all(TextStyle(color: Colors.grey)),

                          constraints: BoxConstraints.tight(Size(190,50)),
                          trailing: <Widget>[
                            IconButton(
                              onPressed: null,
                              icon: const Icon(Icons.search,color: Color(0xFF57DC90),),

                            ),
                          ],
                        ),
                      )


                    ),
                    Padding(padding: EdgeInsets.fromLTRB(10,10,0,0),
                 child: Container(
                   padding:  EdgeInsets.zero,
                   decoration: BoxDecoration(
                     border: Border.all(
                       color: Color(0xFF000000), // Set the border color
                       width: 2.0, // Set the border width
                     ),

                     borderRadius: BorderRadius.circular(50.0), // Set the border radius
                   ),
                   width: 30,
                   height: 30,
                   child: Icon(Icons.filter_list),
                 )


                    ),

                  ],
                ),
                ProductBox(vehicle: vehicle1, img: "assets/images/suzuki.png"),
                ProductBox(vehicle: vehicle2, img: "assets/images/suzuki.png"),
                ProductBox(vehicle: vehicle3, img: "assets/images/suzuki.png"),
                ProductBox(vehicle: vehicle2, img: "assets/images/suzuki.png"),





              ],

            ),

          ),
        ),
      )
    );
  }
}
