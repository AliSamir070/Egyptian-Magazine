import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/cubit/cubit.dart';
import '../../layout/cubit/states.dart';
import '../../shared/components/components.dart';

class ScienceModule extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MagazineCubit, MagazineStates>(
      builder: (context, state) {
        var list = MagazineCubit.get(context).scienceNewsList;
        return list.length > 0
            ? ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => MagazineItem(list[index]),
            separatorBuilder: (context, index) => DividerWidget(),
            itemCount: MagazineCubit.get(context).scienceNewsList.length)
            : Center(
          child: CircularProgressIndicator(),
        );
      },
      listener: (context, state) {},
    );
  }
}
