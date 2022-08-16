import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/layout/cubit/cubit.dart';
import 'package:magazine/shared/components/components.dart';

import '../../layout/cubit/states.dart';

class BusinessModule extends StatelessWidget {
  const BusinessModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MagazineCubit, MagazineStates>(
      builder: (context, state) {
        var list = MagazineCubit.get(context).businessNewsList;
        return list.length > 0
            ? ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => MagazineItem(list[index]),
                separatorBuilder: (context, index) => DividerWidget(),
                itemCount: MagazineCubit.get(context).businessNewsList.length)
            : Center(
                child: CircularProgressIndicator(),
              );
      },
      listener: (context, state) {},
    );
  }
}
