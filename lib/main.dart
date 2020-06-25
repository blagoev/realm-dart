// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:io';

import 'realm.dart';

part 'main.g.dart';

// class My<T> {
//   My() {
//     T.runtimeType
//   }
// }

// class Car extends RealmObject {
//   /**
//    *  Autogenerated. Used from native code
//    */
//   Car._constructor() : super.constructor() {}

//   /**
//    * User supplied constructor for unmanged objects. The user can decide not to provide this constructor
//    */
//   Car() {}

//   @RealmProperty(type: 'string')
//   String get make => super["make"];
//   set make(String value) => super["make"] = value;
// }
class _Car {
  @RealmProperty()
  String make;
}

//class Person extends RealmObject {}
class _Person {
  @RealmProperty()
  String name; 
}

void main() {
  //reflectClass(key)
  //var libs = currentMirrorSystem().libraries;
  // var car = Expando<Object>();
  // car.name = ;

  // dynamic car = Car();
  // car.name = "Car";
  // car.properties

  // car.properties = Map<String, dynamic>();
  // car.properties = {
  //     "make": "string",
  //     "model": "string",
  //     "kilometrs" : DynamicObject()
  // };

  // var schema = ObjectSchema(
  //   name: "Car",
  //   properties: SchemaDynamicObject({
  //     make" : "string",
  //     model
  //   })

  // );
  print("Current PID ${pid}");

  var config = new Configuration();
  config.schema.add(Car);

  //config.schema.addAll([Car, Person]);
  // config.schema.define<Car>()..define<Person>()..define<Person>();

  // config.schema.defineAll([Car, Person.]);
  //..define(Person);

  var realm = new Realm(config);

  realm.write(() {
    print("realm write callback");
    var car = realm.create(new Car()..make = "Audi");
    print("The car is ${car.make}");
    // car.make = "VW";
    // print("The car is ${car.make}");
  });

  var objects = realm.objects<Car>();
  var indexedCar = objects[0];
  print("The indexedCar is ${indexedCar.make}");

  print("Exit");
}