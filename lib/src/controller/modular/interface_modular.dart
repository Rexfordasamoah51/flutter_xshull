import 'package:flutter_modular/flutter_modular.dart';
import 'package:xscholl/src/presentation/interface/home/home_view.dart';
import 'package:xscholl/src/presentation/interface/login/login_view.dart';

class InterfaceModular extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers =>
      [ModularRouter('/', child: (_, args) => LoginView()), ModularRouter('/home', child: (_, args) => HomeView())];

  static Inject get to => Inject<InterfaceModular>.of();
}
