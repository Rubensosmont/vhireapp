import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/models/vehicle.dart';
import 'package:vhireapp/screens/home/details/reservation_page.dart';

class ProductStarsRow extends StatelessWidget {

  late final int star;
  final double size;

  ProductStarsRow({super.key, required double note, this.size=18}) {
    star = note.round();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for(int i=0;i<star;i++) Icon(Icons.star, size: size, color: Colors.amberAccent),
        for(int i=star;i<5;i++) Icon(Icons.star_border_outlined, size: size, color: Colors.amberAccent),
      ],
    );
  }
}


class ProductBox extends StatefulWidget {
  ProductBox({Key? key, required this.vehicle, required this.user}) : super(key: key);

  final Vehicle vehicle;
  late AuthenticatedUser user;

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
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: const Color(0xFF419CE1),
                borderRadius: BorderRadius.circular(25.0),
              ),
              width: 320,
              height: 200,
              child: Row(
                children: [

                  // Colonne Image - Prix - Type de payement
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: const Color(0x6057DC90),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          width: 140,
                          height: 110,
                          child: (widget.vehicle.img_url == null) ? Image.asset("assets/images/default.png") :
                          Image.network(widget.vehicle.img_url!, width: 200),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "      ${widget.vehicle.price} FCFA", // Access vehicle's price
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const Text("      Journalier", style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  ),


                  // Colonne Localisation - Nom - Note - Voir plus
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(115, 15, 0, 0),
                        child: Icon(Icons.location_on_sharp, color: Colors.white, size: 25),
                      ),

                      Container(
                        padding: const EdgeInsets.only(top: 10),
                        alignment: Alignment.topCenter,
                        width: 108,
                        height: 50,
                        child: Text("${widget.vehicle.brand} ${widget.vehicle.model}",
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 17),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),

                      ProductStarsRow(note: widget.vehicle.note),

                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ReservationScreen(vehicle: widget.vehicle, user: widget.user)));
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(25, 45, 0, 0),
                          child: Row(
                            children: [
                              Text("Voir plus", style: TextStyle(fontSize: 22, color: Colors.white)),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_forward, color: Colors.white, size: 20),
                            ],
                          ),
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
