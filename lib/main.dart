import 'package:flutter/material.dart';

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

// 表示する項目の設計図作成
class Section {
  String sectionName;
  List<String> widgetNames;

  Section({this.sectionName, this.widgetNames});
}

final List<Section> _sections = <Section>[
  Section(
    sectionName: '基本',
    widgetNames: ['Scaffold', 'AppBar', 'Text'],
  ),
  Section(
    sectionName: 'ボタン',
    widgetNames: ['ElevatedButton', 'TextButton', 'OutlinedButton'],
  ),
  Section(
    sectionName: 'レイアウト',
    widgetNames: ['Center', 'Column', 'Row'],
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
                  children: section.widgetNames.map((wn) =>
                    ListTile(
                      title: Text(wn),
                      leading: IconButton(
                        icon: Icon(Icons.star_outline,),
                        splashRadius: 0.1,
                        // color: Colors.yellow,
                        onPressed: (){
                          print('お気に入り');
                        },
                      ),
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
