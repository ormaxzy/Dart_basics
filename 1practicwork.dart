import 'dart:math';

Point<int> First_Task(int a, int b) {
  int gcd(int a, int b) {
    int x;
    if (a < b) {
      x = b;
      b = a;
      a = x;
    }

    while (b > 0) {
      a = a % b;
      x = b;
      b = a;
      a = x;
    }

    return a;
  }

  int lcm(int a, int b) {
    int ans = a ~/ gcd(a, b) * b;
    return ans;
  }

  return Point(gcd(a, b), lcm(a, b));
}

dynamic num(String sstr) {
  var ans = [];
  final List<String> llist = sstr.split(' ');
  for (var element in llist) {
    if ((int.tryParse(element)) != null) {
      ans.add(element);
    }
  }
  return ans;
}

List<int> dectobin(n) {
  List<int> b = [];
  while (n > 0) {
    b.add(n % 2);
    n = n ~/ 2;
  }
  return b.reversed.toList();
}

int binaryArrayToNumber(List<int> digits) {
  var result = 0;
  for (var digit in digits) {
    result <<= 1;
    result |= digit;
  }
  return result;
}

dynamic mapp(listt) {
  final res = <int, int>{};
  listt.sort();
  int count = 1;
  var i = 0;
  while (i <= listt.length - 1) {
    if (i < listt.length - 1) {
      if (listt[i] == listt[i + 1]) {
        count++;
      } else {
        res[listt[i]] = count;
        count = 1;
      }
      i++;
    } else {
      if (listt[i] == listt[i - 1]) {
        count++;
      } else {
        res[listt[i]] = count;
        count = 1;
      }
      i++;
    }
  }

  return res;
}

List<int> strtonum(listt) {
  final data = [
    'zero',
    'one',
    'two',
    'three',
    'four',
    'five',
    'six',
    'seven',
    'eight',
    'nine'
  ];
  List<int> res = [];
  listt = listt.toSet();
  listt = [...listt];
  for (var i = 0; i < listt.length; i++) {
    if (data.contains(listt[i])) {
      res.add(data.indexOf(listt[i]));
    }
  }
  return res;
}

double Pointt(a1, b1, c1, a2, b2, c2, a3, b3, c3) {
  double distanceTo(x1, y1, z1, x2, y2, z2) {
    return sqrt(pow((x2 - x1), 2) + pow((y2 - y1), 2) + pow((z2 - z1), 2));
  }

  double half_meter(a1, b1, c1, a2, b2, c2, a3, b3, c3) {
    double a = distanceTo(a2, b2, c2, a3, b3, c3);
    double b = distanceTo(a1, b1, c1, a3, b3, c3);
    double c = distanceTo(a1, b1, c1, a2, b2, c2);
    return ((a + b + c) / 2);
  }

  double squarenix(a1, b1, c1, a2, b2, c2, a3, b3, c3) {
    double p = half_meter(a1, b1, c1, a2, b2, c2, a3, b3, c3);
    double a = distanceTo(a2, b2, c2, a3, b3, c3);
    double b = distanceTo(a1, b1, c1, a3, b3, c3);
    double c = distanceTo(a1, b1, c1, a2, b2, c2);
    return sqrt(p * (p - a) * (p - b) * (p - c));
  }

  return squarenix(a1, b1, c1, a2, b2, c2, a3, b3, c3);
}

double mabs(double x) {
  return (x < 0) ? -x : x;
}

double roott(double num, int rootDegree) {
  double eps = 0.0000000000000001;
  double root = num / rootDegree;
  double rn = num;
  int countiter = 0;
  while (mabs(root - rn) >= eps) {
    rn = num;
    for (int i = 1; i < rootDegree; i++) {
      rn = rn / root;
    }
    root = 0.5 * (rn + root);
    countiter++;
  }

  return root;
}

mixin WhichMailSystem on User {
  getMailSystem() {
    int ind = email.indexOf('@');
    dynamic mailsystem = '';
    for (var i = ind + 1; i < email.length; i++) {
      mailsystem += email[i];
    }
    return mailsystem;
  }
}

abstract class User {
  late String name;
  late String email;
}

class AdminUser extends User with WhichMailSystem {
  AdminUser(name, email);
}

class GeneralUser extends User {
  GeneralUser(name, email);
}

class UserManager<T extends User> {
  List<User> users = [
    GeneralUser("Sonya", "sonyak0t@mail.ru"),
    AdminUser("Fedya", "f-maslov@bk.ru"),
    GeneralUser("Voopoo", "imrabit@wild.com")
  ];
  Map<String, String> admins = {};
  void addUser(User user) {
    users.add(user);
  }

  deleteuser(String name) {
    int count = 0;
    for (var el in users) {
      if (el == name) {
        users.remove(name);
        print('Пользователь $name удален');
        count = 1;
        break;
      }
    }
    if (count == 0) {
      print('Пользователь с таким именем не существует.');
    }
  }

  void showallemails() {
    for (var user in users) {
      if (user is AdminUser) {
        print(user.getMailSystem());
      } else {
        print(user.email);
      }
    }
  }
}

var man = UserManager();

void main() {
  print("Первое задание: НОК и НОД чисел 15 и 20 - ${First_Task(15, 20)}");
  print(
      "Второе задание: 55 => ${dectobin(55)} => ${binaryArrayToNumber(dectobin(55))}");
  print(
      "Третье задание: Каждый 2 охотник 13 желает 4 знать => ${num('Каждый 2 охотник 13 желает 4 знать')}");
  print("Четвертое задание: [1,5,3,4,1,5,8,1,5,5,4,1,5,4,0] => ${mapp([
        1,
        5,
        3,
        4,
        1,
        5,
        8,
        1,
        5,
        5,
        4,
        1,
        5,
        4,
        0
      ])}");
  print(
      "Пятое задание: ['teach','once','one','two','zero','zero','cat','sonya','four', 'night', 'nine', '0', 'subzero'] => ${strtonum([
        'teach',
        'once',
        'one',
        'two',
        'zero',
        'zero',
        'cat',
        'sonya',
        'four',
        'night',
        'nine',
        '0',
        'subzero'
      ])}");
  print(
      "Шестое задание: Точки (a[7,5,1] b[-3,3,-2] c[1,1,1]) образуют триугольник ABC с площадью = ${Pointt(7, 5, 1, -3, 3, -2, 1, 1, 1).toStringAsFixed(3)}");
  print(
      "Седьмое задание: Корень из числа num(125) в степени n(3) = ${roott(125, 3)}");
  print(
      'Восьмое задание: Добавить обычного ползователя Ulan c почтой poznaks@mail.ru, добавить админа Owner с почтой maxpayne@gmail.com, удалить пользователя Fedya, вывести все почты с исключением для админов');
  man.deleteuser('Sonya');
  man.showallemails();
}
