import 'package:app/src/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app/src/bloc/auth/auth_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/config/.env');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<PositionBloc>(
        //     create: (BuildContext context) => PositionBloc()),
        BlocProvider<AuthBloc>(create: (BuildContext context) => AuthBloc()),
        // BlocProvider<WordBloc>(create: (BuildContext context) => WordBloc()),
        // BlocProvider<ShortBloc>(create: (BuildContext context) => ShortBloc()),
        // BlocProvider<PositionBloc>(
        //     create: (BuildContext context) => PositionBloc()),
        // BlocProvider<RecordBloc>(
        //     create: (BuildContext context) => RecordBloc()),
        // BlocProvider<ChulseokBloc>(
        //     create: (BuildContext context) => ChulseokBloc()),
        // BlocProvider<CountBloc>(create: (BuildContext context) => CountBloc()),
      ],
      child: const Navigation(),
    );
  }
}
