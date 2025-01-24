import 'package:event_planning_ass/ui/Login/login_screen.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/app_style.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  static const String onBoardingId = "OnboardingScreen";

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool backButton = false;
  int currentPage = 0;
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: Image.asset("assets/images/appBarOnboarding.png")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.8,
              child: PageView(
                onPageChanged: (index) {
                  currentPage = index; // Update current page index on scroll
                  setState(() {});
                },
                controller: controller,
                children: [
                  OnBoardingScreenWidget(
                    image: AssetManager.smartPeopleImage,
                    title: "Find Events That Inspire You",
                    desc:
                        "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
                  ),
                  OnBoardingScreenWidget(
                    image: AssetManager.managerDesk,
                    title: "Effortless Event Planning",
                    desc:
                        "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
                  ),
                  OnBoardingScreenWidget(
                    image: AssetManager.socialMediaImage,
                    title: "Connect with Friends & Share Moments",
                    desc:
                        "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                currentPage == 0
                    ? SizedBox.shrink()
                    : ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(
                                side: BorderSide(
                                    color: AppColors.primaryColorLight,
                                    width: 1.2))),
                        onPressed: () {
                          if (currentPage > 0) {
                            controller.animateToPage(
                              currentPage - 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                            currentPage =
                                currentPage--; // Update current page index
                            setState(() {
                              currentPage =
                                  currentPage++; // Update current page index
                            });
                          }
                        },
                        child: Image.asset("assets/icons/arrowleft.png")),
                SmoothPageIndicator(
                    effect: ExpandingDotsEffect(
                        dotColor: Colors.black,
                        activeDotColor: AppColors.primaryColorLight,
                        dotHeight: 7,
                        dotWidth: 6),
                    controller: controller,
                    count: 3),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: CircleBorder(
                            side: BorderSide(
                                color: AppColors.primaryColorLight,
                                width: 1.2))),
                    onPressed: () {
                      if (currentPage < 2) {
                        controller.animateToPage(
                          currentPage + 1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        currentPage =
                            currentPage++; // Update current page index
                        setState(() {
                          currentPage =
                              currentPage++; // Update current page index
                        });
                      } else if (currentPage == 2) {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.loginScreenId);
                      }
                    },
                    child: Image.asset("assets/icons/rightarrow.png")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnBoardingScreenWidget extends StatelessWidget {
  String image;
  String title;
  String desc;
  OnBoardingScreenWidget({
    super.key,
    required this.title,
    required this.image,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Image.asset(image),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            title,
            style: AppStyle.bold20Primary,
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
            desc,
            style: AppStyle.Medium16Black,
          ),
        ],
      ),
    );
  }
}
