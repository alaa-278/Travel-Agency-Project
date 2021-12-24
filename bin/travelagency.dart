import 'dart:io';

import 'operations.dart';

void main(List<String> arguments) {
  print('\t\t\t\t****************************** \t\t');
  print('\t\t\t\tWELCOME WISH YOU ENJOY WITH US \t\t');
  print('\t\t\t\t****************************** \t\t\n');
  print(
      'IF YOU ENTER NUMBER (4), YOU WILL SEE THE PLACES WE INTRODUCE TO TRAVEL TO');
  print(
      '**************************************************************************\n');
  Operation travel = Operation();
  travel.welcomeUser();
  int num = int.parse(stdin.readLineSync()!);
  while (num != 10) {
    if (num == 1) {
      travel.addTrip();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 2) {
      travel.editTrip();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 3) {
      travel.deleteTrip();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 4) {
      travel.viewTrips();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 5) {
      travel.searchTrip();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 6) {
      travel.reverseTrip();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 8) {
      travel.latestTrips();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    } else if (num == 9) {
      travel.viewPassengers();
      travel.welcomeUser();
      num = int.parse(stdin.readLineSync()!);
    }
  }
  print('Thank You');
}
