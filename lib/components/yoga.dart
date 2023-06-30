import 'package:flutter/material.dart';

class yoga extends StatefulWidget {
  const yoga({super.key});

  @override
  State<yoga> createState() => _yogaState();
}

class _yogaState extends State<yoga> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
              pinned: true,
              expandedHeight: 100,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.menu),
                )
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.zero,
              sliver: SliverList(
                  delegate: SliverChildListDelegate(
                      [
                    SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,bottom: 10),
                                child: Text(
                                    "Hi, Name",
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0,bottom: 20),
                                child: Text(
                                  "How are you feeling today?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),

                            ],
                          ),
                          Center(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(20)
                              ),
                              color: Color(0xFFCEF8FA),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width/1.2,
                                height: MediaQuery.of(context).size.height/5,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                        child: Text("Name of workout"),
                                      top: 30,
                                      left:30,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                        left: 30,
                                        child:FloatingActionButton.small(
                                          backgroundColor: Colors.lightBlue,
                                            onPressed: (){},
                                          child: Icon(Icons.play_arrow),
                                        )
                                    ),
                                    Positioned(
                                      right: 10,
                                        child: Image.asset(
                                            "assets/images/poseeee.png",
                                          width: 200,
                                          height: 200,
                                        )),

                                  ],
                                ),
                              )

                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    20.0), // Adjust the padding value as per your requirement
                                child: Text(
                                  'Recommended Flows',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            child:ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder:(context,index){
                                  return Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side:BorderSide(
                                        color: Color(0xFF2DCBD0),
                                        width: 2
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Stack(
                                      children: [
                                        ClipRect(

                                          child: Ink.image(
                                              image: AssetImage("assets/images/poseeee.png"),
                                              fit: BoxFit.cover,
                                            height: 140,
                                            width: 150,
                                          ),
                                        ),
                                        Positioned(
                                          right: 10,
                                          bottom: 10,
                                            child: SizedBox(
                                              height: 30,
                                              width: 30,
                                              child: FloatingActionButton.small(
                                                  onPressed: (){},
                                                child: Icon(Icons.play_arrow,size: 20,),
                                                backgroundColor: Colors.lightBlueAccent,
                                                  
                                              
                                              )
                                            ))
                                      ],
                                    ),


                                  );
                                } ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(
                                    20.0), // Adjust the padding value as per your requirement
                                child: Text(
                                  'Continue Flows',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                    )
                  ]
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
