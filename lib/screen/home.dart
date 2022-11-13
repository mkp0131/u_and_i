import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime selectedDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  DateTime nowDate =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

  onPressed() {
    // 애플 다이얼로그
    showCupertinoDialog(
        context: context,
        // builder 외의 영역을 클릭시 다이얼로그 CLOSE!
        barrierDismissible: true,
        // 빌더 함수: 다이얼로그의 내부 위젯
        builder: (BuildContext context) {
          // Align 이 없다면, 전체를 가득 채움
          return Align(
              // 다이얼로그 내부 위젯의 위치 설정
              alignment: Alignment.bottomCenter,
              // 다이얼로그 내부 위젯
              child: Container(
                color: Colors.white,
                height: 300,
                // 애플 데이터 픽커
                child: CupertinoDatePicker(
                  // 처음 선택된 값
                  initialDateTime: selectedDate,
                  // MAX DATE
                  maximumDate: nowDate,
                  // 어떤걸 선택할 것인지 모드 설정
                  mode: CupertinoDatePickerMode.date,
                  // 선택 값이 변경되었을때 이벤트
                  onDateTimeChanged: (DateTime date) {
                    setState(() {
                      selectedDate = date;
                    });
                    // print(date);
                  },
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              TopPart(
                selectedDate: selectedDate,
                nowDate: nowDate,
                onPressed: onPressed,
              ),
              BottomPart(),
            ],
          )),
    );
  }
}

class TopPart extends StatelessWidget {
  DateTime nowDate;
  DateTime selectedDate;
  VoidCallback onPressed;

  TopPart(
      {required this.selectedDate,
      required this.nowDate,
      required this.onPressed,
      Key? key})
      : super(key: key);

  dateFormat(DateTime date) {
    return '${date.year}.${date.month}.${date.day}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'U & I',
          textAlign: TextAlign.center,
          style: textTheme.headline1,
        ),
        Column(
          children: [
            Text(
              '우리 처음 만날 날',
              textAlign: TextAlign.center,
              style: textTheme.headline2,
            ),
            SizedBox(
              height: 4,
            ),
            Text(dateFormat(selectedDate), textAlign: TextAlign.center),
          ],
        ),
        IconButton(
            iconSize: 60,
            onPressed: onPressed,
            icon: const Icon(
              Icons.favorite,
              color: Colors.pink,
            )),
        Text(
          'D + ${nowDate.difference(selectedDate).inDays + 1}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'sunflower',
              fontWeight: FontWeight.w700,
              letterSpacing: -3,
              fontSize: 40,
              color: Colors.white),
        )
      ],
    ));
  }
}

class BottomPart extends StatelessWidget {
  const BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.png'));
  }
}
