import 'package:event_planning_ass/ui/choose_date_or_time.dart';
import 'package:event_planning_ass/ui/tabs/home_tab/tab_event.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:event_planning_ass/utilis/custom_elevated_button.dart';
import 'package:event_planning_ass/utilis/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

class CreateEvent extends StatefulWidget {
  static const String createEventScreenId = "CreateEvent";

  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectIndex = 0;
  String? selectedDate;
  DateTime? selectedDateFocused;
  TimeOfDay? selectedTimeFocused;
  String? selectedTime;
  var titleController = TextEditingController();
  var descController = TextEditingController();
  TextStyle? styleForHandleDate =
      AppStyle.Medium16Black.copyWith(color: AppColors.primaryColorLight);

  TextStyle? styleForHandleTime =
      AppStyle.Medium16Black.copyWith(color: AppColors.primaryColorLight);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Map<String, String> mapListImage = {
      AppLocalizations.of(context)!.sport: AssetManager.sportImage,
      AppLocalizations.of(context)!.birthday: AssetManager.birthdayImage,
      AppLocalizations.of(context)!.metting: AssetManager.mettingImage,
      AppLocalizations.of(context)!.bookclub: AssetManager.bookClubImage,
      AppLocalizations.of(context)!.eating: AssetManager.sportImage,
      AppLocalizations.of(context)!.exhibition: AssetManager.exhibitionImage,
      AppLocalizations.of(context)!.gaming: AssetManager.sportImage,
      AppLocalizations.of(context)!.workshop: AssetManager.birthdayImage,
    };
    List<String> eventNameList = [
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.metting,
      AppLocalizations.of(context)!.bookclub,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.workshop,
      AppLocalizations.of(context)!.gaming,
    ];
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColorLight),
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyle.Medium20Primary,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.04, vertical: height * 0.01),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(
                    width: double.infinity,
                    mapListImage[eventNameList[selectIndex]]!),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Container(
                height: height * 0.04,
                child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.02,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: eventNameList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          selectIndex = index;
                          setState(() {});
                        },
                        child: TabEvent(
                            borderColor: AppColors.primaryColorLight,
                            color: selectIndex == index
                                ? AppColors.primaryColorLight
                                : Colors.white,
                            textStyle: selectIndex == index
                                ? AppStyle.bold16White
                                : AppStyle.bold16White.copyWith(
                                    color: AppColors.primaryColorLight),
                            eventName: eventNameList[index],
                            isSelected: true),
                      );
                    }),
              ),
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        AppLocalizations.of(context)!.title,
                        style:
                            AppStyle.Medium16grey.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomTextField(
                        controller: titleController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "this Filed is required";
                          } else {
                            return null;
                          }
                        },
                        prefixIcon: Image.asset("assets/icons/writeIcon.png"),
                        hintText: AppLocalizations.of(context)!.event_title,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        AppLocalizations.of(context)!.desc,
                        style:
                            AppStyle.Medium16grey.copyWith(color: Colors.black),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      CustomTextField(
                        controller: descController,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "this Filed is required";
                          } else {
                            return null;
                          }
                        },
                        maxlines: 4,
                        hintText: AppLocalizations.of(context)!.event_desc,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  )),
              ChooseDateOrTime(
                icon: Image.asset("assets/icons/calenderIcon.png"),
                textEvent: AppLocalizations.of(context)!.event_date,
                textChoose: selectedDate == null
                    ? AppLocalizations.of(context)!.choose_date
                    : selectedDate!,
                style: styleForHandleDate,
                onTap: chooseDate,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              ChooseDateOrTime(
                icon: Image.asset("assets/icons/timeIcon.png"),
                textEvent: AppLocalizations.of(context)!.event_time,
                textChoose: selectedTime == null
                    ? AppLocalizations.of(context)!.choose_time
                    : selectedTime!,
                style: styleForHandleTime,
                onTap: chooseTime,
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Text(
                AppLocalizations.of(context)!.loc,
                style: AppStyle.Medium16grey.copyWith(color: Colors.black),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: width * 0.01),
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.02, vertical: height * 0.01),
                child: Row(
                  children: [
                    Container(
                      height: height * 0.05,
                      child: Image.asset("assets/icons/iconloc2.png"),
                      decoration: BoxDecoration(
                        color: AppColors.primaryColorLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.03,
                    ),
                    Text(AppLocalizations.of(context)!.choose_event,
                        style: AppStyle.Medium16White.copyWith(
                            color: AppColors.primaryColorLight)),
                    Spacer(),
                    Image.asset("assets/icons/iconRight.png")
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                        width: 1, color: AppColors.primaryColorLight)),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              custom_elevated_button(
                  paddingContainer: EdgeInsets.symmetric(
                      horizontal: width * 0.01, vertical: height * 0.01),
                  paddingHeight: EdgeInsets.symmetric(vertical: height * 0.01),
                  onButtonClicked: addEventButton,
                  text: AppLocalizations.of(context)!.add_event)
              /*ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(AssetManager.sportImage),
              )*/
            ],
          ),
        ),
      ),
    );
  }

  void addEventButton() {
    if (_formKey.currentState!.validate()) {
      if (selectedDate == null) {
        selectedDate = "Please choose date";
        styleForHandleDate = AppStyle.Medium16Red;
      }
      if (selectedTime == null) {
        selectedTime = "Please choose time";
        styleForHandleTime = AppStyle.Medium16Red;
      }
      setState(() {});

      /* ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Center(child: Text('Processing Data'))),
      );*/
    }
  }

  void chooseDate() async {
    var dateChoosen = await showDatePicker(
        context: context,
        initialDate: selectedDateFocused ?? DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (dateChoosen != null) {
      selectedDateFocused = dateChoosen;
      selectedDate = DateFormat("dd-MM-yyyy").format(dateChoosen);
      styleForHandleDate =
          AppStyle.Medium16Black.copyWith(color: AppColors.primaryColorLight);
      setState(() {});
    }
  }

  void chooseTime() async {
    var timeChoosen = await showTimePicker(
      context: context,
      initialTime: selectedTimeFocused ?? TimeOfDay.now(),
    );
    if (timeChoosen != null) {
      selectedTimeFocused = timeChoosen;
      selectedTime = timeChoosen.format(context);
      styleForHandleTime =
          AppStyle.Medium16Black.copyWith(color: AppColors.primaryColorLight);

      setState(() {});
    }
  }
}
