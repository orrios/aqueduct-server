import 'package:aqueduct/aqueduct.dart';
import 'package:ip_message/ip_message.dart';
import 'package:ip_message/model/message.dart';

final List<Message> messages = [];

class MessagesController extends ResourceController {
  MessagesController(this.context);
  final ManagedContext context;
  
  int lastId = 0;

  @Operation.get()
  Future<Response> getAllMessages() async {
    // final messageQuery = Query<Message>(context)
    //   ..sortBy((u) => u.id, QuerySortOrder.descending);
    // messageQuery.fetchLimit = 5;
    // final messages = await messageQuery.fetch();
    return Response.ok(messages);
  }

  @Operation.post()
  Future<Response> createMessage(@Bind.body() Message message) async {
    final String ip = request.connectionInfo.remoteAddress.address;
    print(ip);
    final query = Query<Message>(context)
      ..values = message
      ..values.ip = ip;
    // final insertedMessage = await query.insert();
    lastId ++;
    print(message);
    print(messages);
    message.ip = ip;
    message.id = lastId;
    messages.add(message);
    print(message);
    print(messages);
    
    if (messages.length > 5) {
      messages.remove(messages[0]);
    }
    return Response.ok(message);
  }
}
