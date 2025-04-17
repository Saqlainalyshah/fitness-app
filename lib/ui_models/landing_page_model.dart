class LandingPageModel{
  String imageUrl;
  String title;
  String description;
  LandingPageModel({
    required this.imageUrl,
    required this.title,
    required this.description
});
  static List<LandingPageModel> landingPageModelList=[
    LandingPageModel(imageUrl: "assets/images/landing/landing1.png", title: "TrackFit - Your Ultimate Step Counter & Tracker", description: "Track your steps, monitor your progress, live route tracking, insightful reports, and detailed history, and achieve your fitness goals."),
    LandingPageModel(imageUrl: "assets/images/landing/landing2.png", title: "Discover Your Route with Live Maps", description: "Experience the thrill of tracking your steps in real-time with TrackFit's live maps. TrackFit keeps you connected to your journey."),
    LandingPageModel(imageUrl: "assets/images/landing/landing3.png", title: "Gain Step Insights with Detailed Reports", description: "Stay informed about your step count, distance traveled, and calories burned with TrackFit's comprehensive reports."),

  ];
}