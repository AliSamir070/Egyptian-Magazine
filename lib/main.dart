import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magazine/layout/cubit/cubit.dart';
import 'package:magazine/layout/cubit/states.dart';
import 'package:magazine/layout/magazine_layout.dart';
import 'package:magazine/modules/magazine_link_view/MagazineLinkView.dart';
import 'package:magazine/shared/components/styles.dart';
import 'package:magazine/shared/network/local/prefs_cache_helper.dart';
import 'package:magazine/shared/network/remote/magazine_dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  MagazineDioHelper.init();
  await PrefsCacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>MagazineCubit()..init(),
      child: BlocConsumer<MagazineCubit , MagazineStates>(
        builder: (context , state)=>MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Magazine',
          routes: {
            MagazineLayout.route:(_)=>MagazineLayout(),
            MagazineLinkView.route:(_)=>MagazineLinkView()
          },
          initialRoute: MagazineLayout.route,
          theme: AppStyle.lightTheme,
          darkTheme: AppStyle.darkTheme,
          themeMode: MagazineCubit.get(context).mode,
        ),
        listener: (context , state){},
      ),
    );
  }
}


