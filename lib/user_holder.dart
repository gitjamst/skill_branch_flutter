import 'package:FlutterGalleryApp/models/user.dart';

class UserHolder {
  //Создаем, инициализируем пустую карту
  Map<String, User> users = {};

  void registerUser(String name, String phone, String email) {
    User user = User(name: name, phone: phone, email: email);
    print(user.toString());

    if (!users.containsKey(user.login)) {
      // users.addAll({user.login: user}); можно прописать также так.
      users[user.login] = user;
    } else {
      throw Exception('The user with this login already exist.');
    }
  }

  User getUserByLogin(String userLogin) {
    //Внешняя функция
    if (users.containsKey(userLogin)) {
      return users[userLogin];
    } else {
      throw Exception('The user can\'t exist.');
    }
  }

  User registerUserByPhone(String name, String phone) {
    User user = User.phone(name: name, phone: phone);

    if (!users.containsKey(user.login)) {
      // users.addAll({user.login: user}); можно прописать также так.
      users[user.login] = user;
      return user;
    } else {
      throw Exception('The user with this login already exist.');
    }
  }

  User registerUserByEmail(String name, String email) {
    User user = User.email(name: name, email: email);

    if (!users.containsKey(user.login)) {
      // users.addAll({user.login: user}); можно прописать также так.
      users[user.login] = user;
      return user;
    } else {
      throw Exception('The user with this login already exist.');
    }
  }

  User setFriends(String name, List<User> friends) {
    User user = User.friends(name: name, friends: friends);

    if (!users.containsKey(user.login)) {
      // users.addAll({user.login: user}); можно прописать также так.
      users[user.login] = user;
      return user;
    } else {
      throw Exception('The user with this login already exist.');
    }
  }

  // void registerUserByEmail(String name, String email) {
  //   User user = User(name: name, email: email);
  //   print(user.toString());

  //   if (!users.containsKey(user.login)) {
  //     // users.addAll({user.login: user}); можно прописать также так.
  //     users[user.login] = user;
  //   } else {
  //     throw Exception('The user with this login already exist.');
  //   }
  // }
}
