import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:updated_health_app/components/MuscleWiki.dart';
import 'package:updated_health_app/components/player.dart';

class yoga extends StatefulWidget {
  const yoga({super.key});

  @override
  State<yoga> createState() => _yogaState();
}

List<String> continue_flows = [
  "assets/images/back_bending_pose.jpg",
  "assets/images/cardio_yoga1.jpg",
  "assets/images/lower_body_streches.png",
  "assets/images/pigeon_pose.jpg",
  "assets/images/streching_exercise.png",
  "assets/images/yoga.png",
  "assets/images/bridge_pose.jpg"
];
List<String> weekdays = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday"
];

Map<String, List<String>> Tasks = {
  "Yoga": ["assets/flow-pic/yoga.png"],
  "Meditation": ["assets/flow-pic/meditation.png"],
  "Stretches": ["assets/flow-pic/stretches.png"],
  "Cables": ["assets/flow-pic/cables.png"],
  "Bodyweight": ["assets/flow-pic/bodyweight.png"],
  "Kettlebells": ["assets/flow-pic/kettlebells.png"],
  "Male Anatomy": ["assets/icons/man_front.png"],
  "Female Anatomy": ["assets/icons/women_front.png"]
};

class _yogaState extends State<yoga> {
  double _currVal = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        child: CircleAvatar(
                          radius: 15,
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                        child: IconButton(
                            color: Colors.black,
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hi, Name",
                        style: GoogleFonts.nunitoSans(
                            fontSize: 25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF575757),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 5.0, left: 10, right: 10, bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "How are you feeling today?",
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Color(0xFF575757),
                        )
                      ),
                    ),
                  ),
                  Center(
                    child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                        color: Color(0xFFCEF8FA),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 4.5,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Text(
                                    "Band Workouts",
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                top: 30,
                                left: 30,
                              ),
                              Positioned(
                                  bottom: 15,
                                  left: 20,
                                  child: FloatingActionButton.small(
                                    elevation: 3,
                                    backgroundColor: Colors.lightBlue,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Fetch(
                                                name: "Band",
                                                choice: 2,
                                                gender: "Male"),
                                        ),
                                      );
                                    },
                                    child: Icon(Icons.play_arrow),
                                  )),
                              Positioned(
                                  right: 10,
                                  child: Image.asset(
                                    "assets/images/poseeee.png",
                                    width: 200,
                                    height: 200,
                                  ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Recommended Flows',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Color(0xFF575757),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.8,
                    width: double.infinity,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0,
                      ),
                      itemCount: Tasks.length,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (Tasks.keys.elementAt(index) ==
                                "Male Anatomy") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        musclewiki(
                                            gender: "Male")),
                              );
                            } else if (Tasks.keys
                                .elementAt(index) ==
                                "Female Anatomy") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        musclewiki(
                                            gender: "Female")),
                              );
                            } else if (Tasks.keys
                                .elementAt(index) ==
                                "Meditation") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fetch(
                                        name: "TRX",
                                        choice: 2,
                                        gender: "Male")),
                              );
                            } else {
                              print(Tasks.keys.elementAt(index));
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fetch(
                                        name: Tasks.keys
                                            .elementAt(index),
                                        choice: 2,
                                        gender: "Male")),
                              );
                            }
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2.8,
                                child: Card(
                                  elevation: 1,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: ClipRect(
                                        child: Ink.image(
                                          image: AssetImage(
                                              Tasks.values.elementAt(index)[0]),
                                          fit: BoxFit.fill,
                                          height:
                                              MediaQuery.of(context).size.height / 5,
                                          width: MediaQuery.of(context).size.width / 5,
                                        ),
                                      ),
                                ),
                              ),
                              SizedBox(
                                height: 3,),
                              Text('${Tasks.keys.elementAt(index)}',
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey[700],
                                  )),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 25.0, horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Continue Flows',
                        style: GoogleFonts.nunitoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 25,
                          color: Color(0xFF575757),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: continue_flows.length,
                      itemBuilder: (context, index) {
                        // Generate a random image for demonstration purposes
                        final randomImage = continue_flows[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => player(currVal: _currVal,)),
                            );
                          },
                          child: ListTile(
                            leading: Image.asset(
                                randomImage,
                              width: MediaQuery.of(context).size.width/6,
                            ), // Random image
                            title: Text(
                              weekdays[index],
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w800,
                                fontSize: 15,
                                color: Colors.black,
                              ),

                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Time',
                                  style: GoogleFonts.nunitoSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                SizedBox(height: 5,),
                                LinearProgressIndicator(
                                  value: _currVal, // Progress value (between 0 and 1)
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
