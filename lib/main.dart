import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
    routes: <String, WidgetBuilder>{
      "/SecondPage": (BuildContext context) => SecondPage()
    },
  ));
}

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.deepOrange),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite, color: Colors.redAccent),
                iconSize: 70.0,
                onPressed: (){Navigator.of(context).pushNamed("/SecondPage");},
              ),
              Text("Home")
            ],
          ),
        ),
      ));

  }
}

class SecondPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Albums"),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this would produce 2 rows.
          crossAxisCount: 3,
          // Generate 100 Widgets that display their index in the List
          children: List.generate(100, (index) {
            return GestureDetector(
              onTap: () {
                  print("onTap called. $index");
                      },
                          child: Card(
                  // child: Text(
                  //   'Sauce $index',
                  //   style: Theme.of(context).textTheme.headline,
                  // ),
                  child: Image.network('http://wethesauce.com/wp-content/uploads/2019/01/01-Alley-Boy-Intro-mp3-image.jpg'),
              ),
            );
          }),
        ),
      );
    

  }
}
