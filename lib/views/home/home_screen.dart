import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_project/utils/global/default_text_theme.dart';
import 'package:flutter_default_project/utils/global/fast_localization.dart';
import 'package:sizer/sizer.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(fastLocal.helloWorld),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              fastLocal.language,
            ),
            Text(
              '$_counter',
              style: DefaultTextTheme.bold16(context),
            ),
            Container(
              height: 10.h,
              width: 10.w,
              color: Theme.of(context).colorScheme.primary,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: fastLocal.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
