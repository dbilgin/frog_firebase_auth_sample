import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:frog_firebase_auth_sample/frogs_service.dart';

Future<Response> onRequest(RequestContext context) async {
  final frogssService = context.read<FrogsService>();
  final userId = context.read<String>();

  if (context.request.method == HttpMethod.post) {
    final requestData = await context.request.json();
    return frogssService.addFrogToUser(userId, requestData);
  } else if (context.request.method == HttpMethod.get) {
    return frogssService.getUserFrogs(userId);
  }

  return Response(statusCode: HttpStatus.methodNotAllowed);
}
