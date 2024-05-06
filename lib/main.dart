import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "LaunchPad",
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "LaunchPad",
                style: GoogleFonts.orbitron(
                  textStyle: TextStyle(
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.black,
            body: Center(
              child: Wrap(
                spacing: 8,
                runSpacing: 6,
                children: [
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "12.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "24.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "2.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "1.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "3.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "4.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "5.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "6.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "7.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "8.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "9.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "10.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "11.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "12.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "13.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "14.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "15.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "16.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "17.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "18.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "19.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "20.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "21.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "22.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "23.mp3"),
                  Pad(Color(0xffff2525), Color(0xffc40050), "27.mp3"),
                  Pad(Color(0xffADCBFC), Color(0xff067CCb), "26.mp3"),
                  Pad(Color(0xffE247FC), Color(0xffA23AB7), "25.mp3"),
                ],
              ),
            ),
          ),
        ));
  }
}

class Pad extends StatefulWidget {
  const Pad(this.colorCenter, this.colorOutline, this.note);

  final Color colorCenter;
  final Color colorOutline;
  final String note;

  @override
  State<Pad> createState() => _PadState();
}

class _PadState extends State<Pad> {
  final player = AudioPlayer();

  late Color _colorCenter;
  late Color _colorOutline;

  @override
  void initState() {
    _colorCenter = widget.colorCenter;
    _colorOutline = widget.colorOutline;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () async {
        setState(() {
          _colorCenter = Colors.white;
          _colorOutline = Colors.white;
          player.play(AssetSource(widget.note));
        });
        await Future.delayed(
          Duration(milliseconds: 500),
        );
        setState(() {
          _colorCenter = widget.colorCenter;
          _colorOutline = widget.colorOutline;
        });
      },
      child: Container(
        height: height / 8.2,
        width: width / 4.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          boxShadow: [BoxShadow(color: Colors.pink, blurRadius: 5.0)],
          gradient: RadialGradient(
            colors: [_colorCenter, _colorOutline],
            radius: 0.5,
          ),
        ),
      ),
    );
  }
}
