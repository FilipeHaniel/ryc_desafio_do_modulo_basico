
String? titleValidator(String? title) {
  if (title == null || title.isEmpty) {
    return 'Digite um título';
  }

  if (title.length < 3) {
    return 'o título deve ter no mínimo 3 letras';
  }

  return null;
}

String? dateValidator(String? date) {
  if (date == null || date.isEmpty) {
    return 'escolha uma data';
  }

  return null;
}

