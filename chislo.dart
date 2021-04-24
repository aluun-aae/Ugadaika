import 'dart:io';

import 'dart:math';

class Ugadaichislo {
  static var min = 0;
  static var max = 100;

  var step = 1;
  static var rng = new Random();
  var l = new List.generate(100, (i) => rng.nextInt(100));
  List arr = [];
  List arr2 = [];
  var compwin = 0;
  var chelwin = 0;
  var draw = 0;
  int binar() {
    int chslo2 = 0;
    var stepbi = 1;
    stdout.write("Загадайте число от $min до $max");
    var current = ((max + min) / 2).floor();
    stdout.write("\n Ваше число $current ?");
    stdout.write("\n (1) меньше \n (2) больше  \n (3) да \n");
    var a = stdin.readLineSync()!;
    if (a == "3") {
      print("я его угадал на $step шаге");
      min = 0;
      max = 100;
    } else if (a == "2") {
      min = current + 1;
      step++;
      binar();
    } else if (a == "1") {
      max = current - 1;
      step++;
      binar();
    } else {
      print("error");
      step = 0;
    }
    chslo2 = step;
    return chslo2;
  }

  int randomint() {
    int chslo3 = 0;
    var rand = new Random();
    var random = min + rand.nextInt(max - min);
    stdout.write("Загадайте число от $min до $max");
    stdout.write("\n Ваше число $random ?");
    stdout.write("\n (1) меньше \n (2) больше  \n (3) да \n");
    var a = stdin.readLineSync()!;
    if (a == "3") {
      print("я его угадал на $step шаге");
    } else if (a == "2") {
      min = random;
      random = Random().nextInt(max - min);
      step++;
      randomint();
    } else if (a == "1") {
      max = random;
      random = Random().nextInt(max - min);
      step++;
      randomint();
    }
    chslo3 = step;
    return chslo3;
  }

  calcStep(step, num, min, max) {
    var avgNum = ((max + min) / 2).floor();
    if (avgNum == num) {
      arr.add(step);
    } else if (avgNum > num) {
      calcStep(++step, num, min, avgNum - 1);
    } else {
      calcStep(++step, num, avgNum + 1, max);
    }
  }

  binaryTest2(step, list) {
    list.forEach((element) {
      calcStep(1, element, min, max);
    });
    print(arr);
  }

  calcStep2(step, num, min, max) {
    var rand2 = new Random();
    var random2 = min + rand2.nextInt(max - min);
    if (random2 == num) {
      arr2.add(step);
    } else if (random2 > num) {
      calcStep2(++step, num, min, random2);
    } else {
      calcStep2(++step, num, random2, max);
    }
  }

  randomTest3(step, list) {
    list.forEach((element) {
      calcStep2(1, element, min, max);
    });
    print(arr2);
  }

  int computer() {
    var number = new Random();
    var numbers = min + number.nextInt(max - min);
    print(numbers);
    int chslo = 0;
    stdout.write("я загадал число от $min до $max \n");
    var stepComp = 1;
    while (stepComp < 1000) {
      stdout.write("Попробуй угадать ");
      var x = stdin.readLineSync()!;
      if (int.parse(x) < numbers) {
        print("Слишком маленькое");
        stepComp += 1;
      } else if (int.parse(x) > numbers) {
        print("Слишком большое");
        stepComp += 1;
      } else if (int.parse(x) == numbers) {
        print("правильно, вы угадали за $stepComp шагов");
        min = 0;
        max = 100;
        chslo = stepComp;
        stepComp = 1;
        break;
      }
    }
    return chslo;
  }

  forsorev() {
    print("Первым начнет компьютер \n ==================== \n");
    var pres = binar();
    step = 1;
    print("Теперь твоя очередь \n ==================== \n");
    var cres = computer();
    if (cres > pres) {
      print("комп победил в этом раунде");
      compwin++;
    } else if (cres < pres) {
      print("ты победил в этом раунде");
      chelwin++;
    } else if (cres == pres) {
      print("в этом раунде ничья");
      draw++;
    }
  }

  forsorev2() {
    print("Первым начнет компьютер \n ==================== \n");
    var pres = randomint();
    step = 1;
    print("Теперь твоя очередь \n ==================== \n");
    var cres = computer();
    if (cres > pres) {
      print("комп победил в этом раунде");
      compwin++;
    } else if (cres < pres) {
      print("ты победил в этом раунде");
      chelwin++;
    } else if (cres == pres) {
      print("в этом раунде ничья");
      draw++;
    }
  }

  sorev() {
    var kl = 1;
    stdout
        .write("Сколько будет раундов (от 1 до 10) \n ==================== \n");
    var x = stdin.readLineSync()!;
    stdout.write(
        "Выберите уровень сложности: \n 1)простой \n 2)сложный \n ==================== \n");
    var dlvl = stdin.readLineSync()!;
    if (x == "") {
      print("Будет 3 раунда \n ==================== \n");
      while (kl <= 3) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "1") {
      print("Будет 1 раунд \n ==================== \n");
      while (kl <= 1) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "2") {
      print("Будет 2 раунда \n ==================== \n");
      while (kl <= 2) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "3") {
      print("Будет 3 раунда \n ==================== \n");
      while (kl <= 3) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "4") {
      print("Будет 4 раунда \n ==================== \n");
      while (kl <= 4) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "5") {
      print("Будет 5 раундов \n ==================== \n");
      while (kl <= 5) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "6") {
      print("Будет 6 раундов \n ==================== \n");
      while (kl <= 6) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "7") {
      print("Будет 7 раундов \n ==================== \n");
      while (kl <= 7) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "8") {
      print("Будет 8 раундов \n ==================== \n");
      while (kl <= 8) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "9") {
      print("Будет 9 раундов \n ==================== \n");
      while (kl <= 9) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else if (x == "10") {
      print("Будет 10 раундов \n ==================== \n");
      while (kl <= 10) {
        kl++;
        if (dlvl == "1") {
          forsorev2();
        } else if (dlvl == "2") {
          forsorev();
        }
      }
    } else {
      print("не правильное число раундов");
    }
    if (chelwin > compwin && chelwin > draw) {
      print("Вы победили в игре");
    } else if (compwin > chelwin && compwin > draw) {
      print("Компьютер победил");
    } else if (draw > chelwin && draw > compwin) {
      print("Ничья");
    }
  }
}

main() {
  var rng = new Random();
  var list = new List.generate(100, (i) => rng.nextInt(100));
  Ugadaichislo a20 = Ugadaichislo();
  print(list);
  a20.binaryTest2(0, list);
  var a = (a20.arr.reduce((value, element) => value + element));
  var c = (a / a20.arr.length).round();
  print(c);
  Ugadaichislo a21 = Ugadaichislo();
  a21.randomTest3(0, list);
  var b = (a21.arr2.reduce((value, element) => value + element));
  var f = (b / a21.arr2.length).round();
  print(f);
  // print(
  //     "выберите режим игры \n 1)человек угадывает \n 2)компьютер угадывает \n 3) соревнования");
  // var rejimigr = stdin.readLineSync()!;
  // if (rejimigr == "1") {
  //   a21.computer();
  // } else if (rejimigr == "2") {
  //   a21.binar();
  // }
  // a21.sorev();
  a20.sorev();
}
