import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/layout/cubit/states.dart';
import 'package:magazine/modules/business/business_module.dart';
import 'package:magazine/modules/science/science_module.dart';
import 'package:magazine/modules/sports/sports_module.dart';
import 'package:magazine/modules/technology/technology_module.dart';
import 'package:magazine/shared/components/constants.dart';
import 'package:magazine/shared/components/secured.dart';
import 'package:magazine/shared/network/local/prefs_cache_helper.dart';
import 'package:magazine/shared/network/remote/magazine_dio_helper.dart';

class MagazineCubit extends Cubit<MagazineStates>{
  MagazineCubit():super(MagazineInitialState());
  static MagazineCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [BusinessModule() , SportsModule() , TechnologyModule(),ScienceModule()];
  List<String> screensTitles = ["Business" , "Sports" , "Technology" , "Science"];
  void changeBottomNavIndex(int newIndex){
    currentIndex=newIndex;
    emit(MagazineBottomNavState());
  }
  ThemeMode mode = ThemeMode.light;
  void initializeThemeMode(){
    if(PrefsCacheHelper.getMode()){
      mode=ThemeMode.dark;
      print('dark mode');
    }else{
      mode=ThemeMode.light;
      print('light');
    }
    print(PrefsCacheHelper.getMode());
    emit(ChangeThemeModeState());
  }
  void setThemeMode(){
    if(mode==ThemeMode.light){
      mode = ThemeMode.dark;
      PrefsCacheHelper.putMode(true).then((value){
        emit(ChangeThemeModeState());
      });
    }else{
      mode = ThemeMode.light;
      PrefsCacheHelper.putMode(false).then((value){
        emit(ChangeThemeModeState());
      });
    }

  }
  void init(){
    initializeThemeMode();
    getBusiness();
    getSports();
    getTechnology();
    getScience();
  }
  List<dynamic> businessNewsList = [];
  List<dynamic> sportsNewsList = [];
  List<dynamic> technologyNewsList = [];
  List<dynamic> scienceNewsList = [];
  List<dynamic> searchList = [];
  void getSearch(String query){
    print("search");
    MagazineDioHelper.getArticles(url: Constants.methodSearchUrl, query: {
      "apiKey":apiKey,
      "q":query
    }).then((value){
      searchList = value.data['articles'];
      print(searchList[0]);
      emit(MagazineSearchState());
    }).catchError((e){
      emit(MagazineSearchErrorState());
      print(e.toString());
    });
  }
  void getBusiness(){
    emit(MagazineGetBusinessLoadingState());
    MagazineDioHelper.getArticles(url: Constants.methodUrl, query: {
      "apiKey":apiKey,
      "category":"business",
      "country":"eg"
    }).then((value){
      businessNewsList = value.data['articles'];
      print(businessNewsList.length);
      emit(MagazineGetBusinessState());
    }).catchError((e){
      emit(MagazineGetBusinessErrorState());
      print(e.toString());
    });
  }
  void getSports(){
    emit(MagazineGetSportsLoadingState());
    MagazineDioHelper.getArticles(url: Constants.methodUrl, query: {
      "apiKey":apiKey,
      "category":"sports",
      "country":"eg"
    }).then((value){
      sportsNewsList = value.data['articles'];
      emit(MagazineGetSportsState());
    }).catchError((e){
      emit(MagazineGetSportsErrorState());
      print(e.toString());
    });
  }
  void getTechnology(){
    emit(MagazineGetTechnologyLoadingState());
    MagazineDioHelper.getArticles(url: Constants.methodUrl, query: {
      "apiKey":apiKey,
      "category":"technology",
      "country":"eg"
    }).then((value){
      technologyNewsList = value.data['articles'];
      emit(MagazineGetTechnologyState());
    }).catchError((e){
      emit(MagazineGetTechnologyErrorState());
      print(e.toString());
    });
  }
  void getScience(){
    emit(MagazineGetScienceLoadingState());
    MagazineDioHelper.getArticles(url: Constants.methodUrl, query: {
      "apiKey":apiKey,
      "category":"science",
      "country":"eg"
    }).then((value){
      scienceNewsList = value.data['articles'];
      emit(MagazineGetScienceState());
    }).catchError((e){
      emit(MagazineGetScienceErrorState());
      print(e.toString());
    });
  }
}