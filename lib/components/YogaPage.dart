import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';
import 'package:video_player/video_player.dart';
import 'package:collection/collection.dart';


//declare Global Variables
Map<String,String> recommended_flows = {"assets/images/cardio_yoga1.jpg":"Cardio Yoga","assets/images/gym_avatar.jpeg":"Gym Workouts","assets/images/medition.jpeg":"Meditation","assets/images/sense_organs.jpg":"Sense Organ Exercises","assets/images/streching_exercise.png":"Streching Exercises"} ;
Map<String,String> cards = {"assets/images/back_bending_pose.jpg":"Back Flexion","assets/images/pigeon_pose.jpg":"Pigeon Pose","assets/images/bridge_pose.jpg":"Bridge Pose"};

class ExerciseDetails extends StatefulWidget{
  const ExerciseDetails({super.key});

  @override
  ExerciseDetailsState createState() => ExerciseDetailsState();
}

class ExerciseDetailsState extends State<ExerciseDetails> {
  int count1 = 0;
  int count2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Health Page"),
          backgroundColor: Colors.white,
          elevation: 50.0,
          leading: IconButton(
            icon: CircleAvatar(
              backgroundColor: Colors.redAccent,
              radius: 50,),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: "Menu Icon",
              onPressed: () {},
            ),
          ]
      ),
      body: SafeArea(
        child:Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.all(15.0), // Adjust the padding value as per your requirement
                child:
                Text('Hi, Aadish',style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Padding(padding: EdgeInsets.all(10.0),
                child: Text(" What are you going to explore today?",style: TextStyle(fontWeight: FontWeight.bold)),),
              Container(

                child : CarouselSlider.builder(
                  itemCount: cards.length,
                  itemBuilder: (BuildContext context,int index,int pageIndex) =>
                      Card(
                        clipBehavior: Clip.hardEdge,
                        child: InkWell(
                            child: Image.asset(
                              cards.keys.elementAt(index),
                              width: 1000,
                              height: 200,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Extended()),
                              );
                            }
                        ),
                      ),
                  options:CarouselOptions(
                    onPageChanged: (int index, CarouselPageChangedReason reason){
                      setState(() {
                        count1=index;
                      });
                    } ,
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.9,
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(20.0), // Adjust the padding value as per your requirement
                child:
                Text('Recommended Flows',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 25),),
              ),
              Container(
                child : CarouselSlider.builder(
                  itemCount: recommended_flows.length,
                  itemBuilder:(BuildContext context, int item_index , int page_index) => Container(
                    height: 100,
                    // width: MediaQuery.of(context).size.width,
                    child: Stack(
                        alignment: Alignment.center,
                        children : [
                          OutlinedButton(

                              style: ButtonStyle(
                                side: MaterialStateProperty.resolveWith<BorderSide>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.disabled)) {
                                      return BorderSide(color: Colors.white);
                                    }
                                    return BorderSide(color: Colors.green);
                                  },
                                ),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Image.asset(
                                      recommended_flows.keys.elementAt(item_index),
                                      //
                                      // width: MediaQuery.of(context).size.width,
                                      // height: 1000,
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                      right: 0,
                                      bottom:2,
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: Colors.lightBlueAccent),
                                            color: Colors.blue
                                        ),
                                        child : IconButton(
                                            onPressed:() {},
                                            icon: const Icon(Icons.play_arrow,color: Colors.white,)),
                                      ),
                                    ),
                                  ]),
                              onPressed:() {}
                          ),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 1.0),
                                  color: Colors.white,
                                  child:
                                  Text(recommended_flows.values.elementAt(item_index),style: TextStyle(color: Colors.black))
                              ))]),

                  ),
                  options: CarouselOptions(
                    onPageChanged: (int item_index, CarouselPageChangedReason reason){
                      setState(() {
                        count2 = item_index;
                      });
                    } ,
                    height: 200.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 0.7,
                  ),
                ),
              )],
          ),
        ),
      ),
    );
  }

}

class GymPage extends StatelessWidget{
  const GymPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(

          children: [
            InkWell(
                child: Image.network("https://cdn.dribbble.com/users/2919618/screenshots/9163918/media/18f9f947ebde1566cd82d1558504ff8d.gif"),
                onTap: () {
                  showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                            height: 500,
                            color: Colors.white70,
                            child: Center(
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text('GYM WORKOUTS', style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24.0,
                                      ),),
                                      Padding(padding: EdgeInsets.all(2.0),
                                          child: Text("Pairing your back and biceps in one workout has been a classic muscle-building session for decades.Do You Wanna Try?"
                                            ,style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.0,
                                            ),)),
                                      Card(
                                          margin: const EdgeInsets.all(20),

                                          child: Scrollbar(
                                            child : Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text('DAILY JOURNALS' ,style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24.0,
                                                ),),
                                                ListTile(
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                  leading: Image.network("https://t4.ftcdn.net/jpg/01/18/68/67/360_F_118686756_s9ZuI4WhhDBlklwzjt9QwoEjzyllnq6W.jpg"),
                                                  title: const Text('WEIGHT LIFTING'),
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => GymVideo()),
                                                    );
                                                  },
                                                ),
                                                const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                                                ListTile(
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                  leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy4a4UtEScnMeLwPbWBu7cOvwSfHEe1a4Bsg&usqp=CAU"),
                                                  title: const Text('BOXING BAG WORKOUT'),
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => GymVideo()),
                                                    );
                                                  },
                                                ),
                                                const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                                                ListTile(
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                  leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtnSvxOU6e8Xszm9GMKJSSb65Vqx-Yl1VdFQ&usqp=CAU"),
                                                  title: const Text('PULL A TIRE'),
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => GymVideo()),
                                                    );
                                                  },
                                                ),
                                                const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                                                ListTile(
                                                  trailing: Icon(Icons.keyboard_arrow_right),
                                                  leading: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm5BgQEgpsptxSqMSvR_P8QTMOg19z-ltNqQ&usqp=CAU"),
                                                  title: const Text('TREND MILL'),
                                                  onTap: (){
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => GymVideo()),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                      )
                                    ]
                                )
                            )
                        );
                      }
                  );
                }

            )
          ],
        ),
      ),
    );
  }

}


List<String> s = ["https://vod-progressive.akamaized.net/exp=1687977964~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2097%2F17%2F435487731%2F1898139448.mp4~hmac=5717811f3e49894dae5939a11ca5faaa601f39fae9de25631c3628192687d912/vimeo-prod-skyfire-std-us/01/2097/17/435487731/1898139448.mp4",
  "https://vod-progressive.akamaized.net/exp=1687981143~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1652%2F17%2F433261063%2F1885875477.mp4~hmac=95cf8e0232545e60c604322c77712ec4a010b7e67b5c20556aa0ce77e0cfc7a5/vimeo-prod-skyfire-std-us/01/1652/17/433261063/1885875477.mp4"
      "https://vod-progressive.akamaized.net/exp=1687981327~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4368%2F14%2F371843102%2F1544316419.mp4~hmac=634f870d5887849ef6dff077336e5346a874d050388049d24ffd9709183bcb77/vimeo-prod-skyfire-std-us/01/4368/14/371843102/1544316419.mp4"
      "https://vod-progressive.akamaized.net/exp=1687981538~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F168%2F12%2F300844990%2F1149641815.mp4~hmac=d0f2a60f5f2651d6c58a1d3217af688846e155df9d3ddbc6bc16cbfea168af29/vimeo-prod-skyfire-std-us/01/168/12/300844990/1149641815.mp4"
];






class Extended extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Container(
                width: 25,
                child:  Image.asset("assets/images/pigeon_pose.gif",width: 100,height: 700,)

            )
          ],
        ),
      ),
    );
  }

}

class Extended2 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class Extended3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}



class Extended4 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class GymVideo extends StatefulWidget{
  @override

  _GymVideoPlayerScreenState createState() => _GymVideoPlayerScreenState();

}

class _GymVideoPlayerScreenState extends State<GymVideo> {
  late VideoPlayerController _videoController;
  late bool _isPlaying = false;
  late Duration _currentPosition = Duration.zero;
  late Duration _totalDuration = Duration.zero;
  String inkwell = "";
  @override
  void initState() {
    super.initState();
    String video_url = "https://vod-progressive.akamaized.net/exp=1687977964~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F2097%2F17%2F435487731%2F1898139448.mp4~hmac=5717811f3e49894dae5939a11ca5faaa601f39fae9de25631c3628192687d912/vimeo-prod-skyfire-std-us/01/2097/17/435487731/1898139448.mp4";
    _videoController = VideoPlayerController.network(video_url)
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _videoController.value.isInitialized
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _videoController.value.aspectRatio,
              child: VideoPlayer(_videoController),
            ),
            InkWell(
              onTap: (){
                setState(() {
                  inkwell = 'Current position: ${_currentPosition.toString()}';
                });
              },
              onDoubleTap: (){
                'Total Duration: ${_totalDuration.toString()}';
              },
              child:Container(
                color: Colors.green,

                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text(
                        inkwell
                    ),
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
    );

  }



}
