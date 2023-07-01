import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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



//while clicking
class musclewiki extends StatefulWidget {
  const musclewiki({super.key});

  @override
  State<musclewiki> createState() => _musclewikiState();
}

class _musclewikiState extends State<musclewiki> {
  Color c = Colors.white;
  @override
  Widget build(BuildContext context) {
         return SafeArea(
             child: Scaffold(
               backgroundColor: Colors.white,
               body: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(

                        top: 10,
                        child: InkWell(
                          child: Image.asset("assets/images/head.png",width: 150,height:150),
                          onTap: (){

                          },
                        )
                      ),
                      Positioned(
                          left: 30,
                          top: 110,
                          child: InkWell(
                              child: Image.asset("assets/images/shoulder1.png",width: 150,height: 150),
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
                          right: 20,
                          top: 120,
                          child: InkWell(
                              child: Image.asset("assets/images/shoulder2.png",width: 150,height: 150),
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
                          top: 130,
                          child: InkWell(
                              child: Image.asset("assets/images/chest.png",width: 150,height: 150),
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
                          top: 190,
                          left: 25,
                          child: InkWell(
                            child: Image.asset("assets/images/bicep2.png",width: 80,height: 80),
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
                          top: 190,
                          right: 25,
                          child: InkWell(
                            child: Image.asset("assets/images/bicep1.png",width: 80,height: 80),
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
                          top: 240,
                          left: -40,
                          child: InkWell(
                            child: Image.asset("assets/images/hand1.png",width: 120,height: 120),
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
                          right: -40,
                          child: InkWell(
                              child: Image.asset("assets/images/hand2.png",width: 120,height: 120),
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
                          left: 58,
                          child: InkWell(
                            child: Image.asset("assets/images/obliques2.png",width: 150,height: 180),
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
                          top: 230,
                          right: 62,
                          child: InkWell(
                            child: Image.asset("assets/images/obliques1.png",width: 150,height: 180),
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
                          top: 240,

                          child: InkWell(
                            child: Image.asset("assets/images/abdomin.png",width: 200,height: 180),
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
                          top: 380,

                          child: InkWell(
                            child: Image.asset("assets/images/thighs.png",width: 180,height: 180),
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
                          top: 550,
                          left: 60,
                          child: Material(
                              child : InkWell(
                            child: Image.asset("assets/images/leg1.png",width: 380,height: 200),
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
                          top: 550,
                          right:50,
                          child: InkWell(
                            child: Image.asset("assets/images/leg2.png",width: 380,height: 200),
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
                  ),
               ),
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
  int currentVideoIndex = 0;
  late int count;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  void _initializeVideoController() {
    count = widget.Map_Values.length;
    _videoController = VideoPlayerController.network(widget.Map_Values.keys.elementAt(currentVideoIndex))
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(inkwell),
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

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       child: _videoController.value.isInitialized
  //           ? Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Text(widget.Map_Values.values.elementAt(0)),
  //           AspectRatio(
  //             aspectRatio: _videoController.value.aspectRatio,
  //             child: VideoPlayer(_videoController),
  //           ),
  //           InkWell(
  //             onTap: (){
  //               setState(() {
  //                 inkwell = 'Current position: ${_currentPosition.toString()}';
  //               });
  //             },
  //             onDoubleTap: (){
  //               'Total Duration: ${_totalDuration.toString()}';
  //             },
  //             child:Container(
  //               color: Colors.green,
  //
  //               child: Center(
  //                 child: Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child:Text(
  //                       inkwell
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //
  //         ],
  //       )
  //           : CircularProgressIndicator(),
  //     ),
  //     floatingActionButton: FloatingActionButton(
  //       onPressed: _togglePlay,
  //       child: Icon(
  //         _isPlaying ? Icons.pause : Icons.play_arrow,
  //       ),
  //     ),
  //   );
  // }

