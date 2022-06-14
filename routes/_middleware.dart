import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:firebase_auth_admin_verify/firebase_auth_admin_verify.dart';
import 'package:frog_firebase_auth_sample/frogs_repository.dart';
import 'package:frog_firebase_auth_sample/frogs_service.dart';
import 'package:frog_firebase_auth_sample/utils/db_connection.dart';

Handler middleware(Handler handler) {
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load(['.env']);

  return handler.use(_authValidator()).use(requestLogger()).use(
        provider<FrogsService>(
          (context) => FrogsService(
            FrogsRepository(DBConnection(dotEnv)),
          ),
        ),
      );
}

Middleware _authValidator() {
  return (handler) {
    return (context) async {
      try {
        final token =
            context.request.headers['Authorization'].toString().split(' ')[1];
        final jwt = await verifyFirebaseToken(token);

        return handler(
          context.provide<String>(() => jwt.payload['sub'] as String),
        );
      } catch (e) {
        return Response(statusCode: HttpStatus.unauthorized);
      }
    };
  };
}
