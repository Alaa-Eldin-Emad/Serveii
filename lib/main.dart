import 'package:etaproject/signIn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent));

  runApp( MyApp());
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationCubit(),
      child: BlocConsumer<LocationCubit, LocationStates>(
        builder: (context, state) {
          return MaterialApp(
            theme:  ThemeData(
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal,brightness: Brightness.light)),
            darkTheme: ThemeData(drawerTheme: DrawerThemeData(backgroundColor: Color(0xff212a37)),
                bottomSheetTheme: BottomSheetThemeData(backgroundColor: Color(0xff212a37)),
                colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal,brightness:Brightness.dark)),
            themeMode: LocationCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}