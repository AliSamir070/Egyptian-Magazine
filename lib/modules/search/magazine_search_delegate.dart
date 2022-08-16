import 'package:flutter/material.dart';

import '../../layout/cubit/cubit.dart';
import '../../shared/components/components.dart';

class MagazineSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    print('actions');
    return [
      IconButton(
          onPressed:(){
            query='';
          }, 
          icon: Icon(
              Icons.clear
          )
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    print('leading');
    return IconButton(
        onPressed:(){
          close(context, null);
        },
        icon: Icon(
            Icons.arrow_back
        )
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if(MagazineCubit.get(context).searchList.isEmpty){
      MagazineCubit.get(context).getSearch(query);
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => MagazineItem(MagazineCubit.get(context).searchList[index]),
          separatorBuilder: (context, index) => DividerWidget(),
          itemCount: MagazineCubit.get(context).searchList.length);
    }else{
      print("Empty");
      List<dynamic> tempList = MagazineCubit.get(context).searchList;
      MagazineCubit.get(context).searchList = [];
      return ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => MagazineItem(tempList[index]),
          separatorBuilder: (context, index) => DividerWidget(),
          itemCount: tempList.length);
    }
    print('results');

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    print('suggestions');
    //MagazineCubit.get(context).getSearch(query);
    return Container();
  }

}