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
  void getAllEvent() async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection().get();
    eventsList = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filterList = eventsList;
    filterList.sort((event1, event2) {
      return event1.dateTime.compareTo(event2.dateTime);
    });

    notifyListeners();
  }

  void getFavouriteEvent() async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection()
            .orderBy('dateTime')
            .where("isFavourite", isEqualTo: true)
            .get();
    favouriteList = querysnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    notifyListeners();
  }

  void getFilterEvent() async {
    QuerySnapshot<EventModel> querysnapshot =
        await FirebaseUtilis.getEventCollection().get();
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

  void changeIndex(int newIndex) {
    selectedIndex = newIndex;

    if (selectedIndex == 0) {
      getAllEvent();
    } else {
      getFilterEvent();
    }

    //getFilterEvent();
  }

  void updateFavouriteFunc(EventModel event) {
    // Update the local isFavourite value
    //event.isFavourite = !event.isFavourite;
    print("${event.isFavourite}");

    FirebaseUtilis.getEventCollection()
        .doc(event.id)
        .update({'isFavourite': !event.isFavourite}).timeout(
      const Duration(milliseconds: 500),
      onTimeout: () {
        print("udatedd");
        print("${event.isFavourite}");

        selectedIndex == 0 ? getAllEvent() : getFilterEvent();
        getFavouriteEvent();
      },
    );

    notifyListeners();
  }
}
