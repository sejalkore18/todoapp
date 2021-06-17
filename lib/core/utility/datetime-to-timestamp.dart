import 'package:cloud_firestore/cloud_firestore.dart';

Timestamp dateTimeToTimeStamp(DateTime dateTime) {
  Timestamp timeStamp = Timestamp.fromDate(dateTime);
  return timeStamp;
}
