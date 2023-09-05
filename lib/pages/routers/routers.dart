import 'package:flutter/material.dart';
import 'package:flutterdemo07/pages/shop.dart';
import 'package:flutterdemo07/pages/tabs.dart';
import 'package:flutterdemo07/pages/news.dart';
import 'package:flutterdemo07/pages/form.dart';
import 'package:flutterdemo07/pages/search.dart';
import 'package:flutterdemo07/pages/user/login.dart';
import 'package:flutterdemo07/pages/user/registerFirst.dart';
import 'package:flutterdemo07/pages/user/registerSecond.dart';
import 'package:flutterdemo07/pages/user/registerThird.dart';

//1、配置路由
Map routes = {
  "/":(context) => const Tabs(),
  "/news":(context) => const NewsPage(aid: 12),
  "/search":(context) => const SearchPage(),
  "/form":(context,{arguments}) => FormPage(arguments: arguments,),  //命名参数 需要加{}
  "/shop":(context,{arguments}) => ShopPage(arguments: arguments),
  "/login":(context) => const LoginPage(),
  "/registerFirst":(context) => const RegisterFirstPage(),
  "/registerSecond":(context) => const RegisterSecondPage(),
  "/registerThird":(context) => const RegisterThirdPage(),
};


//2、配置onGenerateRoute 固定写法 这个方法相当于一个中间件
var onGenerateRoute = (RouteSettings settings){
  // print(settings);
  // print(settings.name);
  // print(settings.arguments);
  final String? name = settings.name;   // "/news" 、"/form"等配置的路由路径名称
  final Function? pageContentBuilder = routes[name];    //相当于把function赋值给了pageContentBuilder   (context) => const NewsPage(aid: 12),
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
};