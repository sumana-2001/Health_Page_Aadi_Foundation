import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';
import 'package:updated_health_app/components/yoga.dart';

import 'MuscleWiki.dart';

Map<String, List<String>> daily_journals = {
  "Cardio Yoga": ["assets/images/bridge_pose.jpg", "Chest", "1"],
  "Core Blast": ["assets/images/cardio_yoga.png", "Band", "2"],
  "Back Exercise": ["assets/images/back_exercise.png", "Lower Back", "1"],
  "Warm Ups": ["assets/images/warmups.png", "Stretches", "2"],
  "Core Workouts": ["assets/images/core_workouts.png", "Bodyweight", "2"],
  "Leg Exercises": ["assets/images/leg_exercise.png", "Calves", "1"],
  "Meditation": ["assets/images/meditation1.png", "TRX", "2"],
  "Yoga": ["assets/images/yoga1.png", "Yoga", "2"]
};

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
        body: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => yoga()),
                  );
                },
                icon: Icon(Icons.arrow_back),
              ),
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
              child: Container(
                decoration: BoxDecoration(
                    color:Color(0xFFD3F9FA),
                    borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  )
                ),
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(16),
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _currVal.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      Slider(
                          value: _currVal,
                          label: _currVal.toString(),
                          activeColor: Colors.blue,
                          thumbColor: Colors.white,
                          onChanged: (value) {
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
                                ? Icon(Icons.play_arrow,color: Color(0xFF60BCFA),)
                                : Icon(Icons.pause,color: Color(0xFF60BCFA)),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _vol = !_vol;
                              });
                            },
                            icon: _vol
                                ? Icon(Icons.volume_up,color: Color(0xFF60BCFA),)
                                : Icon(Icons.volume_off,color: Color(0xFF60BCFA),),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Name of the routine",
                            style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w800, fontSize: 22
                            ),
                          ),
                          Spacer(),
                          Text(
                            "Time",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 18.0),
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          "Daily Journal",
                          style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w800, fontSize: 22
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: daily_journals.keys.length,
                          itemBuilder: (context, index) {
                            // Generate a random image for demonstration purposes
                            final randomImage =
                            daily_journals.values.elementAt(index)[0];
                            final String name =
                            daily_journals.values.elementAt(index)[1];
                            final String stringValue =
                            daily_journals.values.elementAt(index)[2];
                            final int choice = int.parse(stringValue);
                            final String title =
                            daily_journals.keys.elementAt(index);

                            return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Fetch(
                                            name: name,
                                            choice: choice,
                                            gender: "Male"),
                                    ),
                                  );
                                },
                                child: Column(children: [
                                  ListTile(
                                    leading: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.2,
                                      child: Image.asset(randomImage),
                                    ), // Random image
                                    title: Text(
                                      title,
                                      style: GoogleFonts.nunitoSans(
                                          fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                    subtitle: Text(
                                      "10 minutes",
                                      style: GoogleFonts.nunitoSans(),
                                    ), // Progress value (between 0 and 1)
                                  ),
                                  const Divider(),
                                ]));
                          },
                        ),
                      )
                      ]
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

