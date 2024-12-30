import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_ass/model/Event_model.dart';

class FirebaseUtilis {
  static CollectionReference<EventModel> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(EventModel.collectionName)
        .withConverter<EventModel>(
            fromFirestore: (snapshot, _) =>
                EventModel.fromFireStore(snapshot.data()),
            toFirestore: (snapshot, _) => snapshot.toFirestore());
  }

  static Future<void> addEvent(EventModel event) {
    /*  CollectionReference<EventModel> collectionReference =
        getEventCollection(); //collection
    DocumentReference<EventModel> docRef = collectionReference.doc(); //document
    event.id = docRef.id; //autoId
     docRef.set(event);
    */
    return getEventCollection().doc().set(event);
  }
}
