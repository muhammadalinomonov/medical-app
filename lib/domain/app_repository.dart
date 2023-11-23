class AppRepository {
  int correctAnswerCount = 0;
  int wrongAnswerCount = 0;
  int photoQuestionResult = 0;
  int haveFreckles = 0;
  int fototipScore = 0;


  final List<List<String>> photos = [
    ['assets/images/top_1.1.png','assets/images/top_1.2.png'],
    ['assets/images/top_2.1.jpg','assets/images/top_2.2.jpg', 'assets/images/top_2.3.png',],
    ['assets/images/top_3.1.jpg','assets/images/top_3.2.jpg','assets/images/top_3.3.jpg','assets/images/top_3.4.jpg','assets/images/top_3.5.jpg', 'assets/images/top_3.6.png','assets/images/top_3.7.png','assets/images/top_3.8.png','assets/images/top_3.9.png'],
    ['assets/images/top_4.1.jpg','assets/images/top_4.2.png'],
    ['assets/images/top_5.1.png'],
    ['assets/images/top_6.1.jpg','assets/images/top_6.2.png','assets/images/top_6.3.png','assets/images/top_6.4.png','assets/images/top_6.5.png', 'assets/images/top_6.6.png'],
    ['assets/images/top_7.1.jpg','assets/images/top_7.2.png'],
    ['assets/images/top_8.1.jpg','assets/images/top_8.2.jpg','assets/images/top_8.3.jpg','assets/images/top_8.4.jpg','assets/images/top_8.5.jpg', 'assets/images/top_8.6.jpg','assets/images/top_8.7.jpg','assets/images/top_8.8.jpg','assets/images/top_8.9.jpg','assets/images/top_8.10.jpg','assets/images/top_8.11.jpg', 'assets/images/top_8.12.jpg', 'assets/images/top_8.13.png','assets/images/top_8.14.png','assets/images/top_8.15.png'],
    ['assets/images/top_9.1.png','assets/images/top_9.2.jpg','assets/images/top_9.3.jpg', 'assets/images/top_9.4.png'],
    ['assets/images/top_10.1.png',],
    ['assets/images/top_11.1.png',],
    ['assets/images/top_12.1.png',],
    ['assets/images/top_13.1.png',],
    ['assets/images/top_14.1.png','assets/images/top_14.2.png'],
    ['assets/images/top_15.1.png',],
  ];

  AppRepository._internal();


  static final AppRepository _instance = AppRepository._internal();

  factory AppRepository.getInstance() {
    return _instance;
  }

  void clearData() {
    correctAnswerCount = 0;
    wrongAnswerCount = 0;
    photoQuestionResult = 0;
    haveFreckles = 0;
    fototipScore = 0;
  }
}
