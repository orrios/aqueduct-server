import 'package:ip_message/ip_message.dart';

class Message extends ManagedObject<_Message> implements _Message {}

class _Message {
  @primaryKey
  int id;

  @Column()
  String content;

  @Column()
  String ip;
}