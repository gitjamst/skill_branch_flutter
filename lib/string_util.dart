//Extension - расширение. Будет расширять класс стринг внутри самого языка
//и выполнять определенный функционал

// extension MyString on String {
//   String capitalize(String s) =>
//       s[0].toUpperCase() + s.substring(1).toLowerCase();
// }

mixin UserUtils {
  String capitalize(String str) {
    if (str == null || str.length == 0) return str;
    return str[0].toUpperCase() +
        (str.length > 1 ? str.substring(1).toLowerCase() : '');
  }
}
