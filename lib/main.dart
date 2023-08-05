// 移入控件
import 'package:flutter/material.dart';

// 入口函数
void main() {
  runApp(const MyApp());
}

// 无状态组件
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 每个项目最外层，必须有MaterialApp
    return MaterialApp(
      title: 'chaochao',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 通过hone指定首页
      home: const MyHomePage(title: 'chaochao wakk'),
    );
  }
}

// 有状态组件
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 在flutter中，每个控件，都是一个类，它可以省略new关键字
    return DefaultTabController(length: 3, child: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
        // 右侧行为按钮
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ]
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello World1234567',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const<Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('26337833054@qq.com'),
              accountName: Text('chaochao'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.jpg'),
                // backgroundImage: NetworkImage('https://images.gitee.com/uploads/91/465191_vsdeveloper.png?1530762316')
              ),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/bg.png'))
              )
            ),
            ListTile(title: Text('用户反馈'), trailing: Icon(Icons.feedback)),
            ListTile(title: Text('系统设置'), trailing: Icon(Icons.settings)),
            ListTile(title: Text('我要发布'), trailing: Icon(Icons.send)),
            // 分割线控件
            Divider(),
            ListTile(title: Text('注销'), trailing: Icon(Icons.exit_to_app))
          ]
        )
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Colors.black),
        height: 50,
        child: const TabBar(
          labelStyle: TextStyle(height: 0, fontSize: 10),
          tabs: <Widget>[
            Tab(icon: Icon(Icons.movie_filter), text: '正在热映'),
            Tab(icon: Icon(Icons.movie_creation), text: '即将上映'),
            Tab(icon: Icon(Icons.local_movies), text: 'Top250'),
          ]
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    )
    );
  }
}
