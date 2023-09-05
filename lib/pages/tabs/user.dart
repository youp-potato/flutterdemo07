import 'package:flutter/material.dart';
import 'package:flutterdemo07/pages/form.dart';
import '../news.dart';


class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/login");
            }, child: const Text("登录")),
            ElevatedButton(onPressed: (){
              Navigator.pushNamed(context, "/registerFirst");
            }, child: const Text("注册")),
          ],
        ),
    );
  }
}
