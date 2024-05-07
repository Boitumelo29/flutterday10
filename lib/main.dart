import 'package:flutter/material.dart';
import 'package:flutterday10/data_services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _dateService = DataService();
  var _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Builder(builder: (context) {
                if (_response != null) {
                  return Text(_response);
                }
                return ElevatedButton(
                    onPressed: _makeRequest, child: const Text("Make Request"));
              })
            ],
          ),
        ),
      ),
    );
  }

  void _makeRequest() async {
    final response = await _dateService.makeRequestToApi();
    setState(() {
      _response = response;
    });
  }
}
