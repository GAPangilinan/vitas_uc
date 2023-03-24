// import 'package:logger/logger.dart';

// final logger = (Type type) => Logger(printer: CustomPrinter(type.toString()));

// class CustomPrinter extends LogPrinter {
//   final String PageName;
//   CustomPrinter(this.PageName);

//   @override
//   List<String> log(LogEvent event) {
//     //throw UnimplementedError();
//     final color = PrettyPrinter.levelColors[event.level];
//     final emoji = PrettyPrinter.levelEmojis[event.level];
//     final message = event.message;

//     return [color!('$emoji $PageName: $message')];
//   }
// }
