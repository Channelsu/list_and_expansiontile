import 'package:flutter/material.dart';
import 'package:listandexpansiontile/model/section.dart';
import 'package:listandexpansiontile/next_page.dart';

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
        primarySwatch: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Section> _sections = <Section>[
  Section(
    sectionName: '基本',
    widgets: [
      {'id': 1, 'widgetName': 'Scaffold', 'screen': NextPage(widgetNameTitle: 'Scaffold')},
      {'id': 2, 'widgetName': 'AppBar', 'screen': null},
      {'id': 3, 'widgetName': 'Text', 'screen': null},
    ],
  ),
  Section(
    sectionName: 'ボタン',
    widgets: [
      {'id': 4, 'widgetName': 'ElevatedButton', 'screen': null},
      {'id': 5, 'widgetName': 'TextButton', 'screen': null},
      {'id': 6, 'widgetName': 'OutlinedButton', 'screen': null},
    ],
  ),
  Section(
    sectionName: 'レイアウト',
    widgets: [
      {'id': 7, 'widgetName': 'Center', 'screen': null},
      {'id': 8, 'widgetName': 'Column', 'screen': null},
      {'id': 9, 'widgetName': 'Row', 'screen': null},
    ],
  ),
];

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('list and expansiontile'),
        centerTitle: true,
      ),
      body: Wrap(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: _sections.length,
            itemBuilder: (context, index) {
              final section = _sections[index];
              return Card(  // Cardウィジェットはなくても良い。CardウィジェットはTile毛と相性が良い。
                elevation: 3,
                child: ExpansionTile(
                  title: ListTile(
                    title: Text(section.sectionName, style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  children: section.widgets.map((widget) =>
                    ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.star_outline,),
                        splashRadius: 0.1,
                        // color: Colors.yellow,
                        onPressed: (){
                          print('お気に入り');
                        },
                      ),
                      title: Text(widget['widgetName']),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => NextPage(widgetNameTitle: widget['widgetName']),)
                          MaterialPageRoute(builder: (context) => widget['screen'],)
                        );
                      },
                    )
                  ).toList(),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
