import 'dart:developer' as dev show log;

class Logger {
  static void log(String message) {
    dev.log(message);
  }

  static void red(String message) {
    const red = '\x1B[31m';
    dev.log("$red$message");
  }

  static void green(String message) {
    const green = '\x1B[32m';
    dev.log("$green$message");
  }

  static void yellow(String message) {
    const yellow = '\x1B[33m';
    dev.log("$yellow$message");
  }

  // purple
  static void purple(String message) {
    const purple = '\x1B[35m';
    dev.log("$purple$message");
  }

  // white
  static void white(String message) {
    const white = '\x1B[37m';
    dev.log("$white$message");
  }

  // cyan
  static void cyan(String message) {
    const cyan = '\x1B[36m';
    dev.log("$cyan$message");
  }
}
