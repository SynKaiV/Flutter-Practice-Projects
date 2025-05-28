import 'package:flutter/material.dart';

class TouristSpots extends StatelessWidget {
  final imageURL, cityName;
  final double rating;

  const TouristSpots({
    super.key,
    required this.imageURL,
    required this.cityName,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: EdgeInsets.all(9),
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.lightBlueAccent.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.deepPurpleAccent.withOpacity(0.5),
              blurRadius: 5,
              offset: Offset(8, 8)
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Image.network(
                imageURL,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  top: 10,
                  right: 6,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.star, color: Colors.orange, size: 15),
                        SizedBox(width: 5),
                        Text(rating.toString(),style: TextStyle(
                            fontSize: 15,
                            color: Colors.orange,
                            fontWeight: FontWeight.bold
                        ),),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
              ),
            ],
          ),

          SizedBox(height: 5),

          Text(cityName, style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
          )),
        ],
      ),
    );
  }
}