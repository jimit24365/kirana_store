import 'package:logger/logger.dart';

class LoggerUtil {
  Logger logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0, // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
  );

  void e(dynamic message, [dynamic error, StackTrace stackTrace]) =>
      logger.e('[ERROR] $message', error, stackTrace);

  void w(dynamic message, [dynamic error, StackTrace stackTrace]) =>
      logger.w('[WARN] $message', error, stackTrace);

  void i(dynamic message, [dynamic error, StackTrace stackTrace]) =>
      logger.i('[INFO] $message', error, stackTrace);

  void d(dynamic message, [dynamic error, StackTrace stackTrace]) =>
      logger.d('[DEBUG] $message', error, stackTrace);

  void v(dynamic message, [dynamic error, StackTrace stackTrace]) =>
      logger.v('[VERBOSE]\n$message', error, stackTrace);
}
