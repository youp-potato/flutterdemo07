import 'dart:ffi';

import 'package:flutter/material.dart';

//新闻页面接收上个页面传过来的参数
//如何实现跳转传值
class NewsPage extends StatefulWidget {
  final String title;
  final int aid;
  const NewsPage({super.key,this.title = "新闻",required this.aid});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState(){
    super.initState();
    print(widget.aid);
    print(widget.title);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      },
        child: const Icon(Icons.people),
      ),
      appBar: AppBar(
        title: Text(widget.title),  //  获取NewsPage里面定义的
      ),
      body: const Center(
        child: Text("新闻页面"),
      ),
    );
  }
}
