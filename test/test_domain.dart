import 'package:meduim_challenge/domain/my_domain.dart';

var d;
void get() async {
  d = await MyDomain.getData();
}

void main() {
  get();
  print(d);
}
