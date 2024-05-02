import 'dart:io';
import 'dart:convert';
import 'dart:async';

Future<void> main(List<String> args) async {
  // 假设 'paths' 是一个包含要读取文件路径的列表。
  // 在这个例子中，我们将使用命令行参数作为文件路径。
  final paths = args;

  // 一个标志，用于确定是否显示行号。
  // 你可以根据需要或命令行选项将其设置为 true 或 false。
  final showLineNumbers = true;

  for (final path in paths) {
    var lineNumber = 1;
    final lines = utf8.decoder
        .bind(File(path).openRead())
        .transform(const LineSplitter());
    try {
      await for (final line in lines) {
        if (showLineNumbers) {
          stdout.write('${lineNumber++} ');
        }
        stdout.writeln(line);
      }
    } catch (_) {
      await _handleError(path);
    }
  }
}

Future<void> _handleError(String path) async {
  stderr.writeln('读取文件时出错: $path');
  // 设置退出码，表示出现错误。
  exitCode = 1;
}
