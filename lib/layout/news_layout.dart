import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:newsapp/adsmanager.dart';
import 'package:newsapp/cubit/cubit.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/network/remote/dio_helper.dart';


class NewsLayout extends StatelessWidget {
  final _nativeAdController = NativeAdmobController();
  late AdmobBannerSize bannerSize;
  late AdmobInterstitial interstitialAd;
    @override
    Widget build(BuildContext context) {
      return BlocConsumer<NewCubit, NewStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewCubit.get(context);


          return Scaffold(
            appBar: AppBar(
              title: Text("News App"),
              actions: [
                IconButton(onPressed: () {
                  cubit.changerThemeMode();
                }, icon: Icon(Icons.brightness_4_outlined),),
                IconButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => const SearchScreen()),);
                }, icon: Icon(Icons.search),),
              ],
            ),
            body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(

                    height: 50,
                    child: AdmobBanner(
                      adUnitId: AdsManager.bannerAdUnitId2,
                      adSize: AdmobBannerSize.BANNER,
                    ),
             ),

                  Expanded(child: cubit.screens[cubit.currentindex]),
                  Container(
                    height: 50,
                     child: AdmobBanner(
                        adUnitId: AdsManager.bannerAdUnitId,
                        adSize: AdmobBannerSize.BANNER,
                      ),
                  ),



                ]
            ),


            bottomNavigationBar: BottomNavigationBar(
              items: cubit.navItem,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changer(index);
              },
            ),
          );
        },
      );
    }
}