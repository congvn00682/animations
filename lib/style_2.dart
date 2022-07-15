import 'package:flutter/material.dart';

class Style2 extends StatefulWidget {
  const Style2({Key? key}) : super(key: key);

  @override
  State<Style2> createState() => _Style2State();
}

class _Style2State extends State<Style2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expansion Level'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: const <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    'Sub title',
                  ),
                  children: <Widget>[
                    ListTile(
                      title: Text('data'),
                    )
                  ],
                ),
                ListTile(
                  title: Text(
                      'data'
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
