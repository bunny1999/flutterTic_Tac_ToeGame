import 'package:flutter/material.dart';

class LogicalPart extends StatefulWidget {
  @override
  _LogicalPartState createState() => _LogicalPartState();
}

class _LogicalPartState extends State<LogicalPart> {
  List<String> gameState;
  String message;
  bool isCross = true;
  //TODO: insert Assests images
  AssetImage circle = AssetImage('images/circle.png');
  AssetImage cross = AssetImage('images/cross.png');
  AssetImage edit = AssetImage('images/edit.png');
  
  //TODO: initial state
  @override
  void initState(){
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }
  //TODO: reset state
  reset(){
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }
  //TODO: program funtioning
  programFuntion(int index){
    if(this.gameState[index] == 'empty'){
      setState(() {
        if(this.isCross){
          this.gameState[index] = 'Cross';
        }
        else{
          this.gameState[index] = 'Circle';
        }
        this.isCross = !this.isCross;
        this.winingLogic();
      });
    }
  }
  //TODO:Get Images
  AssetImage getImages(var value){
    switch(value){
      case 'empty':
      return edit;
      break;
      case 'Cross':
      return cross;
      break;
      case 'Circle':
      return circle;
      break;
    }
  }
  //TODO: Wining Logic
  winingLogic(){
    if((this.gameState[0]!= 'empty')&&
    (this.gameState[0]==this.gameState[1])&&
    (this.gameState[1]==this.gameState[2])
    ){
      this.message = '${this.gameState[0]} Wins!';
    }
    else if((this.gameState[3]!= 'empty')&&
    (this.gameState[3]==this.gameState[4])&&
    (this.gameState[4]==this.gameState[5])
    ){
      this.message = '${this.gameState[3]} Wins!';
    }
    else if((this.gameState[6]!= 'empty')&&
    (this.gameState[6]==this.gameState[7])&&
    (this.gameState[7]==this.gameState[8])
    ){
      this.message = '${this.gameState[6]} Wins!';
    }
    else if((this.gameState[0]!= 'empty')&&
    (this.gameState[0]==this.gameState[3])&&
    (this.gameState[3]==this.gameState[6])
    ){
      this.message = '${this.gameState[0]} Wins!';
    }
    else if((this.gameState[1]!= 'empty')&&
    (this.gameState[1]==this.gameState[4])&&
    (this.gameState[4]==this.gameState[7])
    ){
      this.message = '${this.gameState[1]} Wins!';
    }
    else if((this.gameState[2]!= 'empty')&&
    (this.gameState[2]==this.gameState[5])&&
    (this.gameState[5]==this.gameState[8])
    ){
      this.message = '${this.gameState[2]} Wins!';
    }
    else if((this.gameState[0]!= 'empty')&&
    (this.gameState[0]==this.gameState[4])&&
    (this.gameState[4]==this.gameState[8])
    ){
      this.message = '${this.gameState[0]} Wins!';
    }
    else if((this.gameState[2]!= 'empty')&&
    (this.gameState[2]==this.gameState[4])&&
    (this.gameState[4]==this.gameState[6])
    ){
      this.message = '${this.gameState[2]} Wins!';
    }
    else if(!this.gameState.contains("empty")){
      this.message = 'Game Drow';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TicTackToe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context,i) => SizedBox(
                width: 100.0,
                height: 100.0,
                child: MaterialButton(
                  onPressed: () {
                    this.programFuntion(i);
                  },
                  child: Image(
                    image: this.getImages(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(this.message,
            style:TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
            color: Colors.purple,
            onPressed: (){
              this.reset();
            },
            child: Text('Reset Game',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
          ),
          MaterialButton(
            padding: EdgeInsets.all(10.0),
            child: Text('learncodeonline.in',style: TextStyle(fontSize: 20.0),),
          )
        ],
      ),
    );
  }
}