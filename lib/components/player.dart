import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:updated_health_app/components/yoga.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'MuscleWiki.dart';

Map<String,List<String>> daily_journals = {"Cardio Yoga":["assets/images/bridge_pose.jpg","Chest","1"],"Core Blast":["assets/images/cardio_yoga.png","Band","2"],"Back Exercise":["assets/images/back_exercise.png","Lower Back","1"],"Warm Ups":["assets/images/warmups.png","Stretches","2"],"Core Workouts":["assets/images/core_workouts.png","Bodyweight","2"],"Leg Exercises":["assets/images/leg_exercise.png","Calves","1"],"Meditation":["assets/images/meditation1.png","TRX","2"],"Yoga":["assets/images/yoga1.png","Yoga","2"]};
class player extends StatefulWidget {
  const player({Key? key});

  @override
  State<player> createState() => _playerState();
}

class _playerState extends State<player> {
  int curr_idx = 0;
  double _currVal = 0;
  bool isHeartBroken = false;
  bool _play = true;
  bool _vol = true;
  String content =
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => yoga()),
                    );
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isHeartBroken = !isHeartBroken;
                    });
                  },
                  icon: isHeartBroken
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                ),
              ],
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double imageSize = constraints.maxWidth *
                      0.9; // Adjust the size based on your needs
                  return Container(
                    width: imageSize,
                    height: imageSize,
                    child: Image.asset(
                      'assets/test/tread.png', // Replace with the path to your image
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child:  SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    padding: EdgeInsets.all(5),
    child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    color: Color(0xFFD3F9FA),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 1.1,
                            // child: LinearProgressIndicator(
                            //   value: 50,
                            // ),
                          ),
                        ),
                        Text(_currVal.toString(),style: TextStyle(fontSize: 12),),
                        Slider(value: _currVal,
                            label: _currVal.toString(),
                            activeColor: Colors.blue,
                            thumbColor: Colors.white,
                            onChanged:(value){
                              setState(() {
                                _currVal = value;
                              });
                            }),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _play = !_play;
                                });
                              },
                              icon: _play
                                  ? Icon(Icons.play_arrow)
                                  : Icon(Icons.pause),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _vol = !_vol;
                                });
                              },
                              icon: _vol
                                  ? Icon(Icons.volume_up)
                                  : Icon(Icons.volume_off),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(bottom: 10),
                          child:Text(
                            "Name of the routine",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 60),
                          child: ReadMoreText(
                            content,
                            trimLines: 1,
                            trimCollapsedText: " Show More ",
                            trimExpandedText: " Show less ",
                            lessStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                            moreStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Daily Journal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),

                        Expanded(
                          child :
                          Container(
                              child: ListView.builder(
                                shrinkWrap: true,
    itemCount: daily_journals.keys.length,
    itemBuilder: (context, index) {
    // Generate a random image for demonstration purposes
    final randomImage = daily_journals.values.elementAt(index)[0];
    final String name = daily_journals.values.elementAt(index)[1];
    final String stringValue = daily_journals.values.elementAt(index)[2];
    final int choice = int.parse(stringValue);
    final String title = daily_journals.keys.elementAt(index);

    return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Fetch(name: name, choice: choice, gender: "Male")),
      );
    },
    child: Column(
    children : [
      ListTile(
    leading: Container(
      width: 80,
      child : Image.asset(randomImage),
    ),// Random image
    title: Text(title,
    style: TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: Text("10 minutes",
      style: TextStyle(),
    ), // Progress value (between 0 and 1)
    ),
      Divider(),]));
    },
    ),


    )),
                        ],
                    ),
                  )),
            ),
            )],
        ),
      ),
    );
  }
}
