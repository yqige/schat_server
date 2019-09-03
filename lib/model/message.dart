import 'dart:convert';

enum MessageType{
  text,image,voice
}
class Message{
  Message(dynamic str){
    final incoming = json.decode(str.toString());
    from = incoming['from'] as int;
    to = incoming['to'] as int;
    type = MessageType.values.elementAt(incoming['type'] as int);;
    content = incoming['content'] as String;
  }
  int from;
  int to;
  MessageType type;
  String content;
}
