import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(
            child: Text("Internship Project"),
          ),
          backgroundColor: Colors.blue,
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: SimpleClipper(),
                    child: Container(
                      height: 700.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                        color: Color(0xff000000),
                      ),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  child: Text(
                                    'PASSWORD RESET',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24.0,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Container(
                                  height: 700.0 / 4, // 1/4 of the black part
                                  width: 350.0,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: BorderPainter(),
                    child: Container(
                      height: 40.0,
                    ),
                  ),
                  CustomPaint(
                    painter: FatBorderPainter(),
                    child: Container(
                      height: 40.0,
                    ),
                  ),
                ],
                ),
                // Grey part (1/4 of the black part)

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SimpleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path();
//    uncomment this and will get the border for all lines
    path.moveTo(50.0, 0.0);

    // path.lineTo(50.0, 0.0);
    path.lineTo(0.0, 50.0);

    path.lineTo(0.0, size.height - 50.0);
    path.lineTo(50.0, size.height);

    path.lineTo(size.width -  50.0, size.height);
    path.lineTo(size.width, size.height - 50.0);

    path.lineTo(size.width, 50.0);
    path.lineTo(size.width - 50.0, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

}

class BorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0
      ..color = Colors.white;

    const height = 700.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(50.0, 0.0);

    // path.lineTo(50.0, 0.0);
    path.lineTo(0.0, 50.0);

    path.lineTo(0.0, height - 50.0);
    path.lineTo(50.0, height);

    path.lineTo(width -  50.0, height);
    path.lineTo(width, height - 50.0);

    path.lineTo(width, 50.0);
    path.lineTo(width - 50.0, 0.0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class FatBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10.0
      ..color = Colors.white;

    const height = 700.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(100.0, 0.0);
    path.lineTo(50.0, 0.0);
    path.lineTo(0.0, 50.0);
    path.lineTo(0.0, 150.0);

    path.moveTo(0.0, height - 150.0);
    path.lineTo(0.0, height - 50.0);
    path.lineTo(50.0, height);
    path.lineTo(100.0, height);

    path.moveTo(width - 100.0, height);
    path.lineTo(width - 50.0, height);
    path.lineTo(width, height - 50.0);
    path.lineTo(width, height - 150.0);

    path.moveTo(width, 150.0);
    path.lineTo(width, 50.0);
    path.lineTo(width - 50.0, 0.0);
    path.lineTo(width - 100.0, 0.0);

    // path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}