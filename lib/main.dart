import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Expansions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class ExData {
  bool isExpanded;
  final String header;
  final Widget body;

  ExData(this.isExpanded, this.header, this.body);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ExData> _itemList = List<ExData>();

  @override
  void initState() {
    for (int i = 0; i < 10; i++) {
      _itemList.add(
        ExData(
          false,
          'header $i',
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text('hello flutter'),
            ),
          ),
        ),
      );
    }
    super.initState();
  }

  ExpansionPanel createItem(ExData item) {
    return ExpansionPanel(
        headerBuilder: (BuildContext context, bool isExpanded) {
          return Container(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text('${item.header}'),
            ),
          );
        },
        body: item.body,
        isExpanded: item.isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Expansions'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: [
              ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.all(4.0),
                expansionCallback: (int index, bool isExpanded) => {
                  setState(() => _itemList[index].isExpanded =
                      !_itemList[index].isExpanded)
                },
                children: _itemList.map((e) => createItem(e)).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
