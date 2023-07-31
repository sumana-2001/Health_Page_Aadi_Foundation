import 'dart:core';
import 'dart:core';
import 'dart:core';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:updated_health_app/components/yoga.dart';
import 'package:video_player/video_player.dart';
import 'package:updated_health_app/components/workoutsAPI.dart';
import 'dart:convert';
import 'package:chewie/chewie.dart';
import 'package:http/http.dart' as http;
import 'package:updated_health_app/models/classAPI.dart';
import 'package:updated_health_app/models/detailsAPI.dart';


Future<List<dynamic>> fetchExerciseDetails() async {
  final url =
  Uri.parse("https://musclewiki.p.rapidapi.com/exercises");
  final response = await http.get(
    url,
    headers: {
      'X-RapidAPI-Key': 'b5456f97e6msh1dd2f8e51c41572p1fb1e6jsnfba016683d97',
      'X-RapidAPI-Host': 'musclewiki.p.rapidapi.com'
    },
  );
  var JSONobj = json.decode(response.body);
  return JSONobj;
}

//images are
List<String> male_bodies = ["assets/images/man_front.png","assets/images/man_rear.png"];
List<String> female_bodies = ["assets/images/women_front.png","assets/images/women_rear.png"];
class musclewiki extends StatefulWidget {
  String gender;
  musclewiki({Key? key, required this.gender}) : super(key: key);
  //const musclewiki({super.key});

  @override
  State<musclewiki> createState() => _musclewikiState();
}

class _musclewikiState extends State<musclewiki> {
  List<String> bodies = [];
  //ExerciseFetcher exerciseFetcher = ExerciseFetcher();
  Color c = Colors.white;
  int current = 0;
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
         if(widget.gender == "Male"){
           bodies = male_bodies;
         }
         else if(widget.gender == "Female"){
           bodies = female_bodies;
         }
         print(widget.gender);
         return SafeArea(
             child: Scaffold(
               backgroundColor: Colors.white,
               body: Center(
                  child : ListView.builder(

                    shrinkWrap: true,
                    itemCount: bodies.length,
                    itemBuilder:
                      (BuildContext context, int itemIndex) =>
                      Stack(
                        alignment: Alignment.center,
                        children: [
                            Image.asset(bodies[itemIndex]
                                , fit: BoxFit.contain),

                            Positioned(

                                top: 108,
                                left: 150,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {

                                  },
                                )
                            ),
                            Positioned(
                                left: 120,
                                top: 120,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
    if(bodies[itemIndex].contains("front")){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) =>
    Fetch(
    choice: 1,
    name: "Shoulders",
    gender: widget.gender
    )
    ),
    );
    }
    else{
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (_) =>
    Fetch(
    choice: 1,
    name: "Shoulders",
        gender: widget.gender
    )
    ),
    );
    }
    })),
                          Positioned(

                                right: 130,
                                top: 120,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Shoulders",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Shoulders",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 140,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Chest",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Traps",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 170,
                                left: 100,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Biceps",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Triceps",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  }

                                )
                            ),
                            Positioned(
                                top: 170,
                                right: 110,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Biceps",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Triceps",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 220,
                                left: 60,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Forearms",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 220,
                                right: 60,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              Fetch(
                                                  choice: 1,
                                                  name: "Forearms",
                                                  gender: widget.gender
                                              )
                                      ),);
                                  },
                                )
                            ),
                            Positioned(
                                top: 230,
                                left: 170,
                                child: InkWell(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  //center
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Abdominals",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Lower back",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 220,
                                right: 140,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  //left side
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Abdominals",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Lats",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                            Positioned(
                                top: 220,
                                left: 140,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  //right side
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Abdominals",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                    else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Lats",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  }
                                )
                            ),
                            //
                            Positioned(
                                top: 350,
                                left: 140,
                                child: InkWell(
                                  child: Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    if (bodies[itemIndex].contains("front")) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Quads",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    } else {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Hamstrings",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    }
                                  })
                            ),
                          Positioned(
                              top: 300,
                              left: 150,
                              child: Material(
                                  child: InkWell(
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                    splashColor: c,
                                    onTap: () {
                                      setState(() {
                                        c = Colors.red;
                                      });
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                Fetch(
                                                    choice: 1,
                                                    name: "Glutes",
                                                    gender: widget.gender
                                                )
                                        ),);
                                    },
                                  )
                              )
                          ),
                            Positioned(
                                top: 470,
                                left: 120,
                                child: Material(
                                    child: InkWell(
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.red,
                                        ),
                                      ),
                                      splashColor: c,
                                      onTap: () {
                                        setState(() {
                                          c = Colors.red;
                                        });
                                        if (bodies[itemIndex].contains(
                                            "front")) {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    Fetch(
                                                        choice: 1,
                                                        name: "Quads",
                                                        gender: widget.gender
                                                    )
                                            ),);
                                        } else {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    Fetch(
                                                        choice: 1,
                                                        name: "Hamstrings",
                                                        gender: widget.gender
                                                    )
                                            ),);
                                        }
                                      })
                                )
                            ),
                            Positioned(
                                top: 470,
                                right: 120,
                                child: InkWell(
                                  child: Container(
                                    width: 8,
                                    height: 8,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              Fetch(
                                                  choice: 1,
                                                  name: "Calves",
                                                  gender: widget.gender
                                              )
                                      ),);
                                  },
                                )
                            ),
                          ],

                        // ),options: CarouselOptions(
                        //         onPageChanged:(int index, CarouselPageChangedReason reason){
                        //           setState(() {
                        //             current = index;
                        //           });
                        //         } ,
                        //         autoPlay: true,
                        //         scrollDirection: Axis.horizontal,
                        //         enableInfiniteScroll: true),
                        //     )),
                      )

    )
    )
    )
         );



  }

}


class Fetch extends StatefulWidget{
  int choice;
  String name;
  String gender;
  Fetch({Key? key, required this.name, required this.choice,required this.gender}) : super(key: key);

  @override
  _FetchDetails createState() => _FetchDetails();
}

class _FetchDetails extends State<Fetch>{
  late Future<Attributes> futureAttribute;
  late Future<List<dynamic>> futureDetails;
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  @override
  void initState() {
    super.initState();
    futureDetails = fetchExerciseDetails() as Future<List>;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.gender);
    return Scaffold(
      body: FutureBuilder<List<dynamic>>(
        future: futureDetails,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
          //add a switch case condition to verify the details
        switch(widget.choice) {
          case 1:
            if (snapshot.hasData) {
              List<dynamic> details = List.from(snapshot.data);
              List<dynamic> result = [];
              //segregate the data according to body parts
              for (var jsonobj in details) {
                int num = jsonobj['target'].length;
                switch (num) {
                  case 1:
                    if (jsonobj['target']['Primary'].contains(widget.name)) {
                      result.add(jsonobj);
                    }
                    break;

                  case 2:
                    if (jsonobj['target']['Primary'].contains(widget.name) ||
                        jsonobj['target']['Secondary'].contains(widget.name)) {
                      result.add(jsonobj);
                    }
                    break;
                  case 3:
                    if (jsonobj['target']['Primary'].contains(widget.name) ||
                        jsonobj['target']['Secondary'].contains(widget.name) ||
                        jsonobj['target']['Tertiary'].contains(widget.name)) {
                      result.add(jsonobj);
                    }
                    break;
                  default:
                    result.add(jsonobj);
                    break;
                }
              }
              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    //setting video URLS
                    Set<dynamic> videoURLS = result[index]['videoURL'].toSet();
                    Map<String, String> Map_values = {};
                    int param = 0;
                    for (var value in videoURLS) {
                      if(widget.gender == "Male") {
                        Map_values[param.toString()] =
                            value.toString().substring(0, value
                                .toString()
                                .length - 6);
                      }
                      ////the above step is been considered because there are no female videos associated in the above API, instead the slight change in string replacing male with female produces the result
                      else if(widget.gender == "Female") {
                        Map_values[param.toString()] =
                            value.toString().substring(0, value
                                .toString()
                                .length - 6);
                        print(
                            "check if it has a male(if yes replace with female) : ");
                        int pos = Map_values[param.toString()]!.indexOf(
                            r'male');
                        print(pos);
                        print(Map_values[param.toString()]?.substring(
                            pos, pos + 4));
                        Map_values[param.toString()] = Map_values[param.toString()]!.replaceRange(pos,pos+4,"female");
                        print("replaced and it is : ");
                        print(Map_values[param.toString()]);
                      }
                      param++;
                      print(value);
                    }

                    //setting instructions
                    List<dynamic> instructions = result[index]['steps']
                        .toList();
                    List<String> Steps = [];
                    for (var value in instructions) {
                      Steps.add(value.toString());
                    }
                    return GestureDetector(
                        onTap: () {},
                        child:
                        SizedBox(
                            width: double.infinity,
                            height: 120,
                            child: Card(
                                color: Color(0xFFE0E0E0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10
                                  ),

                                  child:
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                   Expanded(child: Text(
                                          result[index]['exercise_name'],
                                          style: TextStyle(fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),),),
                                        Container(
                                          height: 30,
                                        child : FloatingActionButton.extended(
                                          heroTag: null,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Display(
                                                          title: result[index]['exercise_name'],
                                                          Map_Values: Map_values,
                                                          Category: result[index]['Category'],
                                                          Difficulty: result[index]['Difficulty'],
                                                          Exercise_Name: result[index]['exercise_name'],
                                                          Steps: Steps
                                                      ),));
                                          },
                                          label: Text('Play',style: TextStyle(fontSize: 14,
                                              color: Colors.white), ),
                                          icon : Icon(
                                            Icons.play_arrow, size: 15,),
                                          backgroundColor: Colors.lightBlueAccent,
                                        )
                                        ),
                                      ]
                                  ),
                                )
                            )
                        ));
                  }
              );
            }
            else {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            break;
          case 2:
            if (snapshot.hasData) {
              List<dynamic> details = List.from(snapshot.data);
              List<dynamic> result = [];
              //segregate the data according to body parts
              for (var jsonobj in details) {
                if(jsonobj['Category'] == widget.name) {
                  result.add(jsonobj);
                }
              }

              return ListView.builder(
                  itemCount: result.length,
                  itemBuilder: (BuildContext context, int index) {
                    //setting video URLS
                    Set<dynamic> videoURLS = result[index]['videoURL'].toSet();
                    Map<String, String> Map_values = {};
                    int param = 0;
                    for (var value in videoURLS) {
                      Map_values[param.toString()] =
                          value.toString().substring(0, value
                              .toString()
                              .length - 6);
                      param++;
                    }

                    //setting instructions
                    List<dynamic> instructions = result[index]['steps']
                        .toList();
                    List<String> Steps = [];
                    for (var value in instructions) {
                      Steps.add(value.toString());
                    }
                    return GestureDetector(
                        onTap: () {},
                        child:  SizedBox(
                            width: double.infinity,
                            height: 120,
                            child: Card(
                                color: Color(0xFFE0E0E0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10
                                  ),

                                  child:
                                  Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(child: Text(
                                          result[index]['exercise_name'],
                                          style: TextStyle(fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),),),
                                        Container(
                                            height: 30,
                                            child : FloatingActionButton.extended(
                                              heroTag: null,
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Display(
                                                              title: result[index]['exercise_name'],
                                                              Map_Values: Map_values,
                                                              Category: result[index]['Category'],
                                                              Difficulty: result[index]['Difficulty'],
                                                              Exercise_Name: result[index]['exercise_name'],
                                                              Steps: Steps
                                                          ),));
                                              },
                                              label: Text('Play',style: TextStyle(fontSize: 14,
                                                  color: Colors.white), ),
                                              icon : Icon(
                                                Icons.play_arrow, size: 15,),
                                              backgroundColor: Colors.lightBlueAccent,
                                            )
                                        ),
                                      ]
                                  ),
                                )
                            )
                        ));
                  }
              );
            }
            else {
              return Center(
                  child: CircularProgressIndicator()
              );
            }
            break;
          default:
            return Center(
                child: CircularProgressIndicator()
            );

        }
      },
      )
    );
  }

}



class Display extends StatefulWidget {
  final Map<String, String> Map_Values;
  final String title;
  final String Category;
  final String Difficulty;
  final String Exercise_Name;
  final List<String> Steps;

  Display({Key? key,
    required this.title,
    required this.Map_Values,
    required this.Category,
    required this.Difficulty,
    required this.Exercise_Name,
    required this.Steps})
      : super(key: key);


  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {

  late VideoPlayerController _videoController;
  late bool _isPlaying = false;
  late bool _vol = false;
  late Duration _currentPosition = Duration.zero;
  late Duration _totalDuration = Duration.zero;
  String inkwell = "";
  String information = "Instructions are provided here";
  int currentVideoIndex = 0;
  late int count;
  bool isHeartBroken = false;


  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  void _initializeVideoController() {
    count = widget.Map_Values.length;
    _videoController = VideoPlayerController.network(
        widget.Map_Values.values.elementAt(currentVideoIndex))
      ..addListener(() {
        setState(() {
          _currentPosition = _videoController.value.position;
          _totalDuration = _videoController.value.duration;
        });
      })
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  void _togglePlay() {
    setState(() {
      _isPlaying = !_isPlaying;
      if (_isPlaying) {
        _videoController.play();
      } else {
        _videoController.pause();
      }
    });
  }

  void _changeVideo() {
    setState(() {
      currentVideoIndex = (currentVideoIndex + 1) % count;
      _videoController.dispose();
      _initializeVideoController();
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
        body: Column(
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
    return Container(
    child:  AspectRatio(
         aspectRatio: _videoController.value.aspectRatio,
         child: VideoPlayer(_videoController),
    ),
    );
    },
    ),
    ),
    Expanded(
    flex: 2,
    child: ClipRRect(

    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30.0),
    topRight: Radius.circular(30.0),
    ),
      child: Container(

        padding: EdgeInsets.all(10),
        color: Color(0xFFD3F9FA),
         child: Column(
           children: [
             // Text(_currentPosition.toString(),style: TextStyle(fontSize: 12),),
             Slider(value: _currentPosition.inMilliseconds.toDouble(),
                 min: 0,
                 max: _totalDuration.inMilliseconds.toDouble(),
                 label: _currentPosition.toString(),
                 activeColor: Colors.blue,
                 thumbColor: Colors.white,
                 onChanged:(value){
                   Duration newPosition = Duration(milliseconds: value.toInt());
    _videoController.seekTo(newPosition).then((_) {
                     setState(() {
                       _currentPosition = newPosition;
                     });
                   });
                 }),
            Row(
             children : [
               IconButton(
                 onPressed: _togglePlay,
                 icon: Icon(
                   _isPlaying ? Icons.pause : Icons.play_arrow,
                 ),
               ),
               // IconButton(
               //   onPressed: () {
               //     setState(() {
               //       _vol = !_vol;
               //     });
               //   },
               //   icon: _vol
               //       ? Icon(Icons.volume_up)
               //       : Icon(Icons.volume_off),
               // ),
              IconButton(
                 onPressed: _changeVideo,
                 icon: Image.asset(
                   'assets/icons/camera-rotate-light.png', // Replace with the path to your image
                   width: 40,  // Set an appropriate width for the icon
                   height: 30, // Set an appropriate height for the icon
                 ),
                color: Colors.cyanAccent,
               ),

               ]
            ),
        Padding(padding: EdgeInsets.only(bottom: 10),
          child:Text(widget.title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),),
        ),
    Expanded(
    child : Container(
    child: ListView.builder(
      itemCount: widget.Steps.length,
    itemBuilder: (BuildContext context, int index){
      return Padding(padding: EdgeInsets.all(5),child:Text((index+1).toString()+"  "+widget.Steps[index],style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),));
    }
    )

    )
    )
           ],
    ),
    ),
    )
    )
    ]
    )
    )
    );
  }
}
