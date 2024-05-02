import 'dart:io';

Future<void> main() async {
  // 创建一个 File 对象
  final quotes = File('textfile.txt');

  // 要追加到文件的引用。
  const stronger = 'That which does not kill us makes us stronger. -Nietzsche';

  // 追加引用到文件。
  // 如果文件不存在，它将被创建。
  try {
    await quotes.writeAsString(stronger, mode: FileMode.append);
    print('引用已追加到文件中。');
  } catch (e) {
    print('写入文件时出现错误：$e');
  }
}
