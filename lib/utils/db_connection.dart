import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class DBConnection {
  DBConnection(this.dotEnv);
  final DotEnv dotEnv;

  late PostgreSQLConnection db;

  Future<void> open() async {
    final connection = PostgreSQLConnection(
      dotEnv['DB_HOST'] ?? 'localhost',
      int.parse(dotEnv['DB_PORT'] ?? '8080'),
      dotEnv['DB_NAME'] ?? 'dart_test',
      username: dotEnv['DB_USERNAME'] ?? 'dart',
      password: dotEnv['DB_PASSWORD'] ?? 'dart',
    );

    db = connection;
    await db.open();
  }

  Future<void> close() async {
    await db.close();
  }
}
