import 'package:flutter/material.dart';
import '../../tools/keepAliveWrapper.dart';
import '../news.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 9, vsync: this);
    //监听_tabController的改变事件
    _tabController.addListener(() {
      // print(_tabController.index);    //获取两次索引值
      if(_tabController.animation!.value == _tabController.index) {
        print(_tabController.index);    //获取点击或滑动页面的索引值
      }
    });


    //组件销毁时触发
    @override
    void dispose(){
      super.dispose();
      _tabController.dispose();
    }


  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/form",arguments: {
              "title": "我是命名路由传值-form",
              "aid": 20
            });
          }, child: const Text("命名路由传值-form")),
          ElevatedButton(onPressed: (){
            Navigator.pushNamed(context, "/shop",arguments: {
              "title": "我是命名路由传值-shop",
              "aid": 21
            });
          }, child: const Text("命名路由传值-shop")),
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
    // return Scaffold(
    //   appBar: PreferredSize(
    //     //可以配置AppBar的高度
    //     preferredSize: const Size.fromHeight(40),
    //     child: AppBar(
    //
    //         elevation: 1,
    //         backgroundColor: Colors.white,
    //         title: SizedBox(
    //           height: 30,
    //           child: TabBar(
    //             isScrollable: true,
    //             indicatorColor: Colors.red, //底部指示器的颜色
    //             labelColor: Colors.red, //配置label的颜色
    //             unselectedLabelColor: Colors.black, //未选中的label的颜色
    //             indicatorSize: TabBarIndicatorSize.label,
    //             controller: _tabController,
    //             onTap: (index){ //只能监听点击事件 无法监听滑动事件
    //               print(index);
    //             },
    //             tabs: const [
    //               Tab(
    //                 child: Text("关注"),
    //               ),
    //               Tab(
    //                 child: Text("热门"),
    //               ),
    //               Tab(
    //                 child: Text("篮球"),
    //               ),
    //               Tab(
    //                 child: Text("游戏"),
    //               ),
    //               Tab(
    //                 child: Text("娱乐"),
    //               ),
    //               Tab(
    //                 child: Text("运动"),
    //               ),
    //               Tab(
    //                 child: Text("科技"),
    //               ),
    //               Tab(
    //                 child: Text("学习"),
    //               ),
    //               Tab(
    //                 child: Text("生活"),
    //               ),
    //             ],
    //           ),
    //         )),
    //   ),
    //   body: TabBarView(
    //     controller: _tabController,
    //     children: [
    //       KeepAliveWrapper(     //自定义的缓存组件，切换label之后返回 页面定位还是在切换前的位置
    //         child: ListView(
    //           children: const [
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注"),
    //             ),
    //             ListTile(
    //               title: Text("关注啊放了可能离开你"),
    //             ),
    //             ListTile(
    //               title: Text("关注在国内李宁放弃"),
    //             ),
    //             ListTile(
    //               title: Text("关注啊放哪里放呢"),
    //             ),
    //             ListTile(
    //               title: Text("关注这几年就放呢"),
    //             ),
    //             ListTile(
    //               title: Text("关注阿瑟费拉开烦恼"),
    //             ),
    //             ListTile(
    //               title: Text("关注阿里就放哪里放呢"),
    //             ),
    //             ListTile(
    //               title: Text("关注111"),
    //             ),
    //             ListTile(
    //               title: Text("我是关注"),
    //             ),
    //           ],
    //         ),
    //       ),
    //       const Text("热门"),
    //       const Text("篮球"),
    //       const Text("游戏"),
    //       const Text("娱乐"),
    //       const Text("运动"),
    //       const Text("科技"),
    //       const Text("学习"),
    //       const Text("生活"),
    //     ],
    //   ),
    // );
  }
}
