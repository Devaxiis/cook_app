import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:retsept/src/presentation/bloc/create_cook/create_cook_bloc.dart';
import 'package:retsept/src/presentation/ui/main_home_screen.dart';

import 'src/presentation/bloc/read_cook/read_cook_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateCookBloc>(create: (context) => CreateCookBloc()),
        BlocProvider<ReadCookBloc>(create: (context) => ReadCookBloc()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const MainHomeScreen(),
      ),
    );
  }
}
