import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'compass/client/compass_client.dart';
import 'compass/model/event.dart';
import 'compass/model/query_string.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // app titile
      title: 'Event Search App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new EventSeacher(title: 'Event Search'),
    );
  }
}

// caller
class EventSeacher extends StatefulWidget {
  EventSeacher({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _EventSeacherState createState() => new _EventSeacherState();
}

class _EventSeacherState extends State<EventSeacher> {
  List<Event> _items;

  // TODO: What is Key?
  var _listViewKey = new Key('ListView');

  // TextArea Controller
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Search Result
    var listView = new ListView(
      key: _listViewKey,
      itemExtent: 50.0,
      children: _createWidgets(_items),
    );

    // Search result view area
    var container = new Container(height: 500.0, child: listView);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            // Textarea
            new TextField(
              decoration: const InputDecoration(
                hintText: 'Flutter',
                labelText: 'Query',
              ),
              maxLines: 1,
              controller: _controller,
            ),
            // Button Container
            new Container(
              padding: const EdgeInsets.all(20.0),
              child: new RaisedButton(
                child: const Text('Search'),
                onPressed: _search,
              ),
            ),
            container,
          ],
        ),
      ),
    );
  }

  void _search() {
    // TODO: Create common service client.
    var client = new CompassClient();
    var query = new QueryString();
    query.keyword = _controller.text;
    query.count = 100;
    client.get(query.get(0)).then((result) {
      setState(() {
        // TODO: get count, available, start.
        _items = result.events.where((e) => _isContent(e)).toList();
      });
    });
  }

  bool _isContent(Event event) {
    if (!_isNear(event)) {
      return false;
    }
    return true;
  }

  bool _isNear(Event event) {
    // Delete post number and space.
    if (event.address == null || event.address.length <= 0) { 
      return true;
    } 
    String str = event.address.replaceAll(new RegExp(r'[0-9〒 　\-]'), '');
    // TODO: もっと改善できない???
    RegExp exp = new RegExp(
        r"^(東京|神奈川|千代田区|中央区|港区|新宿区|文京区|台東区|墨田区|江東区|品川区|目黒区|大田区|世田谷区|渋谷区|中野区|杉並区|豊島区|北区|荒川区|板橋区|練馬区|足立区|葛飾区|江戸川区)");
    // _debugConsole("address: " + str + " : "+ exp.hasMatch(str).toString());
    if (!exp.hasMatch(str)) {
      return false;
    }
    return true;
  }

  void _debugConsole(String str) {
    // debugPrint(utf8.encode(str).toString());
    debugPrint(str);
  }

  Iterable<Widget> _createWidgets(List<Event> items) {
    var ret = new List<Widget>();
    if (items == null) {
      return ret;
    }
    items.forEach((item) {
      String address = item.address == null ? "" : ': ${item.address}';
      ret.add(new ListTile(
        // Read icon?
        // leading: new CircleAvatar(
        //   backgroundImage: new NetworkImage(item.avatarUrl),
        // ),
        // title: new Text('${item.title} :  ${item.accepted}/${item.limit}'),
        title: new Text('${item.title} ' + address),
      ));
    });
    return ret;
  }
}

//-------------------------------------------------------------
// proc
class RandomWordsState extends State<RandomWords> {
  final List<WordPair> _suggestions = <WordPair>[];
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: _buildContents(),
    );
  }

  Widget _buildContents() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            appBar: AppBar(
              title: Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }
}

// 呼び出し側
class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
