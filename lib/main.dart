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
                        height: 500.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                          color: Color(0xff000000),
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 10),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: const Text(
                                  'PASSWORD RESET',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Container(
                                color: Colors.grey.shade900,
                                child: Container(
                                  color: Colors.grey.shade900,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 20.0), // Spacer
                                      // Text
                                      Text(
                                        'Enter the email ID associated with your account and we will send you a new password',
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors
                                              .white, // Change text color as needed
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 20.0), // Spacer
                                      // Text Box and Reverse Arrow Button
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex:
                                                3, // Adjust the flex as needed
                                            child: TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Enter text',
                                                hintStyle: TextStyle(color: Colors.white),
                                                suffixIconColor: Colors.white,
                                                border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.white, style: BorderStyle.solid),
                                                ),
                                              ),
                                              style: TextStyle(
                                                  color: Colors
                                                      .white), // Change text color as needed
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: IconButton(
                                              icon: Icon(Icons.arrow_back,
                                              color: Colors.white,),
                                              onPressed: () {
                                                // Add your button's functionality here
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                    CustomPaint(
                      painter: LeftButtonBorderPainter(),
                      child: Container(
                        height: 40.0,
                      ),
                    ),
                    CustomPaint(
                      painter: RightButtonBorderPainter(),
                      child: Container(
                        height: 40.0,
                      ),
                    ),
                    CustomPaint(
                      painter: ImagePlaceholderExternalBorderPainter(),
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

    path.lineTo(size.width - 50.0, size.height);
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

    const height = 500.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(50.0, 0.0);

    // path.lineTo(50.0, 0.0);
    path.lineTo(0.0, 50.0);

    path.lineTo(0.0, height - 50.0);
    path.lineTo(50.0, height);

    path.lineTo(width - 50.0, height);
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

    const height = 500.0;
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

class LeftButtonBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.white;

    const height = 500.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(60.0, height - 40.0);
    path.lineTo(40.0, height - 60.0);

    path.lineTo(40.0, height - 100.0);
    path.lineTo(140.0, height - 100.0);

    path.lineTo(140.0, height - 40.0);

    path.lineTo(60.0, height - 40.0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RightButtonBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.white;

    const height = 500.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(width - 60.0, height - 40.0);
    path.lineTo(width - 40.0, height - 60.0);

    path.lineTo(width - 40.0, height - 100.0);
    path.lineTo(width - 140.0, height - 100.0);

    path.lineTo(width - 140.0, height - 40.0);

    path.lineTo(width - 60.0, height - 40.0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class ImagePlaceholderExternalBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..color = Colors.white;

    const height = 400.0;
    const width = 350.0;

    Path path = Path();
    // path start with (0.0, 0.0) point
    path.moveTo(150.0, 50.0);
    path.lineTo(200.0, 50.0);

    path.lineTo(275.0, 180.0);
    path.lineTo(250.0, 210.0);

    path.lineTo(100.0, 210.0);
    path.lineTo(75.0, 180.0);

    path.lineTo(150.0, 50.0);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
