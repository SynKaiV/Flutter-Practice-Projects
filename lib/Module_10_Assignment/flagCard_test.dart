import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FlagCard extends StatelessWidget {
  final String imageURL;
  final String seatsLeft;
  final String daysLeft;
  final String courseTitle;

  const FlagCard({
    super.key,
    required this.imageURL,
    required this.seatsLeft,
    required this.daysLeft,
    required this.courseTitle,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 5,
              ),
            ],
          ),
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    imageURL,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.groups, size: 14, color: Colors.blueGrey),
                      SizedBox(width: 4),
                      Text('$seatsLeft সিট বাকি', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.schedule, size: 14, color: Colors.blueGrey),
                      SizedBox(width: 4),
                      Text('$daysLeft দিন বাকি', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                courseTitle,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  child: Text("বিস্তারিত দেখুন →", style: TextStyle(fontSize: 12)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
