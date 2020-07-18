import 'package:flutter/material.dart';
import 'material_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Icons',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isListView = false;
  Color listColor = Color(0xff006a71);
  Color gridColor = Color(0xffe8505b);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Icons",
        ),
      ),
      body: isListView
          ? ListView.builder(
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 60.0,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  decoration: BoxDecoration(
                    color: listColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        icons[index].icon,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      Text(
                        icons[index].name,
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ],
                  ),
                );
              },
            )
          : GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0),
              itemCount: icons.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: gridColor,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Tooltip(
                    preferBelow: false,
                    message: icons[index].name,
                    child: Icon(
                      icons[index].icon,
                      size: 30.0,
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: isListView ? gridColor : listColor,
        onPressed: () {
          setState(() {
            isListView = !isListView;
          });
        },
        child: Icon(
          Icons.all_inclusive,
        ),
      ),
    );
  }
}
