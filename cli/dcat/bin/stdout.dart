import 'dart:io';

void main() {
  // 设定要读取的文件路径，这里假设文件名为"textfile.txt"
  String filePath = 'textfile.txt';

  // 打开文件并读取内容
  File file = File(filePath);
  List<String> lines = file.readAsLinesSync();

  // 定义一个布尔变量来决定是否显示行号
  bool showLineNumbers = true;

  // 定义行号计数器
  int lineNumber = 1;

  // 遍历文件中的每一行
  for (String line in lines) {
    if (showLineNumbers) {
      // 如果showLineNumbers为true，则打印行号
      stdout.write('${lineNumber++} ');
    }
    // 打印行内容
    stdout.writeln(line);
  }
}
