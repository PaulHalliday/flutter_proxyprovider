import 'package:flutter/foundation.dart';
import 'package:proxyprovider/application/services/greeting_service.dart';
import 'package:proxyprovider/application/services/user_service.dart';
import 'package:proxyprovider/domain/entities/user.dart';

class CartService {
  CartService({
    @required GreetingService greetingService,
    @required UserService userService,
  })  : _greetingService = greetingService,
        _userService = userService;

  GreetingService _greetingService;
  UserService _userService;

  String get cartGreeting => _greetingService.greeting;
  User get user => _userService.user;
}
