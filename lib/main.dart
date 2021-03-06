import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appnew/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
        home: homePage() //create new widget class for this 'home' to
      // escape 'No MediaQuery widget found' error
    );
  }
}
class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          //MediaQuery methods in use
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.4,
        )
    );
  }
}
/*
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
/*
Text(
'Hello Everyone!',
style: TextStyle(
fontSize: 30,
fontWeight: FontWeight.bold,
letterSpacing: 1.5,
color: Colors.green[300],
fontFamily: 'IndieFlower',
),
),
*/
/*
Icons.airport_shuttle,
          color: Colors.lightBlue,
          size: 50.0,
 */
/*
void main() => runApp(MaterialApp(
    home: Home(),
));
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My new App'),
        centerTitle: true,
        backgroundColor: Colors.red[600],
      ),
      body: Center(
        child: IconButton(
          onPressed: () {
            print('Yay');
          },
          icon: Icon(Icons.alternate_email),
          color: Colors.amber,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('lick'),
        backgroundColor: Colors.grey[350],
      ),
    );
  }
}
*/
/*
import 'package:flutter/material.dart';
void main() => runApp(MaterialApp(
  home: login(),
));
class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png',
                width: 100,
                height: 50,
              ),
              SizedBox(height: 60),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                height: 80,
                width: 300,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email-id',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 2.0,
                ),
                margin: EdgeInsets.all(10.0),

              ),
              FlatButton(
                height: 50,
                minWidth: 300,
                onPressed: () {},
                child: Text('Sign Up'),
                color: Colors.lightBlue,
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('------------OR------------'),
                ],
              ),
              SizedBox(height:20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Text(
                          'Dont have an account?'
                      ),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {},
                      child: Text('Sign Up',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

        ),
      ),

    );
  }
}
*/
