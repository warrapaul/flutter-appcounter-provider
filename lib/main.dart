import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> CounterController()),
        ChangeNotifierProvider(create: (context)=> Stinger())
      ],
     
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}






class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //IMPLEMENTATION ONE USING PROVIDER OF
    // var myprovida = Provider.of<CounterController>(context, listen: true);

    //IMPLEMENTATION TWO USING OUR NOTIFIER CLASS
    var MyNotifierClassOne = context.read<CounterController>(); //read value without watching


    //var MyNotifierClass = context.watch<CounterController>(); //if need to watch value changes

    print(MyNotifierClassOne.count);
    return Scaffold(
      appBar: AppBar(
        title: Consumer<Stinger>(
          //child: Text('Wooza'),
            builder: (context, state, child) {
              return Column(
                children: [
                  child??Container(),
                  
                  Text("${state.name}".toString()),
                ],
              );
            }
          )),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer<CounterController>(
              builder: ((context, value, child) => Text(
                '${MyNotifierClassOne.count}',
                style: Theme.of(context).textTheme.headline4,
              ))
              
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MyNotifierClassOne.increment;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}


