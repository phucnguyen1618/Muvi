import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:Muvi/di.dart';
import 'package:Muvi/muvi_observer.dart';

import 'app.dart';

void main() async {
  await DependencyInjection.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: MuviObserver(),
  );
}
