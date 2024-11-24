import 'package:spring_service/data/data_providers/auth_user_data.dart';
import 'package:spring_service/data/models/app_user_model.dart';
import 'package:spring_service/data/models/auth_response_model.dart';

class AuthRepository {
  final AuthUserData auth;

  AuthRepository(this.auth);

  Future<String> register(AppUserModel user) async {
    final response = await auth.register(user);
    return response;
  }

  Future<AuthResponseModel> login(String email, String password) async {
    final response = await auth.login(email, password);
    return response;
  }
}
