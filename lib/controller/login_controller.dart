import 'package:aqueduct/aqueduct.dart';
import 'package:schat_server/schat_server.dart';

class LoginController extends ResourceController {

  @Operation.get("id")
  Future<Response> login(@Bind.path("id") int id) async {
    return Response.forbidden();
  }
}
