///lib/application/services/user_service.dart
import 'package:proxyprovider/domain/entities/user.dart';

class UserService {
  User _user;
  User get user => _user;

  setUser(User user) {
    _user = user;
  }
}
