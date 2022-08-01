import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterDown(),
    );
  }
}

class CounterDown extends StatefulWidget {
  const CounterDown({Key? key}) : super(key: key);

  @override
  State<CounterDown> createState() => _CounterDownState();
}

class _CounterDownState extends State<CounterDown> {
  int secondsNumber = 4;
  Timer? repaitedFunction;
  startTimer() {
    repaitedFunction =
        Timer.periodic((const Duration(seconds: 1)), (mycallback) {
      setState(() {
        if (secondsNumber > 0) {
          secondsNumber--;
        } else {
          mycallback.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Down App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text((secondsNumber > 0) ? '$secondsNumber Seconds' : 'Very good'),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      startTimer();

                      if (secondsNumber == 0) {
                        setState(() {
                          secondsNumber = 4;
                        });
                      }
                    },
                     style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                    child: Text((secondsNumber>0)? 'Start': 'Try again')
                    
                    ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      repaitedFunction!.cancel();
                    },
                     style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 25, 120, 197)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(14)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9))),
                ),
                    child: const Text('Stop')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
