import 'dart:io';

void main() {
  stdout.writeln('Type something');
  final input = stdin.readLineSync();
  if (input != null) {
    stdout.writeln('You typed: $input');
  } else {
    stdout.writeln('No input received');
  }
}
