import 'package:flutter/material.dart';
import 'package:vhireapp/models/reservation.dart';
import 'package:vhireapp/models/vehicle.dart';

class ConfirmReservation extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Vehicle vehicle;
  final Reservation reservation;

  ConfirmReservation({super.key,
    required this.startDate,
    required this.endDate,
    required this.vehicle,
    required this.reservation
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text(
          'Confirmation de Réservation',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: Colors.grey[800],
        child: Center(
          child: Container(
            width: 300,
            height: 600,
            padding: EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  vehicle.brand,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Image.network(
                  "assets/images/suzuki.png",
                  height: 150,
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                  ],
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '40 000 FCFA ',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Journalier',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Durée maximale de ',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: '15 jours',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Début de location: ${startDate.day}/${startDate.month}/${startDate.year}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 10),
                Text(
                  'Fin de location: ${endDate.day}/${endDate.month}/${endDate.year}',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //ajoutez la page vers laquelle le truc doit pointer
                  },
                  child: Text('Confirmer la réservation'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightGreenAccent,
                    onPrimary: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
                Text(
                  'Géolocalisation',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.comment,
                  color: Colors.green,
                ),
                Text(
                  'Avis et Commentaires',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
