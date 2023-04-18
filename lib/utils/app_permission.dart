import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum AppPermissionState {
  notDetermined(0),
  succeed(1),
  rejected(2);

  final int state;
  const AppPermissionState(this.state);
}

class AppPermission extends StatelessWidget {
  const AppPermission({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  static requestForNotificaitonPermission(VoidCallback callback) {}
}
