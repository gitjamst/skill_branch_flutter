import 'models/user.dart';

class UserHolder {
  Map<String, User> users = {};

  registerUser(String fullName, String phone, String email) {
    var user = User(name: fullName, email: email, phone: phone);
    users[user.login] = user;
  }

  User getUserByLogin(String login) {
    return users[login];
  }

  User registerUserByEmail(String fullName, String email) {
    var user = User(name: fullName, email: email);
    if (users.containsKey(user.login))
      throw Exception("A user with this email already exists");
    users[user.login] = user;
    return user;
  }

  User registerUserByPhone(String fullName, String phone) {
    var user = User(name: fullName, phone: phone);
    if (users.containsKey(user.login))
      throw Exception("A user with this phone already exists");
    users[user.login] = user;
    return user;
  }

  setFriends(String login, List<User> friend) {
    users[login].addFriend(friend);
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
