import 'package:flutter/material.dart';

void main() => runApp(PhotoGalleryApp());

class PhotoGalleryApp extends StatelessWidget {
  const PhotoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Photo Gallery'),
        ),
        body: PhotoGalleryScreen(),
      ),
    );
  }
}

class PhotoGalleryScreen extends StatefulWidget {
  @override
  PhotoGalleryScreenState createState() => PhotoGalleryScreenState();
}

class PhotoGalleryScreenState extends State<PhotoGalleryScreen> {
  final TextEditingController textEditingController = TextEditingController();
  bool photosUploaded = false;

  // Sample photo data
  List<Map<String, String>> photos = [
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/49d79f126331743.Y3JvcCwxOTIwLDE1MDEsMCw0OTQ.jpg", "caption": "Goalbari"},
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/b95e8a126331323.Y3JvcCwxOTIwLDE1MDEsMCwxNDcz.jpg", "caption": "Promi Tourism"},
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/441b6e125829215.Y3JvcCwxMDU2LDgyNiwxMDEsMA.png", "caption": "Coming Soon"},
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/c5dc7f125762063.Y3JvcCw4MDgsNjMyLDE1OCww.png", "caption": "Call To Action"},
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/1f8031125761689.Y3JvcCw4NTEsNjY2LDk5LDA.png", "caption": "Dracko"},
    {"image": "https://mir-s3-cdn-cf.behance.net/projects/808/95bc23125760999.Y3JvcCwxMjgwLDEwMDEsMCwxNjAw.jpg", "caption": "StormTreat"},
  ];

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Welcome to the Photo Gallery!',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                labelText: 'Search for photos...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 50.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showSnackbar('Clicked on ${photos[index]["caption"]}');
                },
                  child: Column(
                    children: [
                      Image.network(photos[index]["image"]!),
                      Text(photos[index]["caption"]!),
                    ],
                  ),

              );
            },
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: photos.length,
              itemBuilder: (context, index){
                return GestureDetector(
                    onTap: (){
                      showSnackbar('Clicked on ${photos[index]["caption"]}');
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(photos[index]["image"]!,),
                      ),
                      title: Text(photos[index]["caption"]!),
                      subtitle: Text('Description for ${photos[index]["caption"]}'),
                    )
                );
              }
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,0,0,50),
            child: ElevatedButton(
              onPressed: (){
                setState(() {
                  photosUploaded = true;
                });
                showSnackbar('Photos Uploaded Successfully!');
              },
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                padding: EdgeInsets.all(16.0),
                primary: Colors.blue,
              ),
              child: Icon(Icons.upload, size: 28.0, color: Colors.white),
            ),

          ),
          if (photosUploaded)
            Text(
              'Photos Uploaded Successfully!',
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
        ],
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CircleIconButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56.0,
      height: 56.0,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          padding: EdgeInsets.all(16.0),
          primary: Colors.blue,
        ),
        child: Icon(Icons.cloud_upload, size: 28.0, color: Colors.white),
      ),
    );
  }
}






