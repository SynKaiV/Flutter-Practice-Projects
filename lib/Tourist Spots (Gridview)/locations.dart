import 'package:flutter/material.dart';
import '../Widgets/tourist_spots.dart';

class Locations extends StatelessWidget {
  const Locations({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardHeight = 0;

    int crossAxisCount = 0;
    if(screenWidth < 768){
      crossAxisCount = 2; // For small screens, like phones
      cardHeight = screenHeight * 0.35; // ~35% of screen height
    }
    else if(screenWidth > 768 && screenWidth <= 1024){
      crossAxisCount = 3; // For medium screens, like tablets
      cardHeight = screenHeight * 0.4; // ~40% of screen height
    }
    else if(screenWidth > 1024){
      crossAxisCount = 4; // For large screens, like desktops
      cardHeight = screenHeight * 0.45; // ~45% of screen height
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Top Rated Tourist Spots', style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
        )),
      ),
      body: GridView.count(
        padding: EdgeInsets.all(10),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        crossAxisCount: crossAxisCount,
        children: [
          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://www.amny.com/wp-content/uploads/2022/08/GettyImages-523538287.jpg?quality=51',
                cityName: 'New York City',
                rating: 4.5
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://assets.cntraveller.in/photos/6352a8c00831d51e5aa10703/4:3/w_5332,h_3999,c_limit/tokyoGettyImages-1031467664.jpeg',
                cityName: 'Tokyo',
                rating: 4.9
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbgRgAeYJtFuVnrI84upON3qiYOrZxRMjYRg&s',
                cityName: 'Bangkok',
                rating: 4.7
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://mediaim.expedia.com/destination/9/cd8a3f3db7149b0ce36d052aea1182df.jpg',
                cityName: 'Dubai',
                rating: 4.6
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://www.iroamly.com/images/istanbul-safe.webp',
                cityName: 'Istanbul',
                rating: 4.7
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://static.independent.co.uk/2025/04/25/13/42/iStock-1498516775.jpg',
                cityName: 'Paris',
                rating: 4.8
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://images.ctfassets.net/x5n15ofh32yq/357qtM67F4OJ0emtAOT0Tf/c82e466452d80ad9d0838c8561c19e13/London_01_AdobeStock_135613354.jpeg',
                cityName: 'London',
                rating: 4.4
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://black-bikes.com/wp-content/uploads/2023/05/amsterdam-city-guide-things-to-see-do-and-visit.jpg',
                cityName: 'Amsterdam',
                rating: 4.9
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://broganabroad.com/wp-content/uploads/2023/02/Old-Town-Square-Prague-Czech-Republic.jpg',
                cityName: 'Prague',
                rating: 4.7
            ),
          ),

          SizedBox(
            height: cardHeight,
            child: TouristSpots(
                imageURL: 'https://cdnblog.fly.homes/uploads/2023/10/Interesting-Facts-About-Sydney.webp',
                cityName: 'Sydney',
                rating: 4.8
            ),
          ),
        ],
      )
    );
  }
}


