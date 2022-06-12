import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/sciences/Sciences_screen.dart';
import 'package:newsapp/modules/sports/sport_screen.dart';
import 'package:newsapp/modules/technology/tech_screen.dart';
import 'package:newsapp/network/local/cache_helper.dart';
import 'package:newsapp/network/remote/dio_helper.dart';

class NewCubit extends Cubit<NewStates>
{
  NewCubit() : super(NewInitialStates());

  static NewCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;

  List<BottomNavigationBarItem> navItem = [
    BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_basketball),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label: 'Science'),
    BottomNavigationBarItem(icon: Icon(Icons.wb_incandescent_outlined),label: 'Technology'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportScreen(),
    SciencesScreen(),
    TechnologyScreen(),

  ];

  void changer(int index)
  {
    currentindex = index;
    if(index == 1)
      getSports();
    if(index ==2)
      getScience();
    if(index ==3)
      getTechnology();
    emit(NewButtonStates());
  }

  List<dynamic> business = [];

  void getBusiness()
     {
    emit(NewGetBusinessLoadingStates());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'language':'ar',
      'category':'business',
      'apiKey':'9cf46a7a4a084261ad6baaeb6fa78546',
    }).then((value) {
      business = value.data['articles'];

      emit(NewGetBusinessSuccessStates());
    }).catchError((error){
      emit(NewGetBusinessErrorStates(error.toString()));
    });}
  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewGetSportsLoadingStates());

        DioHelper.getData(url: 'v2/top-headlines', query: {
          'language':'ar',
          'category':'sports',
          'apiKey':'9cf46a7a4a084261ad6baaeb6fa78546',
        }).then((value) {
          sports = value.data['articles'];
          print(sports[0]['title']);
          emit(NewGetSportsSuccessStates());
        }).catchError((error){
          emit(NewGetSportsErrorStates(error.toString()));
        });

          emit(NewGetSportsSuccessStates());

    }
  List<dynamic> science = [];

  void getScience()
  {
    emit(NewGetScienceLoadingStates());

        DioHelper.getData(url: 'v2/top-headlines', query: {
          'language':'ar',
          'category':'science',
          'apiKey':'9cf46a7a4a084261ad6baaeb6fa78546',
        }).then((value) {
          science = value.data['articles'];
          print(science[0]['title']);
          emit(NewGetScienceSuccessStates());
        }).catchError((error){
          emit(NewGetScienceErrorStates(error.toString()));
        });

          emit(NewGetScienceSuccessStates());

  }
  List<dynamic> Technology = [];

  void getTechnology()
  {
    emit(NewGetTechnologyLoadingStates());

    DioHelper.getData(url: 'v2/top-headlines', query: {
      'language':'ar',
      'category':'technology',
      'apiKey':'9cf46a7a4a084261ad6baaeb6fa78546',
    }).then((value) {
      Technology = value.data['articles'];
      print(Technology[0]['title']);
      emit(NewGetTechnologySuccessStates());
    }).catchError((error){
      emit(NewGetTechnologyErrorStates(error.toString()));
    });

    emit(NewGetTechnologySuccessStates());

  }
  bool isDark = false;

  void changerThemeMode({
  bool? themesa,
})
  {
    if(themesa != null)
      isDark = themesa;
    else
    isDark = !isDark;
    CacheHelper.putData(key: 'isDark', value: isDark).then((value) {
      emit(NewChangerThemeModeStates());
    });


  }
  List<dynamic> Search = [];

  void getSearch(String value)
  {
    emit(NewGetSearchLoadingStates());

    DioHelper.getData(url: 'v2/everything', query: {
      'q':'$value',
      'apiKey':'9cf46a7a4a084261ad6baaeb6fa78546',
    }).then((value) {
      Search = value.data['articles'];
      print(Search[0]['title']);
      emit(NewGetSearchSuccessStates());
    }).catchError((error){
      emit(NewGetSearchErrorStates(error.toString()));
    });

    emit(NewGetSearchSuccessStates());

  }
}