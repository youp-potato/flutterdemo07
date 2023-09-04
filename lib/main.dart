import 'package:flutter/material.dart';
import './pages/tabs.dart';
import './pages/news.dart';
import './pages/form.dart';
import './pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //1、配置路由
  final Map routes = {
    "/":(context) => const Tabs(),
    "/news":(context) => const NewsPage(aid: 12),
    "/search":(context) => const SearchPage(),
    "/form":(context) => const FormPage()
  };

  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:const Tabs() ,
      initialRoute: "/",

      //2、配置onGenerateRoute 固定写法
      onGenerateRoute: (RouteSettings settings){
        final String? name = settings.name;
        final Function? pageContentBuilder = routes[name];
        if(pageContentBuilder != null){
          if(settings.arguments != null){
            final Route route = MaterialPageRoute(
                builder: (context) =>
                    pageContentBuilder(context,arguments: settings.arguments));
            return route;
          }else{
            final Route route = MaterialPageRoute(builder: (context) => pageContentBuilder(context));
            return route;
          }
        }
      },
    );
  }
}
