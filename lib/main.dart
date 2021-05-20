import 'package:flutter/material.dart';
import 'package:listandexpansiontile/model/section.dart';
import 'package:listandexpansiontile/model/widget_panel.dart';
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
    widgetPanels: <WidgetPanel>[
      WidgetPanel(id: 1, widgetName: 'Scaffold', detailPage: NextPage(widgetNameTitle: 'Scaffold')),
      WidgetPanel(id: 1, widgetName: 'AppBar', detailPage: NextPage(widgetNameTitle: 'AppBar')),
      WidgetPanel(id: 1, widgetName: 'Text', detailPage: NextPage(widgetNameTitle: 'Text')),
    ],
  ),
  Section(
    sectionName: 'ボタン',
    widgetPanels: <WidgetPanel>[
      WidgetPanel(id: 1, widgetName: 'ElevatedButton', detailPage: NextPage(widgetNameTitle: 'ElevatedButton')),
      WidgetPanel(id: 1, widgetName: 'TextButton', detailPage: NextPage(widgetNameTitle: 'TextButton')),
      WidgetPanel(id: 1, widgetName: 'OutlinedButton', detailPage: NextPage(widgetNameTitle: 'OutlinedButton')),
    ],
  ),
  Section(
    sectionName: 'レイアウト',
    widgetPanels: <WidgetPanel>[
      WidgetPanel(id: 1, widgetName: 'Center', detailPage: NextPage(widgetNameTitle: 'Center')),
      WidgetPanel(id: 1, widgetName: 'Column', detailPage: NextPage(widgetNameTitle: 'Column')),
      WidgetPanel(id: 1, widgetName: 'Row', detailPage: NextPage(widgetNameTitle: 'Row')),
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
                  children: section.widgetPanels.map((widgetPanel) =>
                    ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.star_outline,),
                        splashRadius: 0.1,
                        // color: Colors.yellow,
                        onPressed: (){
                          print('お気に入り');
                        },
                      ),
                      title: Text(widgetPanel.widgetName),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        Navigator.push(
                          context,
                          // MaterialPageRoute(builder: (context) => NextPage(widgetNameTitle: widget['widgetName']),)
                          MaterialPageRoute(builder: (context) => widgetPanel.detailPage,)
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
