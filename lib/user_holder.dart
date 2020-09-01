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

  void setFriends(String name, List<User> friends) {
    users[name].friends = friends;
  }

  User findUserInFriends(String login, User usersFriend) {
    for (var friend in users[login].friends) {
      if (friend == usersFriend) return friend;
    }
    throw Exception("fried not found");
  }

  List<User> importUsers(List<String> users) {
    String email;
    String phone;
    String fullName;
    List<User> result = [];
    users.forEach((element) {
      var usersList = element.replaceAll('\n', '').trim().split(';');
      if (usersList.length != 0) {
        usersList.forEach((el) {
          if (el != '') {
            if (el.contains('@')) {
              email = el.trim();
            } else if (el.contains('+')) {
              phone = el.trim();
            } else {
              fullName = el.trim();
            }
          }
        });
        result.add(User(name: fullName, phone: phone, email: email));
      }
    });
    return result;
  }
}
