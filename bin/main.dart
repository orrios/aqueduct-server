import 'package:ip_message/ip_message.dart';

Future main() async {
  final app = Application<IpMessageChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 80;

  final count = Platform.numberOfProcessors ~/ 2;
  await app.start(numberOfInstances: count > 0 ? count : 1);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}