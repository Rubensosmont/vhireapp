import 'package:flutter/material.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/models/vehicle.dart';
import 'package:vhireapp/screens/home/home/home_page.dart';
import 'package:vhireapp/shared/loading.dart';

class GetUpdateUserBeforeHome extends StatefulWidget {

  static Map<String, List<Vehicle>> map = {};
  late AuthenticatedUser user;

  GetUpdateUserBeforeHome({super.key, required this.user});

  @override
  State<GetUpdateUserBeforeHome> createState() => _GetUpdateUserBeforeHomeState();
}

class _GetUpdateUserBeforeHomeState extends State<GetUpdateUserBeforeHome> {

  Future initMap() async {
    GetUpdateUserBeforeHome.map["car"] = await Vehicle.getVehiclesByType("car");
    GetUpdateUserBeforeHome.map["bike"] = await Vehicle.getVehiclesByType("bike");
    GetUpdateUserBeforeHome.map["truck"] = await Vehicle.getVehiclesByType("truck");
    GetUpdateUserBeforeHome.map["bus"] = await Vehicle.getVehiclesByType("bus");
  }

  Future getUpdateUser(BuildContext context) async {
    await widget.user.getUpdate();
    await initMap();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => HomePage(user: widget.user, map: GetUpdateUserBeforeHome.map)));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) { getUpdateUser(context); });
  }

  @override
  Widget build(BuildContext context) {
    return const Loading();
  }
}
