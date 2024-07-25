import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: clock(),
    );
  }
}

class clock extends StatefulWidget {
  clock({super.key});

  @override
  State<clock> createState() => _clockState();
}

class _clockState extends State<clock> {
//  TimeOfDay time = TimeOfDay(hour: 07, minute: 30);
  DateTime data = DateTime.now();//اقدر اسخدمها لعرض التاريخ والوقت

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${data.day}/${data.month}/${data.year}  -  ${data.hour}:${data.minute}",
              //  "${time.hour}:${time.minute}",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () async {
                DateTime? newData = await showDatePicker(
                    context: context,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100));

                if (newData == null) return;

                TimeOfDay? newtime = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay(hour: data.hour, minute: data.minute));
                if (newtime == null) return;

                final newdatatime = DateTime(
                  newData.year,
                  newData.month,
                  newData.day,
                  newtime.hour,
                  newtime.minute

                );
                setState(() {
                  data = newdatatime;
                });
              },
              child: Text(
                "select time & data",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 175, 108, 130))),
            )
          ],
        ),
      ),
    );
  }
}
