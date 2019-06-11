import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'compass/client/compass_client.dart';
import 'compass/model/event.dart';

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

    // View area
    var container = new Container(
        height: 500.0,
        child: listView
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: <Widget>[
            new TextField(
              decoration: const InputDecoration(
                hintText: 'Flutter',
                labelText: 'Query',
              ),
              maxLines: 1,
              controller: _controller,
            ),
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
    client.get(_controller.text).then((result) {
      setState(() {
        // TODO: get count, available, start.
        _items = result.events;
      });
    });
  }

  Iterable<Widget> _createWidgets(List<Event> items) {
    var ret = new List<Widget>();
    if (items == null) {
      return ret;
    }
    items.forEach((item) {
      ret.add(
          new ListTile(
            // TODO: Read icon?
            // leading: new CircleAvatar(
            //   backgroundImage: new NetworkImage(item.avatarUrl),
            // ),
            title: new Text('${item.title} :  ${item.accepted}/${item.limit}'),
          )
      );
    });
    return ret;
  }
}

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
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
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
