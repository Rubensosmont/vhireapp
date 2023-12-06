import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:vhireapp/shared/firebase_options.dart';
import 'package:vhireapp/models/user.dart';
import 'package:vhireapp/screens/wrapper.dart';
import 'package:vhireapp/services/authentication.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
  return StreamProvider<AuthenticatedUser?>.value(
    initialData: null,
    value: AuthService().user,
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    ),
  );
  }
}

