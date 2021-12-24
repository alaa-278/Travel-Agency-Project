import 'dart:io';

class Operation {
  List<int> iD = [1, 2, 3, 4, 5, 6];
  List<String> locationL = [
    'Alexandria',
    'Mansoura',
    'Port Said',
    'Marasa Matroh',
    'Sharm Elsheikh',
    'Aswan'
  ];
  List<double> priceNum = [2000, 1500, 1300, 2500, 5000, 6000];
  List<int> passengerLimit = [500, 300, 250, 350, 600, 450];
  List<dynamic> DATE = [
    '10-01-2022',
    '18-02-2022',
    '16-04-2022',
    '01-01-2022',
    '30-12-2021',
    '11-04-2022'
  ];
  List<dynamic> sortDATE = [
    '10-01-2022',
    '18-02-2022',
    '16-04-2022',
    '01-01-2022',
    '30-12-2021',
    '11-04-2022'
  ];
  var passengers = <int, List<String>>{
    1: ['AHMED', 'GAMAL'],
    2: ['NORA', 'AMIRA', 'EMAN'],
    3: ['ALAA'],
    4: ['BASMA'],
    5: ['ABDALLAH'],
    6: ['SHADY'],
  };

  var numberL = <int, List<String>>{
    1: ["01000000001", '01000000002'],
    2: ['01200000003', '01000000004', '01200000005'],
    3: ["01200000000"],
    4: ["01099999999"],
    5: ["01542322522"],
    6: ["01542366342"]
  };
  var emailL = <int, List<String>>{
    1: ["AHMED@gmail.com", 'GAMAL@gmail.com'],
    2: ['NORA@gmail.com', 'AMIRA@gmail.com', 'EMAN@gmail.com'],
    3: ['ALAA@gmail.com'],
    4: ['BASMA@gmail.com'],
    5: ['ABDALLAH@gmail.com'],
    6: ['SHADY@gmail.com'],
  };

  late String answer;
  late int id;
  late double price;
  late int limit;
  late String location;
  late int day;
  late int month;
  late int year;
  dynamic date;
  int counterNumberOfPassengers = 0;
// Added Function
  void welcomeUser() {
    print('------------------------------------------------------\n'
        '1- Add Trip   2- Edit Trip          3- Delete Trip\n'
        '4- View Trips 5- Search With Price  6- Reverse\n'
        '8- Latest Trips       9- View Passengers\n'
        '10-EXIT\n'
        '------------------------------------------------------\n');
    stdout.write('Please Enter ID Of The Operation You Need: ');
  }
// First Function
  void addTrip() {
    stdout.write("\n Enter The Location : ");
    location = stdin.readLineSync()!;

    stdout.write("\n Enter ID : ");
    id = int.parse(stdin.readLineSync()!);
    stdout.write("\n Enter Passenger Limit: ");
    limit = int.parse(stdin.readLineSync()!);
    stdout.write("\n Enter Price: ");
    price = double.parse(stdin.readLineSync()!);
    if (price >= 10000) {
      discount();

      print("There is a discount :) The Price will be limited to $price");
    }

    stdout.write("\nEnter the Day: ");
    day = int.parse(stdin.readLineSync()!);
    stdout.write("\nEnter the Month: ");
    day = int.parse(stdin.readLineSync()!);
    stdout.write("\nEnter the Year: ");
    day = int.parse(stdin.readLineSync()!);
    print('\t\t\t**Trip Added**\t\t\t');
    print('');
    stdout.write(
        'Press Y if you want to add another trip and N if you do not [Y/N]: ');
    answer = stdin.readLineSync()!;
    if (answer == 'y' || answer == 'Y') {
      addTrip();
    } else {
      welcomeUser();
    }
  }
 // Second Function
  void editTrip() {
    showTrips();
    stdout.write("Enter The ID of The Trip You Want To Edit: ");
    int modifiedID = int.parse(stdin.readLineSync()!);
    int indexOFID = iD.indexOf(modifiedID);
    print(
        "** ${locationL[indexOFID]} **\n ID: ${iD[indexOFID]}\n Date: ${sortDATE[indexOFID]}\n Price:${priceNum[indexOFID]}\n Passenger Limit:${passengerLimit[indexOFID]}\n**************************************\n");
    print('');
    stdout.write(
        'Enter The number of what you want to edit " 1-ID  2-Location  3-Passenger Limit  4-Date  5-Price": ');
    int number = int.parse(stdin.readLineSync()!);
    switch (number) {
      case 1:
        {
          stdout.write("\n Enter ID: ");
          int id = int.parse(stdin.readLineSync()!);
          iD[indexOFID] = id;
          print('ID Edited');
          print('');
          break;
        }
      case 2:
        {
          stdout.write("\n Enter Location: ");
          String location = stdin.readLineSync()!;
          locationL[indexOFID] = location;
          print('Location Edited');
          print('');
          break;
        }
      case 3:
        {
          stdout.write("\n Enter Passenger Limit: ");
          int limit = int.parse(stdin.readLineSync()!);
          passengerLimit[indexOFID] = limit;
          print('Number Edited');
          print('');
          break;
        }
      case 4:
        {
          stdout.write("\n   Day : ");
          String day = stdin.readLineSync()!;
          if (int.parse(day) < 10) {
            day = "0" + day;
          }
          stdout.write("   Month : ");
          String month = stdin.readLineSync()!;
          if (int.parse(month) < 10) {
            month = "0" + month;
          }
          stdout.write("   Year : ");
          String year = stdin.readLineSync()!;
          String date = year + '-' + month + '-' + day;
          DATE[indexOFID - 1] = date;
          sortDATE[indexOFID - 1] = date;
          break;
        }
      case 5:
        {
          stdout.write("\n Enter Price: ");
          double price = double.parse(stdin.readLineSync()!);
          priceNum[indexOFID] = price;
          print('Price Edited');
          print('');
          break;
        }
    }
    stdout.write('Press Y if you want to edit another trip'
        ' and N if you do not [Y/N]: ');
    answer = stdin.readLineSync()!;
    if (answer == 'y' || answer == 'Y') {
      editTrip();
    } else {
      welcomeUser();
    }
  }
// Third Function
  void deleteTrip() {
    showTrips();
    stdout.write("Enter The ID of The Trip You Want To Delete: ");
    int deletedID = int.parse(stdin.readLineSync()!);
    int indexOFID = iD.indexOf(deletedID);

    iD.removeAt(indexOFID);
    priceNum.removeAt(indexOFID);
    passengerLimit.removeAt(indexOFID);
    locationL.removeAt(indexOFID);
    DATE.removeAt(indexOFID);
    print('Trip Deleted ! ');
    print('');
  }

  // Added Fun
  void showTrips() {
    for (int i = 0; i < priceNum.length; i++) {
      print(
          "** ${locationL[i]} **\n ID: ${iD[i]}\n Date: ${sortDATE[i]}\n Price:${priceNum[i]}\n Passenger Limit:${passengerLimit[i]}\n**************************************\n");
      print('');
    }
  }
// Fourth Function
  void viewTrips() {
    print('\t\t\t\tTrips Ordered By Date\t\t\t\t');
    print('\t\t\t\t---------------------\t\t\t\t\n');
    sortDATE.sort();
    for (int i = 0; i < DATE.length; i++) {
      for (int j = 0; j < DATE.length; j++) {
        if (DATE[j] == sortDATE[i]) {
          print(
              "** ${locationL[j]} **\n ID: ${iD[j]}\n Date: ${sortDATE[j]}\n Price:${priceNum[j]}\n Passenger Limit:${passengerLimit[j]}\n**************************************\n");
          print('');
        }
      }
    }
  }
// Fifth Function
  void searchTrip() {
    stdout.write("Please Enter The Price: ");
    int tripPrice = int.parse(stdin.readLineSync()!);
    for (int i = 0; i < priceNum.length; i++) {
      if (priceNum[i] == tripPrice) {
        print("The ID Of The Trip is: ${iD[i]}");
        print("The Location of the Trip is: ${locationL[i]}");
        print("The Number of the Passengers are : ${passengerLimit[i]}");
        print('');
      }
    }
  }
// Sixth Function
  void reverseTrip() {
    showTrips();
    stdout.write("\n>> Choose ID of the trip : ");
    int idToreserve = int.parse(stdin.readLineSync()!);
    int indexId = iD.indexOf(idToreserve);

    if (passengerLimit[indexId] == 0) {
      print("\n\t Sorry There is no place to book");
    } else {
      stdout.write("Enter number of passengers you want to add : ");
      int numbers = int.parse(stdin.readLineSync()!);
      for (int i = 0; i < numbers; i++) {
        stdout.write("Enter Name : ");
        String name = stdin.readLineSync()!;
        passengers[idToreserve]!.add(name);
        stdout.write("Enter Number : ");
        String number = stdin.readLineSync()!;
        numberL[idToreserve]!.add(number);
        stdout.write("Enter E-mail : ");
        String email = stdin.readLineSync()!;
        emailL[idToreserve]!.add(email);
        print("\n Trip Booked Successful\n");
      }
      passengerLimit[indexId] -= numbers;
    }
  }
// Seventh Function
  void discount() {
    price = price / 20;
  }
// Eight Function
  void latestTrips() {
    int count = 1;
    print('LATEST TRIPS');
    print('------------');
    for (int i = (priceNum.length - 1); count <= 10; i--) {
      count++;
      if (i <= 0) {
        count = 11;
      }
      print(
          "** ${locationL[i]} **\n ID: ${iD[i]}\n Date: ${sortDATE[i]}\n Price:${priceNum[i]}\n Passenger Limit:${passengerLimit[i]}\n**************************************\n");
      print('');
    }
  }
// ninth function
  void viewPassengers() {
    stdout.write("Enter The ID of The trip or type all : ");
    String viewedId = stdin.readLineSync()!;

    if (viewedId == "all") {
      for (int i = 0; i < iD.length; i++) {
        print("\n\n\t\t\t\t***${locationL[i]}***");
        for (int j = 0; j < passengers[iD[i]]!.length; j++) {
          print(
              "\nPassenger Name: ${passengers[iD[i]]![j]} \nPassenger Number: ${numberL[iD[i]]![j]}  \nPassenger Email: ${emailL[iD[i]]![j]}\n");
        }
      }
    } else {
      int viewID = int.parse(viewedId);
      int indexView = iD.indexOf(viewID);
      print("\n\n\t\t\t\t***${locationL[indexView]}***");

      for (int i = 0; i < iD.length; i++) {
        if (iD[i] == viewID) {
          for (int j = 0; j < passengers[iD[i]]!.length; j++) {
            print(
                "\nPassenger Name: ${passengers[iD[i]]![j]} \nPassenger Number: ${numberL[iD[i]]![j]}  \nPassenger Email: ${emailL[iD[i]]![j]}\n");
          }
        }
      }
    }
  }
}

