import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'helper.dart';

void main() => runApp(Phoenix(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '2D Puzzle Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<int> goal = [1, 2, 3, 4, 5, 6, 7, 8, 0];
  List<int> start = [1, 2, 3, 4, 5, 6, 7, 8, 0];
  int moves = 0;
  bool gameRunning = true;

  @override
  void initState() {
    super.initState();
    shuffler();
  }

  shuffler() {
    setState(() {
      start.shuffle();
    });
  }

  swapPosition(int posX) {
    if (isEmptyAround(posX) && gameRunning) {
      setState(() {
        int posY = start.indexOf(0);
        int temp = start[posX];
        start[posX] = start[posY];
        start[posY] = temp;
        moves++;
        if (ifequal(start, goal)) {
          setState(() {
            gameRunning = false;
          });
        }

      });
    }
  }

  bool isEmptyAround(int x) {
    if (x == 0) {
      if (start[1] == 0 || start[3] == 0) {
        return true;
      }
    } else if (x == 1) {
      if (start[0] == 0 || start[2] == 0 || start[4] == 0) {
        return true;
      }
    } else if (x == 2) {
      if (start[1] == 0 || start[5] == 0) {
        return true;
      }
    } else if (x == 3) {
      if (start[0] == 0 || start[4] == 0 || start[6] == 0) {
        return true;
      }
    } else if (x == 4) {
      if (start[1] == 0 || start[3] == 0 || start[5] == 0 || start[7] == 0) {
        return true;
      }
    } else if (x == 5) {
      if (start[2] == 0 || start[4] == 0 || start[8] == 0) {
        return true;
      }
    } else if (x == 6) {
      if (start[3] == 0 || start[7] == 0) {
        return true;
      }
    } else if (x == 7) {
      if (start[6] == 0 || start[4] == 0 || start[8] == 0) {
        return true;
      }
    } else if (x == 8) {
      if (start[5] == 0 || start[7] == 0) {
        return true;
      }
    } else {
      return false;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.black,
        ),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.black,
        title: const Text('2D PUZZLE'),
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
                visible: !gameRunning,
                child: const Text(
                  'Nice job!!! You Done It!!!',
                  style: TextStyle(fontSize: 22, color: Colors.black87),
                )),
            Visibility(
                visible: !gameRunning,
                child: const SizedBox(
                  height: 32,
                )),
            Text(
              'Total Moves: $moves',
              style: const TextStyle(fontSize: 22, color: Colors.black87),
            ),
            const SizedBox(
              height: 32,
            ),
            SizedBox(
              width: 336,
              child: Wrap(spacing: 6, runSpacing: 6, children: <Widget>[
                GestureDetector(
                  onTap: () {
                    swapPosition(0);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[0] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[0].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[0] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(1);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[1] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[1].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[1] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(2);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[2] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[2].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[2] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(3);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[3] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[3].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[3] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    swapPosition(4);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[4] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[4].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[4] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(5);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[5] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[5].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[5] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(6);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[6] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[6].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[6] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(7);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[7] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[7].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[7] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    swapPosition(8);
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    color: start[8] == 0 ? Colors.white : Colors.greenAccent,
                    child: Center(
                        child: Text(
                      start[8].toString(),
                      style: TextStyle(
                        fontSize: 44,
                        color: start[8] == 0 ? Colors.white : Colors.black,
                      ),
                    )),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {
                  Phoenix.rebirth(context);
                },
                child: const Text(
                  'New Game',
                  style: TextStyle(fontSize: 20),
                ))
          ],
        ),
      ),
    );
  }
}
