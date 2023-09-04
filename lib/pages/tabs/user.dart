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
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return const FormPage();
            }));
          }, child: const Text("基本路由点击跳转")),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
              return const NewsPage(title:"我爱喝可乐(黑化版)" ,aid: 12,);
            }));
          }, child: const Text("跳转传值")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/news");
          }, child: const Text("命名路由跳转到news")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/search");
          }, child: const Text("命名路由跳转到search"))
        ],
      ),
    );
  }
}
