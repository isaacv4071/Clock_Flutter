import 'package:clock_flutter/widgets/clock_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      backgroundColor: const Color(0xFF2D2F41),
      body: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildMenuButton('Clock', 'assets/clock_icon.png'),
              buildMenuButton('Alarm', 'assets/alarm_icon.png'),
              buildMenuButton('Timer', 'assets/timer_icon.png'),
              buildMenuButton('Stopwatch', 'assets/stopwatch_icon.png'),
            ],
          ),
          const VerticalDivider(color: Colors.white, width: 2),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text('Clock',
                        style: TextStyle(
                            fontFamily: 'avenir',
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                            fontSize: 24)),
                  ),
                  const SizedBox(height: 32.0),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formatedTime,
                            style: const TextStyle(
                                fontFamily: 'avenir',
                                color: Colors.white,
                                fontSize: 64)),
                        Text(formatedDate,
                            style: const TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w300,
                                color: Colors.white,
                                fontSize: 20)),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      fit: FlexFit.tight,
                      child: Align(
                          alignment: Alignment.center,
                          child: ClockView(
                            size: MediaQuery.of(context).size.height / 4,
                          ))),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Timezone',
                            style: TextStyle(
                                fontFamily: 'avenir',
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 24)),
                        const SizedBox(height: 16.0),
                        Row(
                          children: [
                            const Icon(Icons.language, color: Colors.white),
                            const SizedBox(width: 16.0),
                            Text('UTC$offsetSign$timezoneString',
                                style: const TextStyle(
                                    fontFamily: 'avenir',
                                    color: Colors.white,
                                    fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMenuButton(String title, String image) {
    return TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 5),
        ),
        onPressed: () {},
        child: Column(
          children: [
            Image(image: AssetImage(image), width: 40.0),
            const SizedBox(height: 16),
            Text(title,
                style: const TextStyle(
                    color: Colors.white, fontSize: 14, fontFamily: 'avenir')),
          ],
        ),
    );
  }
}
