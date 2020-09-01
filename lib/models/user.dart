import '../string_util.dart';

enum LoginType { email, phone }

class User with UserUtils {
  String email;
  String phone;
  String _firstName;
  String _lastName;
  String _password;
  List<User> friends;
  LoginType _type;

  User._(
      {String firstName,
      String lastName,
      String email,
      String phone,
      String password}) {
    _firstName = capitalize(firstName);
    _lastName = capitalize(lastName);
    this.email = email;
    this.phone = phone;
    this._password = password;
    this.friends = [];
    _type = email == null ? LoginType.phone : LoginType.email;
  }

  factory User({String name, String phone, String email, String password}) {
    if (name == null || name.isEmpty)
      throw Exception('name should not be empty');
    if ((phone == null || phone.isEmpty) && (email == null || email.isEmpty))
      throw Exception('phone or email must be not empty');
    return User._(
        firstName: _getFirstName(name),
        lastName: _getLastName(name),
        email: email != null ? _checkEmail(email) : email,
        phone: phone != null ? _checkPhone(phone) : phone,
        password: password);
  }

  static String _checkEmail(String email) {
    if (!email.contains('@')) throw Exception("Email doesn't valid");
    return email;
  }

  addFriend(List<User> users) => this.friends.addAll(users);

  List<User> get getFriends => friends;
  User addFriends(User u, List<User> friend) {
    u.friends.addAll(friend);
    return u;
  }

  static String _getFirstName(fullName) => fullName.split(" ")[0];
  static String _getLastName(fullName) => fullName.split(" ")[1];

  String get firstName => _firstName;
  String get lastName => _lastName;
  String get name => '$_firstName $_lastName';
  String get login => _type == LoginType.email ? email : phone;

  static String _checkPhone(String phone) {
    if (phone == null || phone.trim().isEmpty)
      throw Exception("Enter don't empty phone number");
    phone = phone.replaceAll(RegExp('[^+\\d]'), '');
    if (phone.isEmpty) throw Exception("Enter don't empty phone number");
    if (phone[0] != '+' || phone.length != 12)
      throw Exception(
          'Enter a valid phone number starting with a + and containing 11 digits');
    return phone;
  }

  @override
  String toString() {
    return '''
      fistName: $_firstName
      lastName: $_lastName
      email: $email
      phone: $phone
    ''';
  }

  @override
  bool operator ==(Object obj) {
    if (obj == null) return false;
    if (obj is User) {
      return (_firstName == obj._firstName) &&
          (_lastName == obj._lastName) &&
          (phone == obj.phone) &&
          (email == obj.email);
    }
    return false;
  }

  @override
  int get hashCode => this.hashCode;
}
