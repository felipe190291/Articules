import 'package:flutter/material.dart';
import 'package:noticias/services/api_service.dart';
import 'components/customListTile.dart';
import 'model/article_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          tabBarTheme: TabBarTheme(labelColor: Colors.white),
          brightness: Brightness.dark,
          primaryColor: Colors.black87),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List<Tab> tabs = <Tab>[
  Tab(
    text: 'business',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(
        Icons.business,
        color: Colors.black,
      ),
    ),
  ),
  Tab(
    text: 'entertainment',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(Icons.enhance_photo_translate_rounded, color: Colors.black),
    ),
  ),
  Tab(
    text: 'general',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(Icons.gamepad_outlined, color: Colors.black),
    ),
  ),
  Tab(
    text: 'health',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(Icons.health_and_safety, color: Colors.black),
    ),
  ),
  Tab(
      text: 'science',
      icon: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: Icon(Icons.science, color: Colors.black),
      )),
  Tab(
    text: 'sports',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(Icons.sports_basketball_sharp, color: Colors.black),
    ),
  ),
  Tab(
    text: 'technology',
    icon: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 20,
      child: Icon(Icons.computer, color: Colors.black),
    ),
  ),
];

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        // The Builder widget is used to have a different BuildContext to access
        // closest DefaultTabController.
        child: Builder(builder: (BuildContext context) {
          final TabController tabController = DefaultTabController.of(context)!;
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {
              // Your code goes here.
              // To get index of current tab use tabController.index
            }
          });
          return Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                unselectedLabelColor: Colors.white,
                isScrollable: true,
                labelColor: Color.fromARGB(255, 247, 3, 8),
                indicatorColor: Colors.redAccent,
                tabs: tabs,
              ),
            ),

            //Now let's call the APi services with futurebuilder wiget
            body: TabBarView(
              children: tabs.map((Tab tab) {
                return FutureBuilder(
                  future: client.getArticle('${tab.text!}'),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    //let's check if we got a response or not
                    if (snapshot.hasData) {
                      //Now let's make a list of articles
                      List<Article> articles = snapshot.data;
                      return ListView.builder(
                        //Now let's create our custom List tile
                        itemCount: articles.length,
                        itemBuilder: (context, index) =>
                            customListTile(articles[index], context, index + 1),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }).toList(),
            ),
          );
        }));
  }
}
// https://api.flutter.dev/flutter/material/TabController-class.html
