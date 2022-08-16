import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/layout/cubit/cubit.dart';
import 'package:magazine/layout/cubit/states.dart';
import 'package:magazine/modules/search/magazine_search_delegate.dart';

class MagazineLayout extends StatelessWidget {
  static String route = "Magazine_layout_screen";
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MagazineCubit , MagazineStates>(
      builder: (context,state){
        MagazineCubit magazineCubit = MagazineCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
                'News App'
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    showSearch(context: context, delegate: MagazineSearchDelegate());
                  },
                  icon: Icon(
                    Icons.search
                  )
              ),
              IconButton(
                  onPressed: (){
                    MagazineCubit.get(context).setThemeMode();
                  },
                  icon: Icon(
                    Icons.brightness_2_rounded
                  )
              )
            ],
          ),
          body: magazineCubit.screens[magazineCubit.currentIndex],
          bottomNavigationBar: ConvexAppBar(

              initialActiveIndex: magazineCubit.currentIndex,
              onTap: (value){
                magazineCubit.changeBottomNavIndex(value);
              },
              backgroundColor: Theme.of(context).canvasColor,
              activeColor: Theme.of(context).primaryColor,
              color: Theme.of(context).secondaryHeaderColor,

              items: [
                TabItem(icon: Icon(Icons.business , color: Theme.of(context).secondaryHeaderColor) , title: 'business'),
                TabItem(icon: Icon(Icons.sports , color: Theme.of(context).secondaryHeaderColor) , title: 'sports'),
                TabItem(icon: Icon(Icons.smart_toy_outlined , color: Theme.of(context).secondaryHeaderColor) , title: 'technology'),
                TabItem(icon: Icon(Icons.science , color: Theme.of(context).secondaryHeaderColor) , title: 'science'),

              ]
          ),
        );
      },
      listener:(context,state){

      } ,
    );
  }
}


