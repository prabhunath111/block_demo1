import 'package:block_demo1/counter_bloc.dart';
import 'package:flutter/material.dart';

import 'news_page.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: NewsPage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    counterBloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) {
                if(snapshot.data) {
                  return Text(
                    '${snapshot.hasData}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Increment);
            },
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Decrement);
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),FloatingActionButton(
            onPressed: (){
              counterBloc.eventSink.add(CounterAction.Reset);
            },
            tooltip: 'Reset',
            child: Icon(Icons.loop),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
