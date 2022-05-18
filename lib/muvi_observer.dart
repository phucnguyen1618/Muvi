import 'dart:developer';

import 'package:bloc/bloc.dart';

class MuviObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);

    log('Log: ${bloc.runtimeType} $change');
  }
}
