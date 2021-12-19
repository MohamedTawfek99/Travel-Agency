import 'dart:io';

import 'travel_agency.dart';

List trips = [];
late int id;
late int passengerLimit;
late int day;
late double price;
late int month;
late int year;
late String location;
late String casting;
dynamic numberOfProcess;
late double queringPrice;
int? editID;
int? reserveID;
int? numberOfPassenger;

int theTotalNumberPassenger = 0;

void main() {
  for (int i = 0; i < 1;) {
    print(
        '---------------------------------------------------------------------------');
    print('1-Add Trip           2-Edit Trip            3-Delete Trip ');
    print('4-View Trip         5-Search With The Price       6-Reserve ');
    print(
        '7- Exit              8-View The Last Trips         9-ViewPassenger ');
    print(
        '---------------------------------------------------------------------------');
    numberOfProcess = stdin.readLineSync()!;
    numberOfProcess = int.parse(numberOfProcess);
    switch (numberOfProcess) {
      case 1:
        {
          print('id :');
          casting = stdin.readLineSync()!;
          id = int.parse(casting);
          print('Location :');
          location = stdin.readLineSync()!;

          print('Price : ');
          casting = stdin.readLineSync()!;
          price = double.parse(casting);
          print('PassengerLimit : ');
          casting = stdin.readLineSync()!;
          passengerLimit = int.parse(casting);
          print('Date : ');
          print('Day : ');
          casting = stdin.readLineSync()!;
          day = int.parse(casting);
          print('Month : ');
          casting = stdin.readLineSync()!;
          month = int.parse(casting);
          print('Year : ');
          casting = stdin.readLineSync()!;
          year = int.parse(casting);
          addTirp(
              id: id,
              location: location,
              year: year,
              month: month,
              day: day,
              passengerLimit: passengerLimit,
              price: price);
          print('Added!');

          break;
        }
      case 2:
        {
          trips.forEach((element) {
            print(
                "Trip =>id: ${element.id} - Location: ${element.location} - Price: ${element.price} - Date : ${element.day}-${element.month}-${element.year} - passengerLimit: ${element.passengerLimit}");
          });
          print('Enter The ID of Trip you want To Edit');
          casting = stdin.readLineSync()!;
          editID = int.parse(casting);
          editTirp(editID!);
          break;
        }
      case 4:
        {
          trips.forEach((element) {
            print(
                "Trip =>id: ${element.id} - Location: ${element.location} - Price: ${element.price} - Date : ${element.day}-${element.month}-${element.year} - passengerLimit: ${element.passengerLimit}");
          });
          break;
        }
      case 3:
        {
          trips.forEach((element) {
            print(
                "Trip =>id: ${element.id} - Location: ${element.location} - Price: ${element.price} - Date : ${element.day}-${element.month}-${element.year} - passengerLimit: ${element.passengerLimit}");
          });

          print('Enter The ID of Trip you want To Edit');
          casting = stdin.readLineSync()!;
          editID = int.parse(casting);
          deleteTrip(editID!);
          print('Deleted!');
          break;
        }
      case 5:
        {
          print("Enter The Price ");
          casting = stdin.readLineSync()!;
          queringPrice = double.parse(casting);
          queryPrice(queringPrice);
          break;
        }
      case 6:
        {
          trips.forEach((element) {
            print(
                "Trip =>id: ${element.id} - Location: ${element.location} - Price: ${element.price} - Date : ${element.day}-${element.month}-${element.year} - passengerLimit: ${element.passengerLimit}");
          });
          print('Enter The id of Trip That You wanted to reserve :');
          casting = stdin.readLineSync()!;
          reserveID = int.parse(casting);
          print('Enter The number of passenger :');
          casting = stdin.readLineSync()!;
          numberOfPassenger = int.parse(casting);
          reserve(reserveID!, numberOfPassenger!);

          break;
        }
      case 7:
        {
          i++;
          print('Exited!');
          break;
        }
      case 8:
        {
          lastTrips();
          break;
        }
      case 9:
        {
          viewPassenger();
          break;
        }
      default:
        print('please,Enter a correct Number!');
    }
  }
}

void addTirp({
  required int id,
  required int passengerLimit,
  required int day,
  required double price,
  required int month,
  required int year,
  required String location,
}) {
  trips.add(Trip(
      id: id,
      location: location,
      passengerLimit: passengerLimit,
      price: bonus(price),
      day: day,
      month: month,
      year: year));
}

void editTirp(int id) {
  for (int i = 0; i < trips.length; i++) {
    if (id == trips[i].id) {
      print('id :');
      casting = stdin.readLineSync()!;
      trips[i].id = int.parse(casting);
      print('Location :');
      trips[i].location = stdin.readLineSync()!;

      print('Price : ');
      casting = stdin.readLineSync()!;
      trips[i].price = double.parse(casting);
      print('PassengerLimit : ');
      casting = stdin.readLineSync()!;
      trips[i].passengerLimit = int.parse(casting);
      print('Date : ');
      print('Day : ');
      casting = stdin.readLineSync()!;
      trips[i].day = int.parse(casting);
      print('Month : ');
      casting = stdin.readLineSync()!;
      trips[i].month = int.parse(casting);
      print('Year : ');
      casting = stdin.readLineSync()!;
      trips[i].year = int.parse(casting);

      print('Edited!');
      break;
    } else {
      print('There is not This Trip ');
    }
  }
}

void deleteTrip(int id) {
  for (int i = 0; i < trips.length; i++) {
    if (id == trips[i].id) {
      trips.remove(trips[i]);
      break;
    } else {
      print('There is not This Trip');
    }
  }
}

void queryPrice(double price) {
  bool? test;
  for (int i = 0; i < trips.length; i++) {
    if (price == trips[i].price) {
      print(
          "Trip =>id: ${trips[i].id} - Location: ${trips[i].location} - Price: ${trips[i].price} - Date : ${trips[i].day}-${trips[i].month}-${trips[i].year} - passengerLimit: ${trips[i].passengerLimit}");
      test = true;
      break;
    } else {
      test = false;
    }
  }
  if (test == false) {
    print('There is not a Trip with This price');
  }
}

void reserve(int id, int numberOfPassenger) {
  bool test = false;
  for (int i = 0; i < trips.length; i++) {
    if (id == trips[i].id) {
      if (numberOfPassenger <= trips[i].passengerLimit) {
        trips[i].passengerLimit -= numberOfPassenger;
        trips[i].numberOfplacesreserved = numberOfPassenger;
        print('Reserved!');
        test = true;
        break;
      } else {
        print('The number of individual not equal The passengerLimit');
        test = true;
        break;
      }
    } else {
      if (test == false) {
        print('The id is not correct ');
      }
    }
  }
}

double bonus(double price) {
  if (price > 10000) {
    return price * 0.2;
  } else
    return price;
}

void lastTrips() {
  for (int i = trips.length - 1;; i--) {
    int e = 0;

    if (i >= 0) {
      print(
          "Trip =>id: ${trips[i].id} - Location: ${trips[i].location} - Price: ${trips[i].price} - Date : ${trips[i].day}-${trips[i].month}-${trips[i].year} - passengerLimit: ${trips[i].passengerLimit}");
      if (e == 9) {
        break;
      }
      e++;
    } else {
      break;
    }
  }
}

void viewPassenger() {
  var numberOfPassenger = 0.0;
  trips.forEach((element) {
    print(
        'Trip => id : ${element.id} The number of passenger : ${element.numberOfplacesreserved} ');
    numberOfPassenger += element.numberOfplacesreserved;
  });
  print('All of reservations : ${numberOfPassenger} Passengers');
}
