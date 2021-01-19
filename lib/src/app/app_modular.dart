import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:xscholl/src/controller/modular/interface_modular.dart';

import 'application.dart';

class AppModular extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  Widget get bootstrap => Application();

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', module: InterfaceModular())];
}
