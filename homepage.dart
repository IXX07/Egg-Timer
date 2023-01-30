import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'dynamic_number.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Duration _timer = Duration.zero;
  int _hours = 0, _minutes = 0, _seconds = 0;

  void tick(Duration duration) async {
    setState(() {
      if (_timer > Duration.zero) {
        _timer -= duration;
      } else {
        _timer = Duration.zero;
      }
    });
  }

  void increaseHours() => setState(() => _hours++);
  void decreaseHours() => setState(() => _hours--);
  void increaseMinutes() => setState(() => _minutes++);
  void decreaseMinutes() => setState(() => _minutes--);
  void increaseSeconds() => setState(() => _seconds++);
  void decreaseSeconds() => setState(() => _seconds--);

  @override void initState() {
    super.initState();
    Ticker(tick).start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(50, 70, 50, 70),
            child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(40, 100, 40, 40),
                      child: Image.asset('assets/egg_timer.png')
                  ),
                  const LinearProgressIndicator(
                    value: 0.3,
                    minHeight: 6,
                    color: Color(0xFF00FF33),
                    backgroundColor: Colors.grey,
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DynamicNumber(value: _hours, onTapDown: decreaseHours, onTapUp: increaseHours),
                          const Text(':', style: TextStyle(color: Colors.white, fontSize: 35)),
                          DynamicNumber(value: _minutes, onTapDown: decreaseMinutes, onTapUp: increaseMinutes),
                          const Text(':', style: TextStyle(color: Colors.white, fontSize: 35)),
                          DynamicNumber(value: _seconds, onTapDown: decreaseSeconds, onTapUp: increaseSeconds)
                        ]
                    )
                  )
                ]
            )
        )
    );
  }
}
