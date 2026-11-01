extension StringX on String {
  String get title => split(' ').map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1)).join(' ');
  bool get isBlank => trim().isEmpty;
}

void main() {
  print('hello big world'.title);
  print('   '.isBlank);
}
