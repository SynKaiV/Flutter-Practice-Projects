import 'package:flutter/material.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  final TextEditingController _controller = TextEditingController();
  final int goal = 4000;
  int drank = 0;

  void _addWater(int amount){
    setState(() {
      drank +=  amount.clamp(0, 4000);
    });

  }
  void _reset(){
    setState(() {
      drank = 0;
    });
  }

  void showCustomInputDialog(){
    showModalBottomSheet(
        context: context,
        builder: (context)=> Container(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
          children: [
            Text("Enter water amount (ml):", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),

            SizedBox(height: 10),

            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                  hintText: "e.g. 500 ml",
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){
                        Navigator.pop(context);
                        _controller.text = "";
                        },
                      child: Text("Cancel", style: TextStyle(
                          fontSize: 18,
                          color: Colors.red)
                      ),
                  ),

                  TextButton(
                      onPressed: (){
                    final int amount = int.parse(_controller.text) ?? 0;
                    if(amount > 0){
                      _addWater(amount);
                      Navigator.pop(context);
                      _controller.text = "";
                    }
                  },
                      child: Text("Add", style: TextStyle(
                          fontSize: 18,
                          color: Colors.green)
                      ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double progress = (drank/goal).clamp(0,1);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.water_drop, size: 30, color: Colors.black,),
            SizedBox(width: 10),
            Text("Water Tracker",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
            ),
          ],
        ),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 12, 25, 5),
            child: Image.asset(
              "assets/drinking.png",
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 3, 15, 5),
            child: Container(
              alignment: Alignment.center,
              width: 350,
              height: 180,
              decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.blue,
                        spreadRadius: 4,
                        blurRadius: 12,
                        offset: Offset(6,6)
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4, 8, 8, 8),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              "assets/bottle.png",
                              width: 35,
                              height: 35,
                              fit: BoxFit.contain),

                            SizedBox(width: 10),

                            Text(
                              "Water Intake Today",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Row(
                          children: [
                            Icon(Icons.water_drop),
                            SizedBox(width: 8),
                            Text(
                              "Today's Goal: $goal ml", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        Row(
                          children: [
                            Icon(Icons.water_drop),
                            SizedBox(width: 8),
                            Text(
                              "Drank: $drank ml", style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(width: 10,),

                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: progress,
                              backgroundColor: Colors.grey,
                              color: Colors.greenAccent,
                              strokeWidth: 10,
                            ),
                          ),

                          Text("${(progress*100).toInt()}%",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25
                          ),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20),
          
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade200
                      ),
                      onPressed: ()=> _addWater(300),
                      label: Text("+300 ml", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),
                      ),
                      icon: Icon(Icons.water_drop, color: Colors.black),
                   ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade200
                    ),
                    onPressed: ()=> _addWater(500),
                    label: Text("+500 ml", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black
                    ),
                    ),
                    icon: Icon(Icons.water_drop, color: Colors.black),
                  ),
                ),

                SizedBox(width: 8),

                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue.shade200
                      ),
                      onPressed:  showCustomInputDialog,
                      label: Text("Custom", style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      ),
                      icon: Icon(Icons.add_circle_outline, color: Colors.black)
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white
                  ),
                  onPressed: ()=> _reset(),
                  child: Text("Reset",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  ),
              ),
            ),
          )
        ],
      ),
    );
  }
}