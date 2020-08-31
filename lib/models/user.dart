import 'package:FlutterGalleryApp/string_utils.dart';

//emum - энумерованный объект, содержащий какие-либо значения
enum loginType { email, phone }

class User {
  String email;
  String phone;
  String password;

  String _lastName;
  String _firstName;
  loginType _type;

  List<User> friends = <User>[];

  User._(
      {String firstName,
      String lastName,
      String phone,
      String email,
      List<User> friends})
      : _firstName = firstName,
        _lastName = lastName,
        this.phone = phone,
        this.email = email {
    print('User is created.');
    _type = email != null ? loginType.email : loginType.phone;
  }

//В фектори создается инстанс и мы можем сделать логику до создания самого инстанса
  factory User({String name, String phone, String email}) {
    if (name.isEmpty) throw Exception("User name is empty");
    if (phone?.isEmpty == true && email?.isEmpty == true)
      throw Exception('phone and email is empty');
    // if (phone.isEmpty && email.isEmpty)
    //   throw Exception("phone or email name is empty");
//Возвращаем приватный констуктор
//Фэктори инстанс имеет одно пространство имен, при вызове юзера мы будем обращаться
//не просто к конструктору, а будем вызывать эту же фектори и у нас может
//произойти клоужер, когда один объект будет вызывать сам себя. Это не совсем корректно.
//Как исправить? Создаем внутренний приватный конструктор, который не будет доступен извне.
//User._(); - приватный конструктор без имени. Приватность это и есть имя.
    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      phone: checkPhone(phone),
      email: checkEmail(email),
    );
  }

  factory User.phone({String name, String phone}) {
    if (name.isEmpty) throw Exception("User name is empty");
    if (phone?.isEmpty == true) throw Exception('phone is empty');

    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      phone: checkPhone(phone),
    );
  }

  factory User.email({String name, String email}) {
    if (name.isEmpty) throw Exception("User name is empty");
    if (email?.isEmpty == true) throw Exception('email is empty');

    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      email: checkEmail(email),
    );
  }

  factory User.friends({String name, List<User> friends}) {
    if (name.isEmpty) throw Exception("User name is empty");
    if (friends?.isEmpty == true) throw Exception('friends is empty');

    return User._(
      firstName: _getFirstName(name),
      lastName: _getLastName(name),
      friends: friends,
    );
  }

  //Почему функция должна быть статической. поскольку инстанс юзера еще не создан,
  //тем самым у нас нет доступа к данной функции.
  static String _getLastName(String userName) => userName.split(" ")[1];
  static String _getFirstName(String userName) => userName.split(" ")[0];

  static String checkPhone(String phone) {
    String pattern = r"^(?:[+0])?[0-9]{11}";
    phone = phone.replaceAll(RegExp("[^+\\d]"), "");

    if (phone == null || phone.isEmpty) {
      throw Exception("Enter don't empty number.");
    } else if (!RegExp(pattern).hasMatch(phone)) {
      throw Exception(
          "Enter valid phone number starting with + and containing 11 digits.");
    }
    return phone;
  }

  static String checkEmail(String email) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
    // email = email.replaceAll(RegExp("[^+\\d]"), "");

    if (email == null || email.isEmpty) {
      throw Exception("checkEmail: Enter don't empty email.");
    } else if (!RegExp(pattern).hasMatch(email)) {
      throw Exception(
          "Enter valid email number starting with + and containing 11 digits.");
    }
    return email;
  }

  // String get login {
  //   if (_type == loginType.phone) {
  //     return phone;
  //   } else {
  //     return email;
  //   }
  // }
  //Более компактный код
  String get login {
    if (_type == loginType.phone) return phone;
    return email;
  }

  //Get User By Login
  String get getUserByLogin {
    if (_type == loginType.email) return email;
    return phone;
  }

  String get name => "${"".capitalize(_firstName)} ${"".capitalize(_lastName)}";

  //Фишка языка - переопределение самих операторов языка.
  @override
  bool operator ==(Object object) {
    if (object == null) {
      return false;
    }
    if (object is User) {
      return _firstName == object._firstName &&
          _lastName == object._lastName &&
          (phone == object.phone || email == object.email);
    }
  }

  void addFriend(Iterable<User> newFriend) {
    friends.addAll(newFriend);
  }

  void removeFriend(User user) {
    friends.remove(user);
  }

  String get userInfo => '''
  name: $name
  email: $email
  firstName: $_firstName
  lastName: $_lastName
  friends: ${friends.toList()}
  ''';

  @override
  String toString() {
    return '''
  name: $name
  email: $email  
  phone: $phone
  friends: ${friends.toList()}
  ''';
  }
}
