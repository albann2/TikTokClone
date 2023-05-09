import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kevine',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _likes = 0;
  List<String> _comments = [];
  var data;

  void _incrementLikeCount() {
    setState(() {
      _likes++;
    });
  }

  void _decrementLikeCount() {
    setState(() {
      _likes--;
    });
  }

  void _comment(String comment) {
    setState(() {
      _comments.add(comment);
    });
  }

  Future<String> _getVideoUrl() async {
    // Replace "video.mp4" with the name of your video file in Firebase Storage
    final ref = FirebaseStorage.instance.ref().child('video.mp4');
    final url = await ref.getDownloadURL();
    return url;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page kevine'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          FutureBuilder(
          future: _getVideoUrl(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 200,
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: VideoPlayer(
                      VideoPlayerController.network(
                        snapshot.requireData,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ),
    SizedBox(height: 16),
    Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
    IconButton(
    icon: Icon(Icons.favorite, color: Colors.red),
    onPressed: () {
    if (_likes == 0) {
    _incrementLikeCount();
    } else {
    _decrementLikeCount();
    }
    }),
    SizedBox(width: 8),
    Text('$_likes likes'),
    SizedBox(width: 16),
    IconButton(
    icon: Icon(Icons.comment),
    onPressed: () {
    showDialog(
    context: context,
    builder: (BuildContext context) {
    String comment = '';
    return AlertDialog(
    title: Text('Add Comment'),
    content: TextField(
    onChanged: (value) {
    comment = value;
    },
    ),
    actions: <Widget>[
    TextButton(
    child: Text('CANCEL'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    TextButton(
    child: Text('COMMENT'),
    onPressed: () {
    _comment(comment);
    Navigator.of(context).pop();
    },
    ),
    ],
    );
    },
    );
    },
    ),
    SizedBox(width: 8),
    Text('${_comments.length} comments'),
    ],
    ),
    SizedBox(height: 16),
    Expanded(
    child: ListView.builder(
    itemCount: _comments.length,
    itemBuilder: (BuildContext context, int index) {
    return ListTile(
    title: Text(_comments[index]),
    );
    },
    ),
    ),
          ],
      ),
    );
  }
}




