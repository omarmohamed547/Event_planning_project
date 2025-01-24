import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_ass/firebase_utilis.dart';
import 'package:event_planning_ass/model/Event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  //data
  List<EventModel> eventsList = [];
  List<EventModel> filterList = [];
  List<EventModel> favouriteList = [];

  List<String> eventNameList = [];
  int selectedIndex = 0;

  void returneventNameList(BuildContext context) {
    eventNameList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.metting,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.gaming,
    ];
  }

//function
  void getAllEvent(String uId) async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection(uId).get();
    eventsList = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = eventsList;
    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });

    notifyListeners();
  }

  void getFavouriteEvent(String uId) async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection(uId)
            .orderBy('dateTime')
            .where("isFavourite", isEqualTo: true)
            .get();
    favouriteList = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }

  void getFilterEvent(String uId) async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection(uId).get();
    eventsList = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    filterList = eventsList.where((event) {
      return event.eventName == eventNameList[selectedIndex];
    }).toList();

    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });

    notifyListeners();
  }

  void changeIndex(int newIndex, String uId) {
    selectedIndex = newIndex;

    if (selectedIndex == 0) {
      getAllEvent(uId);
    } else {
      getFilterEvent(uId);
    }

    //getFilterEvent();
  }

  void updateFavouriteFunc(EventModel event, String uId) {
    // Update the local isFavourite value
    //event.isFavourite = !event.isFavourite;
    print("${event.isFavourite}");

    FirebaseUtilis.getEventCollection(uId)
        .doc(event.id)
        .update({'isFavourite': !event.isFavourite}).then((vaue) {
      print("udatedd");
      print("${event.isFavourite}");

      selectedIndex == 0 ? getAllEvent(uId) : getFilterEvent(uId);
      getFavouriteEvent(uId);
    });

    notifyListeners();
  }

  // Delete event
  void deleteEvent(EventModel event, String uId) async {
    try {
      // Delete the event from Firestore
      await FirebaseUtilis.getEventCollection(uId).doc(event.id).delete();

      // Remove the event from the local list
      eventsList.removeWhere((e) => e.id == event.id);
      filterList.removeWhere((e) => e.id == event.id);
      favouriteList.removeWhere((e) => e.id == event.id);

      // Notify listeners to update the UI
      notifyListeners();
    } catch (error) {
      print("Error deleting event: $error");
    }
  }
}
