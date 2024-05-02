import 'dart:io';
import 'dart:async';

Future<void> main(List<String> arguments) async {
  // 假设命令行参数的第一个参数是要检查的路径
  if (arguments.isEmpty) {
    stderr.writeln('请提供要检查的路径');
    exitCode = 1; // 设置退出码为1，表示用法错误
    return;
  }

  String path = arguments[0];

  // 检查路径是否为目录
  bool isDirectory = await FileSystemEntity.isDirectory(path);

  if (isDirectory) {
    stderr.writeln('错误: $path 是一个目录');
    exitCode = 1; // 可以设置退出码，表示路径检查错误
  } else {
    exitCode = 2; // 不是目录的情况
  }
}
