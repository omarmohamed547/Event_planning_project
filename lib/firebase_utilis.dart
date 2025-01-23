import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_ass/model/Event_model.dart';
import 'package:event_planning_ass/model/User_model.dart';

class FirebaseUtilis {
  static CollectionReference<EventModel> getEventCollection(String uId) {
    return getUserCollection()
        .doc(uId)
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
            fromFirestore: (snapshot, _) =>
                EventModel.fromFireStore(snapshot.data()),
            toFirestore: (snapshot, _) => snapshot.toFirestore());
  }

  static CollectionReference<UserModel> getUserCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.collectionName)
        .withConverter<UserModel>(
            fromFirestore: (snapshot, _) =>
                UserModel.fromFireStore(snapshot.data()!),
            toFirestore: (snapshot, _) => snapshot.toFireStore());
  }

  static Future<void> addUserToFireStore(UserModel user) {
    return getUserCollection().doc(user.id).set(user);
  }

  static Future<UserModel?> readUserFromFireStore(String id) async {
    var querySnapShot = await getUserCollection().doc(id).get();
    return querySnapShot.data();
  }

  static Future<void> addEvent(EventModel event, String uId) {
    CollectionReference<EventModel> collectionReference =
        getEventCollection(uId); //collection
    DocumentReference<EventModel> docRef = collectionReference.doc(); //document
    event.id = docRef.id; // auto-generate ID

    return docRef.set(event); // Save event to Firestore
  }
}
