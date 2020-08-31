//Extension - расширение. Будет расширять класс стринг внутри самого языка
//и выполнять определенный функционал

extension MyString on String {
  String capitalize(String s) =>
      s[0].toUpperCase() + s.substring(1).toLowerCase();
}
