import 'package:bloc/bloc.dart';
import 'package:business_finance_management_apk/simple_bloc_observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: "AIzaSyCcyygf1SHbHSD12RKTuof3cA7X-774Fmk",
      authDomain: "expense-manager-e2760.firebaseapp.com",
      projectId: "expense-manager-e2760",
      storageBucket: "expense-manager-e2760.firebasestorage.app",
      messagingSenderId: "310551871572",
      appId: "1:310551871572:web:11e423b21acdc5288eadc1"));
  }
  else{
    await Firebase.initializeApp();
  }

  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}
