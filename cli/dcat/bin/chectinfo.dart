import 'dart:io';
import 'dart:async';

Future<void> main(List<String> arguments) async {
  // 确保提供了路径参数
  if (arguments.isEmpty) {
    stderr.writeln('Usage: dart script.dart <path>');
    exitCode = 1; // 设置退出码为1，表示用法错误
    return;
  }

  // 获取命令行参数中的路径
  String path = arguments[0];

  // 检查路径是否为目录
  try {
    bool isDirectory = await FileSystemEntity.isDirectory(path);
    if (isDirectory) {
      stderr.writeln('error: $path is a directory');
      exitCode = 1; // 设置退出码为1，表示路径是一个目录
    } else {
      exitCode = 2; // 设置退出码为2，表示路径不是一个目录
    }
  } on FileSystemException catch (e) {
    stderr.writeln('FileSystemException: ${e.message}');
    exitCode = 3; // 设置退出码为3，表示文件系统异常
  }
}
