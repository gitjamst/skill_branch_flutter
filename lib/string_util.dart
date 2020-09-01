mixin UserUtils {
  capitalize(String str) {
    if (str == null || str.length == 0) return str;
    return str[0].toUpperCase() +
        (str.length > 1 ? str.substring(1).toLowerCase() : '');
  }
}
