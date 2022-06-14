import 'package:dart_frog/dart_frog.dart';
import 'package:frog_firebase_auth_sample/frogs_repository.dart';
import 'package:frog_firebase_auth_sample/models/frog.dart';

class FrogsService {
  FrogsService(this._frogsRepository);
  final FrogsRepository _frogsRepository;

  Future<Response> addFrogToUser(
    String userId,
    Map<String, dynamic> frogData,
  ) async {
    final frog = Frog.fromJson(
      {
        ...frogData,
        'user_id': userId,
      },
    );

    final dbResult = await _frogsRepository.addFrog(frog);

    if (dbResult.affectedRowCount > 0) {
      return Response();
    } else {
      return Response(statusCode: 400);
    }
  }

  Future<Response> getUserFrogs(String userId) async {
    final dbResult = await _frogsRepository.getFrogsByUser(userId);

    return Response.json(
      body: <String, List<Frog>>{'frogs': dbResult},
    );
  }
}
