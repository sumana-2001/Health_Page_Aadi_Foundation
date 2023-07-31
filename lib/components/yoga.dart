import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:proste_bezier_curve/proste_bezier_curve.dart';
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
  "Yoga": ["assets/images/yoga_3d.png"],
  "Meditation": ["assets/images/meditation_3d.png"],
  "Stretches": ["assets/images/streching_3d.png"],
  "Cables": ["assets/images/cables_3d.jpeg"],
  "Bodyweight": ["assets/images/body_lifting_3d.jpeg"],
  "Kettlebells": ["assets/images/kettlebells_3d.jpeg"],
  "Male Anatomy": ["assets/icons/man_front.png"],
  "Female Anatomy": ["assets/icons/women_front.png"]
};

class _yogaState extends State<yoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBody: true,
          //bottomNavigationBar: gbar(),
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
                        padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10),
                        child: CircleAvatar(
                            radius: 15,
                          ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10),
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
                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hi, Name",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0,left:10,right: 10,bottom: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "How are you feeling today?",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                          height: MediaQuery.of(context).size.height / 5,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                child: Text("Band Workouts"),
                                top: 30,
                                left: 30,
                              ),
                              Positioned(
                                  bottom: 10,
                                  left: 30,
                                  child: FloatingActionButton.small(
                                    backgroundColor: Colors.lightBlue,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Fetch(
                                                name: "Band",
                                                choice: 2,
                                                gender: "Male")),
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
                                  )),
                            ],
                          ),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal:10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child:Text(
                        'Recommended Flows',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: Tasks.length,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Color(0xFF2DCBD0), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Stack(
                                children: [
                                  ClipRect(
                                    child: Ink.image(
                                      image: AssetImage(
                                          Tasks.values.elementAt(index)[0]),
                                      //fit: BoxFit.cover,
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 200,
                                    ),
                                  ),
                                  Positioned(
                                      right: 10,
                                      bottom: 10,
                                      child: SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: FloatingActionButton.small(
                                            heroTag: index,
                                            onPressed: () {
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
                                                print(
                                                    Tasks.keys.elementAt(index));
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
                                            child: Icon(
                                              Icons.play_arrow,
                                              size: 20,
                                            ),
                                            backgroundColor:
                                                Colors.lightBlueAccent,
                                          ))),
                                ],
                              ),
                            ),
                            Text(
                              Tasks.keys.elementAt(index),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan,
                                  fontSize: 15),
                            ),
                          ]);
                        }),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(
                            20.0), // Adjust the padding value as per your requirement
                        child: Text(
                          'Continue Flows',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                  Container(
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
                              MaterialPageRoute(builder: (context) => player()),
                            );
                          },
                          child: ListTile(
                            leading: Image.asset(randomImage), // Random image
                            title: Text(
                              weekdays[index],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: LinearProgressIndicator(
                              value: 0, // Progress value (between 0 and 1)
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
