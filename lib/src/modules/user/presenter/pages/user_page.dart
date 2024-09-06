import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_signin/src/modules/user/presenter/store/user_store.dart';
import 'package:window_manager/window_manager.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> with WindowListener {
  late final UserStore userStore;

  @override
  void initState() {
    windowManager.addListener(this);
    userStore = context.read<UserStore>();
    Modular.to.navigate('/task_module/');
    // userStore.changeRoute('Task', 'task_module');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Column(
        children: [RouterOutlet()],
      ),
    );
  }
}
