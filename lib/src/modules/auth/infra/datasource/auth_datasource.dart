import 'dart:typed_data';
import 'package:flutter_signin/src/modules/auth/domain/errors/auth_error.dart';
import 'package:flutter_signin/src/modules/auth/external/server_address.dart';
import 'package:flutter_signin/src/modules/auth/infra/adapter/auth_adapter.dart';
import 'package:flutter_signin/src/modules/auth/infra/proto/user.pb.dart';
import 'package:http/http.dart' as http;

class AuthDatasource {
  final client = http.Client();
  final AuthAdapter authSigninAdapter = AuthAdapter();

  Future<Uint8List?> login(User data) async {
    try {
      final req = authSigninAdapter.protoToData(data);
      if (req == null) return null;

      final res = await client.post(
        Uri.parse(signinRoute),
        body: req,
      );
      if (res.statusCode == 200) {
        return req;
      }
    } catch (e) {
      throw SigninError('error to signin');
    }
    return null;
  }
}