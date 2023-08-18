import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('asset/img/home.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          bottom: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Flexible(
                  flex: 5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
                Flexible(
                  flex: 50,
                  child: _MainPart(
                    selectedDate: selectedDate,
                    onPressed: onHeartPressed,
                  ),
                ),
                Flexible(
                  flex: 45,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onHeartPressed() {
    final now = DateTime.now();
    // dialog
    showCupertinoDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Align(
          // 정렬할 위치를 정해줘야 거기를 기준으로 높이를 형성
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.white,
            height: 300,
            child: CupertinoDatePicker(
              initialDateTime: selectedDate,
              maximumDate: DateTime(
                now.year,
                now.month,
                now.day,
              ),
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime date) {
                setState(() {
                  selectedDate = date;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

class _MainPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  const _MainPart({
    required this.selectedDate,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Text(
          'U&I',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'parisienne',
            fontSize: 80.0,
          ),
        ),
        Column(
          children: [
            const Text(
              '우리 처음 만난날',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 30.0,
              ),
            ),
            Text(
              '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'sunflower',
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        IconButton(
          iconSize: 60.0,
          onPressed: onPressed,
          icon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        ),
        Text(
          'D+${DateTime(
                now.year,
                now.month,
                now.day,
              ).difference(selectedDate).inDays + 1}',
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'sunflower',
              fontSize: 50.0,
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
