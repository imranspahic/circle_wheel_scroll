import 'dart:developer';
import 'package:circle_wheel_scroll/circle_wheel_scroll_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circle Wheel Scroll Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Circle Wheel Scroll Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: CircleListScrollView(
        physics: const CircleFixedExtentScrollPhysics(),
        axis: Axis.vertical,
        itemExtent: 100,
        renderChildrenOutsideViewport: true,
        clipToSize: false,
        radius: 213,
        children: List.generate(20, _buildItem),
        onSelectedItemChanged: (selectedItemChange) {
          log("CircleWheelList: onSelectedItemChanged = $selectedItemChange");
        },
      ),
    );
  }
}

Widget _buildItem(int i) {
  return Center(
    child: Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: Colors.blue[100 * ((i % 8) + 1)],
        borderRadius: BorderRadius.circular(26),
      ),
      child: Center(
        child: Text(
          i.toString(),
        ),
      ),
    ),
  );
}
