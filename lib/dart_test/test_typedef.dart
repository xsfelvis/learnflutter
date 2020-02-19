typedef LoggerOutputFunction = void Function(String msg);

class Logger {
  LoggerOutputFunction out;

  Logger() {
    out = print;
  }

  void log(String msg) {
    out(msg);
  }
}

void timestampLoggerOutputFunction(String msg) {
  String timeStamp = new DateTime.now().toString();
  print('${timeStamp}: $msg');
}

void main() {
  Logger l = new Logger();
  l.log('Hello World');
  l.out = timestampLoggerOutputFunction;
  l.log('Hello World');
}
