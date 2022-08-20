import 'package:flutter/material.dart';
import 'package:flutter_states_widgets_routes/models/Language.dart';
import 'package:flutter_states_widgets_routes/screen/AddLanguage.dart';
import 'customs/itemList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo Web Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/home",
      routes: {
        "/home" : (context) => MyHomePage(),
        "/add":(context) => AddLanguage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<bool> selects = [false, false, false, false, false];
  List<Language> languages =
  [
    /*Language('Android Nativo', 'Linguagens C, Java e Kotlin', Icons.android),
    Language('IOS Nativo', 'Linguagens Objective-C e Swift'),
    Language('Flutter', 'Linguagem DART'),
    Language('React Native', 'Linguagens C, Java e Kotlin'),
    Language('Ionic', 'Linguagens Javascript e TypeScript')*/
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text("Escolha de linguagem"),
        actions: [
          IconButton
          (
              onPressed: _goToNewLanguage,
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: Column
      (
        children: <Widget>
        [
          Wrap
          (
            spacing: 10,
            children: buildChoices(),
          ),
          Expanded
          (
            child: ListView
            (
              children: buildListItens()
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildChoices()
  {
    return languages.map
    (
      (language) => ChoiceChip
      (
          label: Text(language.title),
          selected: language.selected,
          onSelected: (value)
          {
            setState(() {
              language.selected = value;
            });
          },
      )
    ).toList();
  }

  void _goToNewLanguage()
  {
    Future future = Navigator.pushNamed(context, "/add");
    future.then((language) => {
      setState((){
        languages.add(language);
      })
    });
  }

  List<Widget> buildListItens(){
    return languages
    .where((element) => element.selected)
    .map((language) => getItemList(language.title, language.subtitle, language.icon))
    .toList();
  }
}