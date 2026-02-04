import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomeScreen(),
    );
  }
}

class CollectionData {
  String title;
  List<String> images;

  CollectionData(this.title, this.images);
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CollectionData> myCollections = [
    CollectionData("Collection 1", [
      "https://picsum.photos/200?random=1",
      "https://picsum.photos/200?random=2",
      "https://picsum.photos/200?random=3",
      "https://picsum.photos/200?random=4", 
    ]),
    CollectionData("Collection 2", [
      "https://picsum.photos/200?random=5",
      "https://picsum.photos/200?random=6",
      "https://picsum.photos/200?random=7",
      "https://picsum.photos/200?random=8",
      "https://picsum.photos/200?random=9", //+N
    ]),
    CollectionData("Collection 3", [
      "https://picsum.photos/200?random=10",
      "https://picsum.photos/200?random=11",
      "https://picsum.photos/200?random=12",
      "https://picsum.photos/200?random=13",
      "https://picsum.photos/200?random=14",
      "https://picsum.photos/200?random=15", //+N
    ]),
  ];

  int currentOpenIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], 
      appBar: AppBar(title: const Text("My Collections")),
      

      body: ListView.builder(
        padding: const EdgeInsets.all(16), 
        itemCount: myCollections.length,   
        itemBuilder: (context, index) {
          
          bool isThisCardOpen = (currentOpenIndex == index);

          return Card(
            margin: const EdgeInsets.only(bottom: 16), 
            elevation: 4, //shadow
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: InkWell(
              onTap: () {
                setState(() {
                  if (isThisCardOpen) {
                    currentOpenIndex = -1; 
                  } else {
                    currentOpenIndex = index; 
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          myCollections[index].title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Icon(isThisCardOpen
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down),
                      ],
                    ),

                    const SizedBox(height: 10), 
                    AnimatedCrossFade(
                      firstChild: buildHorizontalRow(myCollections[index]),
                      secondChild: buildVerticalList(myCollections[index]),
                      crossFadeState: isThisCardOpen
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildHorizontalRow(CollectionData data) {

    int maxImagesToShow = 4;
    int totalImages = data.images.length;
    int hiddenCount = totalImages - maxImagesToShow;

    return SizedBox(
      height: 100, 
      child: Row(
        children: [
         
          for (int i = 0; i < (totalImages > 4 ? 4 : totalImages); i++)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      
                      Image.network(data.images[i], fit: BoxFit.cover),
                      
                      if (i == 3 && hiddenCount > 0)
                        Container(
                          color: Colors.black54, 
                          alignment: Alignment.center,
                          child: Text(
                            "+$hiddenCount",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }

  // --- Helper Function 2: Builds the Expanded View (Vertical) ---
  Widget buildVerticalList(CollectionData data) {
    return Column(
      children: [
        for (String imageUrl in data.images)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                height: 150,
                width: double.infinity, // Stretch to full width
                fit: BoxFit.cover,
              ),
            ),
          )
      ],
    );
  }
}