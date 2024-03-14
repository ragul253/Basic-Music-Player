import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player ({super.key});

  @override
  State<Player> createState() => _MyAppState();
}

class _MyAppState extends State<Player> {
  List Songs=[
    {
      "name":"2002",
      "thumbnail":"https://m.media-amazon.com/images/M/MV5BOThlNTJkMGYtMzNhYi00M2U4LWE4MDMtNmRlOGVkMTdkNTIxXkEyXkFqcGdeQXVyNjE0ODc0MDc@._V1_.jpg",
      "path":"songs/2002.mp3",
      "artist":"Annie marrie",
      'genre':"pop"

    },
    {
      "name":"Adiye",
      "thumbnail": "https://i.scdn.co/image/ab67616d0000b2732f690a7b9b73760ce176e809",
      "path": "songs/Adiye.mp3",
      "artist": "GVP",
      'genre': "Romance"
    },
    {
      "name":"Hayyoda",
      "thumbnail": "https://c.saavncdn.com/033/Hayyoda-From-Jawan-Tamil-2023-20230814014351-500x500.jpg",
      "path": "songs/Hayyoda.mp3",
      "artist": "Anirudh",
      'genre': "Romance"
    },
    {
      "name":"Osaka",
      "thumbnail": "https://i.ytimg.com/vi/oOhPpZQzYjQ/mqdefault.jpg",
      "path": "songs/Osaka.mp3",
      "artist": "Anirudh",
      'genre': "Folk"
    },
    {
      "name":"Poi Poi Poi",
      "thumbnail": "https://c.saavncdn.com/195/Poi-Poi-Poi-Tamil-2023-20230208180222-500x500.jpg",
      "path": "songs/Poi Poi.mp3",
      "artist": "AADHI",
      'genre': "Hiphop"
    },
    {
      "name":"Selfie Pulla",
      "thumbnail": "https://live.staticflickr.com/7819/46886346462_aca6898b17_b.jpg",
      "path": "songs/Selfie Pulla.mp3",
      "artist": "Vijay",
      'genre': "Dance"
    }

  ];
  final audioPlayer=AudioPlayer();
  bool isPlaying = false;
  Duration duration=Duration.zero;
  Duration position=Duration.zero;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state==PlayerState.playing;
        print(isPlaying);
      });
    });
    audioPlayer.onPositionChanged.listen((position) {
      setState(() {
        position=position;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    final routes=ModalRoute.of(context)?.settings.arguments as Map<String,int>;
    var i=routes['index']?.toInt();
    return Scaffold(
      appBar: AppBar(
        title: Text("Music Player"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
                child: Image.network(Songs[i??0]["thumbnail"])
            ),
            Slider(
                min: 0,
                max :duration.inSeconds.toDouble(),
                value :position.inSeconds.toDouble(),
                onChanged: (value)async{}),
            CircleAvatar(
              child: IconButton(onPressed: () async{
                if(isPlaying==false)
                  {
                    await audioPlayer.play(Songs[i??0]["path"]);
                  }
                else{
                  await audioPlayer.pause();
                }
              },
              icon:isPlaying==false?Icon(Icons.play_arrow):Icon(Icons.pause),
            ))

          ],
        ),
      ),
    );
  }
}
