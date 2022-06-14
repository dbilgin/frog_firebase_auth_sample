import 'package:frog_firebase_auth_sample/models/frog.dart';
import 'package:frog_firebase_auth_sample/utils/db_connection.dart';
import 'package:postgres/postgres.dart';

class FrogsRepository {
  FrogsRepository(this._dbConnection);
  final DBConnection _dbConnection;

  Future<PostgreSQLResult> addFrog(Frog frog) async {
    await _dbConnection.open();
    final query = await _dbConnection.db.query(
      '''
      INSERT INTO frog
      (
        frog_name,
        user_id
      )
      VALUES
      (
        @frog_name,
        @user_id
      );
      ''',
      substitutionValues: frog.toJson(),
    );
    await _dbConnection.close();

    return query;
  }

  Future<List<Frog>> getFrogsByUser(String userId) async {
    final userIdValue = {'userId': userId};
    await _dbConnection.open();
    final List<List<dynamic>> queryResult = await _dbConnection.db.query(
      'SELECT * FROM frog WHERE user_id = @userId',
      substitutionValues: userIdValue,
    );
    await _dbConnection.close();

    final frogs = <Frog>[];

    for (final row in queryResult) {
      frogs.add(
        Frog(
          id: row[0] as int?,
          frogName: row[1] as String?,
          userId: row[2] as String?,
        ),
      );
    }

    return frogs;
  }
}
