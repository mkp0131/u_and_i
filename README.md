# u_and_i

## [flutter] 폰트 사용

- `pubspec.yaml` 에 `font` 를 지정
- `fontWeight` 는 기본적으로 지정해준다.

```dart
  fonts:
    - family: parisienne
      fonts:
        - asset: asset/font/Parisienne-Regular.ttf
    - family: sunflower
      fonts:
        - asset: asset/font/Sunflower-Light.ttf
        - asset: asset/font/Sunflower-Medium.ttf
        - asset: asset/font/Sunflower-Bold.ttf
```

- 사용

```dart
Text(
    '우리 처음 만날 날',
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: 'sunflower',
        fontWeight: FontWeight.w700,
        fontSize: 20),
  ),
```

## [flutter] 애플 다이얼로그 사용 데이터 픽커

```dart
IconButton(
    iconSize: 60,
    onPressed: () {
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
                    initialDateTime: selectedDate,
                    // 어떤걸 선택할 것인지 모드 설정
                    mode: CupertinoDatePickerMode.date,
                    // 선택 값이 변경되었을때 이벤트
                    onDateTimeChanged: (DateTime date) {
                      // print(date);
                    },
                  ),
                ));
          });
    },
```

## [flutter] 테마 설정

- 최상위 위젯 `MaterialApp` 에 `theme: ThemeData()` 을 설정

```dart
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'parisienne',
            fontSize: 60,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontFamily: 'sunflower',
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
```

- 위젯에서의 사용

```dart
  Widget build(BuildContext context) {
    // 테마 불러오기
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
```