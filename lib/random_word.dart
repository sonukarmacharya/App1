import 'package:firstflutter/des.dart';
import 'package:firstflutter/designTwo.dart';
import 'package:firstflutter/quiz.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'aligning.dart';
import 'designs.dart';
import 'des.dart';
import 'quiz.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  final _randomWordPairs = <WordPair>[];
  final _savedWordPairs = Set<WordPair>();
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemBuilder: (context, item) {
        if (item.isOdd) return Divider();

        final index = item ~/ 2;

        if (index >= _randomWordPairs.length) {
          _randomWordPairs.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_randomWordPairs[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _savedWordPairs.contains(pair);

    return ListTile(
        title: Text(pair.asPascalCase,
            style: TextStyle(
              fontSize: 18,
            )),
        trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onTap: () => {
              setState(() {
                if (alreadySaved) {
                  _savedWordPairs.remove(pair);
                } else {
                  _savedWordPairs.add(pair);
                }
              })
            });
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savedWordPairs.map((WordPair pair) {
        return ListTile(
          title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)),
          trailing: Icon(Icons.navigate_next),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Aligning()),
            );
          },
        );
      });

      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
        appBar: AppBar(title: Text('Saved WordPairs')),
        body: ListView(children: divided),
      );
    }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPair Generator'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildList(),
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple[900]),
              child: Text(
                'Heading',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              title: Text('Static'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Aligning()),
                )
              },
            ),
            ListTile(
              title: Text('Design'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Design()),
                )
              },
            ),
            ListTile(
              title: Text('Design2'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DesignTwo()),
                )
              },
            ),
            ListTile(
              title: Text('Design3'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Des()),
                )
              },
            ),
            ListTile(
              title: Text('Quiz game'),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Quiz()),
                )
              },
            )
          ],
        ),
      ),
    );
  }
}
