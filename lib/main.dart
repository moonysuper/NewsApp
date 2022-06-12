
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/shared/bloc_observe.dart';

import 'layout/news_layout.dart';
import 'network/remote/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? themesa = CacheHelper.getData(key: 'isDark');
  if(themesa == null)
    {
      themesa = false;
    }
  runApp(MyApp(themesa));
}

class MyApp extends StatelessWidget {

  late final bool themesa;
  MyApp(this.themesa);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(

      providers: [
        BlocProvider(create:(BuildContext context) => NewCubit()..changerThemeMode(themesa:themesa )..getBusiness(), )
      ],
      child: BlocConsumer<NewCubit,NewStates>(
        listener: (context,state) {},
        builder: (context,state) {
          var cubit = NewCubit.get(context);
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  primarySwatch: Colors.amber,
                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.amber,
                    type: BottomNavigationBarType.fixed,
                  ),
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      titleSpacing: 20,
                      iconTheme: IconThemeData(
                          color: Colors.black
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: Colors.white,
                          statusBarIconBrightness: Brightness.dark
                      )
                  )
              ),
              darkTheme: ThemeData(
                  primarySwatch: Colors.amber,

                  textTheme: TextTheme(
                      bodyText1: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      )
                  ),
                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.amber,
                    backgroundColor: HexColor('333739'),
                    unselectedItemColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                  ),
                  scaffoldBackgroundColor: HexColor('333739'),

                  appBarTheme: AppBarTheme(
                      titleSpacing: 20,
                      iconTheme: IconThemeData(
                          color: Colors.white
                      ),
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      backgroundColor: HexColor('333739'),
                      elevation: 0,
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarColor: HexColor('333739'),
                          statusBarIconBrightness: Brightness.light
                      )
                  )
              ),
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              home: Directionality(textDirection: TextDirection.rtl,
                  child: NewsLayout())
          );

        }
      ),
    );
}
}

