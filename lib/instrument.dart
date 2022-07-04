import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'constants.dart';

class InstrumentPage extends StatefulWidget {

  @override
  _InstrumentPageState createState() => _InstrumentPageState();
}

class _InstrumentPageState extends State<InstrumentPage> {

  final cachePlayer = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  int check = 0;
  int checkInfo = 0;
  int inc = 1;
  Widget musicIcon = kMusicIcon;

  _instrumentText(){

        if (inc == 1){
          return kText1;
        }
        else if (inc ==2){
          return kText2;
        }
        else if (inc ==3){
          return kText3;
        }
        else if (inc ==4){
          return kText4;
        }
        // else if (inc ==5){
        //   return kText5;
        // }
        // else if (inc ==6){
        //   return kText6;
        // }

  }

  void _playFile() async {
    musicIcon = kMusicIconActive;
    audioPlayer = await cachePlayer.play('audios/instrument'+inc.toString()+'.mp3');
    check = 1; // assign player here

  }

  void _stopFile() {
    audioPlayer.stop();
    check = 0;
    musicIcon = kMusicIcon;
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
       Expanded(
         child: Image.asset('assets/images/map'+inc.toString()+'.png',),),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (check == 0) {
                        _playFile();
                      } else {
                        _stopFile();
                      }
                    });
                  },
                  child: Image.asset('assets/images/instrument'+inc.toString()+'.png'),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(onPressed: () {
                      setState(() {
                        if(inc <=1){
                          inc = 4;
                        }
                        else{
                          inc--;
                        }
                        _stopFile();
                      });
                    }, child: kBackIcon),
                    const SizedBox(
                      width: 50,
                    ),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (check == 0) {
                              _playFile();

                            } else {
                              _stopFile();
                            }
                          });
                        },
                        child: musicIcon),
                    const SizedBox(
                      width: 50,
                    ),
                    FlatButton(
                        onPressed: () {
                          setState(() {
                            if(inc >=4){
                              inc = 1;
                            }
                            else{
                              inc++;
                            }
                            _stopFile();
                          });
                        },
                        child: kForwardIcon),
                  ],
                ),
              ),
            ],
          ),
        ),
         Expanded(
           child: Container(
             margin: const EdgeInsets.only(right: 50.0,),
            child: _instrumentText(),
        ),

         ),
      ],
    );
  }
}

