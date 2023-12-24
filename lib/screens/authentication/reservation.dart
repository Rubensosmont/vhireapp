import 'package:flutter/material.dart';
import 'confirm_reservation.dart';
import 'package:vhireapp/models/vehicles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bike Reservation',
      theme: ThemeData(
        fontFamily: 'Segoe UI',
      ),
      home: ReservationScreen(),
    );
  }
}

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  late DateTime startDate = DateTime.now();
  late DateTime endDate = DateTime.now();

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != startDate) {
      setState(() {
        startDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != endDate) {
      setState(() {
        endDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Vehicle myVehicle = Vehicle(
      id: '',
      agency_id: 'Fate Zero',
      brand: 'Suzuki',
      model: 'SV650X A2',
      type: 'bike',
      price: 40000,
      status: 'free',
      limit_date: null,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        centerTitle: true,
        title: Text(
          'Réservation',
          style: TextStyle(color: Colors.white),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.lightGreenAccent,
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.lightGreenAccent,
          ),
        ],
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
                  myVehicle.brand,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets\images\1140x760_sv650x_2024_studio_1.png',
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
                SizedBox(
                  width: 250,
                  child: TextField(
                    readOnly: true,
                    onTap: () => _selectStartDate(context),
                    decoration: InputDecoration(
                      hintText: startDate != DateTime.now()
                          ? 'Début de location: ${startDate.day}/${startDate.month}/${startDate.year}'
                          : 'Début de location',
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 250,
                  child: TextField(
                    readOnly: true,
                    onTap: () => _selectEndDate(context),
                    decoration: InputDecoration(
                      hintText: endDate != DateTime.now()
                          ? 'Fin de location: ${endDate.day}/${endDate.month}/${endDate.year}'
                          : 'Fin de location',
                      contentPadding: EdgeInsets.all(15),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfirmReservation(
                          startDate: startDate,
                          endDate: endDate,
                          vehicle: myVehicle,
                        ),
                      ),
                    );
                  },
                  child: Text('Réserver'),
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
