import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:updated_health_app/components/workoutsAPI.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


//initialize exercise videos

//while clicking shoulders
Map<String,String> shoulders_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-1-front.mp4#t=0.1":"Shoulders Stretch Variation One Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-1-side.mp4#t=0.1":"Shoulders Stretch Variation One Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-2-front.mp4#t=0.1":"Shoulders Stretch Variation Three Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-2-side.mp4#t=0.1":"Shoulders Stretch Variation Three Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-3-front.mp4#t=0.1":"Shoulders Stretch Variation Four Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-shoulders-stretch-variation-3-side.mp4#t=0.1":"Shoulders Stretch Variation Four Side Angle"};


//while clicking chest
Map<String,String> chest_workouts = {"https://media.musclewiki.com/media/uploads/videos/branded/female-barbell-bench-press-front.mp4#t=0.1":"Barbell Bench Press Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-barbell-bench-press-side.mp4#t=0.1":"Barbell Bench Press Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-bodyweight-pushup-front.mp4#t=0.1":"Push Up Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-bodyweight-pushup-side.mp4#t=0.1":"Push Up Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-dumbbell-incline-bench-press-front_ctz2966.mp4#t=0.1":"Dumbbell Incline Bench Press Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-dumbbell-incline-bench-press-side_cQCX9or.mp4#t=0.1":"Dumbbell Incline Bench Press Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-dumbbell-incline-chest-flys-front.mp4#t=0.1":"Dumbbell Incline Chest Flys Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-dumbbell-incline-chest-flys-side.mp4#t=0.1":"Dumbbell Incline Chest Flys Side Angle",
  };

//while clicking biceps
Map<String,String> biceps_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-1-front.mp4#t=0.1":"Biceps Stretch Variation One Side Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-1-side.mp4":"Biceps Stretch Variation One Front Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-3-front.mp4#t=0.1":"Biceps Stretch Variation Two Front Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-3-side.mp4":"Biceps Stretch Variation Two Side Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-4-front.mp4#t=0.1":"Biceps Stretch Variation Three Front Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-biceps-stretch-variation-4-side.mp4#t=0.1":"Biceps Stretch Variation Three Front Angle"
};

//while clicking hands
Map<String,String> hands_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-forearm-stretch-variation-1-front.mp4#t=0.1":"Forearms Stretch Variation One Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-forearms-stretch-variation-1-side.mp4":"Forearms Stretch Variation One Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-forearms-stretch-variation-3-front.mp4#t=0.1":"Forearms Stretch Variation Two Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-forearms-stretch-variation-3-side.mp4":"Forearms Stretch Variation Two Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-forearms-stretch-variation-4-front.mp4#t=0.1":"Forearms Stretch Variation Three Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-forearms-stretch-variation-4-side.mp4#t=0.1":"Forearms Stretch Variation Three Front Angle"
};

//while clicking abdominals
Map<String,String> oblique_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-2-front.mp4#t=0.1":"Abdominals Stretch Variation Two Front Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-2-side.mp4#t=0.1":"Abdominals Stretch Variation Two Side Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-3-front.mp4#t=0.1":"Abdominals Stretch Variation Three Front Angle",
                                      "https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-3-side.mp4#t=0.1":"Abdominals Stretch Variation Three Side Angle",
                                       "https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-4-front.mp4#t=0.1":"Abdominals Stretch Variation Four Front Angle",
                                       "https://media.musclewiki.com/media/uploads/videos/branded/female-abdominals-stretch-variation-4-side.mp4#t=0.1":"Abdominals Stretch Variation Four Side Angle"};



//while clicking thighs
Map<String,String> thighs_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-1-front.mp4#t=0.1":"Quads Stretch Variation One Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-1-side.mp4#t=0.1":"Quads Stretch Variation One Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-2-front.mp4#t=0.1":"Quads Stretch Variation Three Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-2-side.mp4#t=0.1":"Quads Stretch Variation Three Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-3-front.mp4#t=0.1":"Quads Stretch Variation Four Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-3-side.mp4#t=0.1":"Quads Stretch Variation Four Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-4-front.mp4#t=0.1":"Quads Stretch Variation Four Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-quads-stretch-variation-4-side.mp4#t=0.1":"Quads Stretch Variation Four Side Angle"};

//while clicking Calves
Map<String,String> calves_workout = {"https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-1-front.mp4#t=0.1":"Calves Stretch Variation One Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-1-side.mp4#t=0.1":"Calves Stretch Variation One Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-2-front.mp4#t=0.1":"Calves Stretch Variation Three Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-2-side.mp4#t=0.1":"Calves Stretch Variation Three Side Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-3-front.mp4#t=0.1":"Calves Stretch Variation Four Front Angle",
  "https://media.musclewiki.com/media/uploads/videos/branded/female-calves-stretch-variation-3-side.mp4#t=0.1":"Calves Stretch Variation Four Side Angle"};




//images are
List<String> bodies = ["assets/images/women_front.png","assets/images/man_front.png","assets/images/women_rear.png","assets/images/man_rear.png"];
class musclewiki extends StatefulWidget {
  const musclewiki({super.key});

  @override
  State<musclewiki> createState() => _musclewikiState();
}

class _musclewikiState extends State<musclewiki> {
  late Future<List<dynamic>> data;

  Future<List<dynamic>> fetchExercises() async {
    final url =
    Uri.parse("https://musclewiki.p.rapidapi.com/exercises/attributes");
    final response = await http.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'b5456f97e6msh1dd2f8e51c41572p1fb1e6jsnfba016683d97',
        'X-RapidAPI-Host': 'musclewiki.p.rapidapi.com'
      },
    );
    var JSONobj = json.decode(response.body);
    return JSONobj["muscles"];
  }

  //ExerciseFetcher exerciseFetcher = ExerciseFetcher();
  Color c = Colors.white;
  int current = 0;
  @override
  void initState() {
    super.initState();
    data = fetchExercises() as Future<List>; // Call fetchExercises() here
  }


  Widget build(BuildContext context) {
    print(data.toString());
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
                          ,fit: BoxFit.contain),

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
                          onTap: (){

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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "SHOULDERS EXERCISES",
                                      Map_Values: shoulders_workout
                                  ),),);

                            },
                          )
                      ),
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "SHOULDERS EXERCISES",
                                      Map_Values: shoulders_workout
                                  ),),);

                            },
                          )
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
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Display(
                                      title: "CHEST EXERCISES",
                                      Map_Values: chest_workouts
                                    ),),);
                              },
                          )
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "BICEPS EXERCISES",
                                      Map_Values: biceps_workout
                                  ),),);

                            },
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "BICEPS EXERCISES",
                                      Map_Values: biceps_workout
                                  ),),);

                            },
                          )
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "HAND EXERCISES",
                                      Map_Values: hands_workout
                                  ),),);

                            },
                          )
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
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => Display(
                                        title: "HAND EXERCISES",
                                        Map_Values: hands_workout
                                    ),),);

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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "ABDOMEN EXERCISES",
                                      Map_Values: chest_workouts
                                  ),),);

                            },
                          )
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "ABDOMEN EXERCISES",
                                      Map_Values: chest_workouts
                                  ),),);

                            },
                          )
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "ABDOMEN EXERCISES",
                                      Map_Values: chest_workouts
                                  ),),);

                            },
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
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "THIGHS EXERCISES",
                                      Map_Values: thighs_workout
                                  ),),);

                            },
                          )
                      ),
                      Positioned(
                          top: 470,
                          left: 120,
                          child: Material(
                              child : InkWell(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            splashColor: c,
                            onTap: (){
                              setState(() {
                                c = Colors.red;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "LEG EXERCISES",
                                      Map_Values: calves_workout
                                  ),),);

                            },
                          )
                          )
                      ),
                      Positioned(
                          top: 470,
                          right:120,
                          child: InkWell(
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Display(
                                      title: "CALVES EXERCISES",
                                      Map_Values: calves_workout
                                  ),),);

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


class Display extends StatefulWidget {
  final Map<String, String> Map_Values;
  String title;


  Display({Key? key, required this.title, required this.Map_Values})
      : super(key: key);


  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {


  late VideoPlayerController _videoController;
  late bool _isPlaying = false;
  late Duration _currentPosition = Duration.zero;
  late Duration _totalDuration = Duration.zero;
  String inkwell = "";
  String information = "Instructions are provided here";
  int currentVideoIndex = 0;
  late int count;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  void _initializeVideoController() {
    count = widget.Map_Values.length;
    _videoController = VideoPlayerController.network(
        widget.Map_Values.keys.elementAt(currentVideoIndex))
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
    return Scaffold(
      body: Center(
        child: _videoController.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.title,style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),) ,
            Padding(padding: EdgeInsets.all(2.0),
                child : Text(widget.Map_Values.values.elementAt(currentVideoIndex),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0,
                  ),)),
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  inkwell = 'Current position: ${_currentPosition.toString()}';
                });
              },
              onDoubleTap: () {
                setState(() {
                  inkwell = 'Total Duration: ${_totalDuration.toString()}';
                });
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(inkwell),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  information = 'check for more details';
                });
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Text(information),
                  ),
                ),
              ),
            ),
          ],
        )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePlay,
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          onPressed: _changeVideo,
          icon: Icon(Icons.skip_next),
        ),
      ),
    );
  }
}
