import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';



enum AppPermissionState {
  
  final int state;
  const AppPermissionState(this.state);

  notDetermined(0),
  succeed(1),
  rejected(2),
}

class AppPermission extends StatelessWidget {
  const AppPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static requestForNotificaitonPermission(VoidCallback callback) {

  }
}