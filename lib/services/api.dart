import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

class API {
  saveOperation(
      _customer,
      _address,
      _emptyNo,
      _dumpNo,
      _pickTime,
      _dumpTime,
      _netTon,
      _receipt,
      _notes,
      _driverName,
      _submittedBy,
      _receiptUrl,
      _isClosed) {
    print("data: saving daily ops");
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionReference =
          firestore.collection("operations");
      collectionReference.doc(DateTime.now().toString()).set({
        "customer": _customer,
        "address": _address,
        "emptyNo": _emptyNo,
        "dumpNo": _dumpNo,
        "pickTime": _pickTime,
        "dumpTime": _dumpTime,
        "netTon": _netTon,
        "receipt": _receipt,
        "notes": _notes,
        "created": DateTime.now(),
        "created_value":
            DateFormat("MMM dd, yyyy,  hh:mm:ss a").format(DateTime.now()),
        "driverName": _driverName,
        "submitted_by": _submittedBy,
        "receipt_url": _receiptUrl,
        "is_closed": _isClosed,
      });
    } on Exception catch (e) {
      print(e);
    }
  }

  getDailyOperation() {
    print("data: getting daily ops");
    var data;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        firestore.collection("operations");
    data = collectionReference
        .where('submitted_by', isEqualTo: auth.currentUser.email)
        .get();
    return data;
  }

  saveDriverLog(
    _driverName,
    _dateString,
    _timeIn,
    _startMilage,
    _endMilage,
    _timeOut,
    _truckNumber,
    _dumpNumber,
    _emptyNumber,
    _email,
  ) {
    print("data: saving driver logs");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    // var logTime = DateTime.now().toString();
    // print(logTime);
    // var box = Hive.box('log');
    // box.put('log_time', logTime);
    var box = Hive.box('log');
    var lastLogTime = box.get('log_time');
    print("lastLog is $lastLogTime");

    CollectionReference collectionReference =
        firestore.collection("driver_log");
    if (lastLogTime == null) {
      print("setting new log data");
      var lastLogTime = DateTime.now().toString();
      box.put('log_time', lastLogTime);
      collectionReference.doc(lastLogTime).set({
        "date": _dateString,
        "timeIn": _timeIn,
        "startMilage": _startMilage,
        "endMilage": "",
        "timeOut": "",
        "truckNumber": _truckNumber,
        "dumpNumber": "",
        "emptyNumber": "",
        "driverName": _driverName,
        "created": DateTime.now(),
        "created_value":
            DateFormat("MMM dd, yyyy,  hh:mm:ss a").format(DateTime.now()),
        "submitted_by": _email,
      });
    } else {
      print("updating old log data");
      collectionReference.doc(lastLogTime).update({
        "endMilage": _endMilage,
        "timeOut": _timeOut,
        "dumpNumber": _dumpNumber,
        "emptyNumber": _emptyNumber,
      });
      box.put('log_time', null);
      print("driver log complete");
    }
  }

  getDriverLog() {
    print("data: getting driver logs");
    var data;
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference collectionReference =
        firestore.collection("driver_log");
    data = collectionReference
        .where('submitted_by', isEqualTo: auth.currentUser.email)
        .get();
    return data;
  }

  saveUserInfo(firstName, lastName, phoneNumber) {
    print("data: saving user info to db");
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionReference = firestore.collection("users");
      try {
        collectionReference.doc(auth.currentUser.email).set({
          "email": auth.currentUser.email,
          "first_name": firstName,
          "last_name": lastName,
          "phone": phoneNumber,
          "is_approved": false,
          "is_admin": false,
          "created": DateTime.now(),
        });
      } on FirebaseException catch (e) {
        print(e);
        throw e.toString();
      }
    }
  }

  getUserInfo() {
    print("data: getting user info");
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    FirebaseAuth auth = FirebaseAuth.instance;
    DocumentReference documentReference =
        firestore.collection("users").doc(auth.currentUser.email);
    return documentReference.get();
  }

  saveLeads(
    _phone,
    _address,
    _deliveryDate,
    _pickupDate,
    _disposeType,
    _dumpsterSize,
  ) {
    print("data: saving leads");
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionReference = firestore.collection("leads");
      collectionReference.doc(DateTime.now().toString()).set({
        "phone_number": _phone,
        "address": _address,
        "delivery_date": _deliveryDate,
        "pickup_date": _pickupDate,
        "dispose_type": _disposeType,
        "dumpster_size": _dumpsterSize,
        "created": DateTime.now(),
        "created_value":
            DateFormat("MMM dd, yyyy,  hh:mm:ss a").format(DateTime.now()),
      });
    } on Exception catch (e) {
      throw e;
    }
  }

  saveMessages(
    _email,
    _message,
  ) {
    print("data: saving messages");
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      CollectionReference collectionReference =
          firestore.collection("messages");
      collectionReference.doc(DateTime.now().toString()).set({
        "email": _email,
        "message": _message,
        "created": DateTime.now(),
        "created_value":
            DateFormat("MMM dd, yyyy,  hh:mm:ss a").format(DateTime.now()),
      });
    } on Exception catch (e) {
      throw e;
    }
  }
}
