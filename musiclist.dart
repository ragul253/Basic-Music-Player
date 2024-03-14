import 'package:flutter/material.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MyAPPState();
}

class _MyAPPState extends State<MusicList> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Music List"),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: Songs.length,
          itemBuilder: (context, index){
            return Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Image.network(Songs[index]["thumbnail"], width: 60,),
              Column(
                children: [
                  Text(Songs[index]["name"],textAlign: TextAlign.left,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  Text(Songs[index]["artist"],textAlign: TextAlign.left,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ],
              ),
                 CircleAvatar(
                   child: IconButton(onPressed: (){
                     Navigator.pushNamed(context, "/player", arguments: {'index':index});
                   },
                   icon: Icon(Icons.play_arrow),),
                 )
              ]
              ), 
            );
          }
        ),
      ),
      floatingActionButton:FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, "/player");
        },
        child: Icon(Icons.navigate_next),
      ) ,

    );
  }
}
