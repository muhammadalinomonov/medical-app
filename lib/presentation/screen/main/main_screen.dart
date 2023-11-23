import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/screen/multi_variant/multi_variant_page.dart';
import 'package:medical_app/presentation/screen/photo_question/photo_question_screen.dart';
import 'package:medical_app/presentation/screen/questions/questions_screen.dart';
import 'package:medical_app/presentation/screen/short_questions/short_questions_screen.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return SafeArea(
          child: Scaffold(
              body: Column(children: [
                SizedBox(height: 16,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // SvgPicture.asset("assets/icons/ic_logo.svg"),
                  GestureDetector(
                    onTap: () async {
                      if (context.locale == Locale("uz")) {
                        context.setLocale(const Locale("ru"));
                      } else {
                        context.setLocale(const Locale("uz"));
                      }
                    },
                    child: Container(
                      width: 68,
                      height: 27,
                      alignment: Alignment.center,
                      decoration: ShapeDecoration(
                        color: secondaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.50),
                        ),
                      ),
                      child: Text(
                        "otherLanguage".tr(),
                        style: TextStyle(color: secondaryTextColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 16,),
            Container(
              margin: EdgeInsets.only(right: 16),
              alignment: Alignment.centerRight,
              child: CustomSwitchButton(
                value: !themeNotifier.isDark,
                onValueChange: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                },
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: 0,
                child: Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: [
                    Container(
                        width: double.infinity,
                        child: SvgPicture.asset(
                          "assets/icons/ic_doctors_and_ellips.svg",
                          fit: BoxFit.fill,
                        )),
                    Positioned(
                      bottom: 24,
                      child: Column(
                        children: [Image.asset("assets/images/ic_effect.png")],
                      ),
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: 80),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.30000001192092896),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: const [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                          builder: (context) {
                                            return PhotoQuestionScreen();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 21),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Text(
                                          "txt_first_photography".tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 16),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.30000001192092896),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                          builder: (context) {
                                            return const ShortQuestionsScreen();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 21),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Text(
                                          tr("questions"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(height: 16),
                            Container(
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      width: MediaQuery.of(context).size.width,
                                      height: 90,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.30000001192092896),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 6),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        shadows: [
                                          BoxShadow(
                                            color: Color(0x0C000000),
                                            blurRadius: 52,
                                            offset: Offset(0, 4),
                                            spreadRadius: 0,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            CupertinoPageRoute(
                                          builder: (context) {
                                            return QuestionsScreen();
                                          },
                                        ));
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 21),
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            color:
                                                Theme.of(context).primaryColor),
                                        child: Text(
                                          tr("yourFototi"),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ])),
        );
      },
    );
    /*return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset("assets/icons/ic_logo.svg"),
              GestureDetector(
                onTap: () async {
                  if (context.locale == Locale("uz")) {
                    context.setLocale(const Locale("ru"));
                  } else {
                    context.setLocale(const Locale("uz"));
                  }
                },
                child: Container(
                  width: 68,
                  height: 27,
                  alignment: Alignment.center,
                  decoration: ShapeDecoration(
                    color: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13.50),
                    ),
                  ),
                  child: Text(
                    "otherLanguage".tr(),
                    style: TextStyle(color: secondaryTextColor),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(margin:EdgeInsets.only(right: 16),alignment:Alignment.centerRight,child: CustomSwitchButton(value: true,onValueChange: (){
          themeNotifier.isDark
              ? themeNotifier.isDark = false
              : themeNotifier.isDark = true;
        },),),
        SizedBox(height: 12),
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            height: 0,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.loose,
              children: [
                Container(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      "assets/icons/ic_doctors_and_ellips.svg",
                      fit: BoxFit.fill,
                    )),
                Positioned(
                  bottom: 24,
                  child: Column(
                    children: [Image.asset("assets/images/ic_effect.png")],
                  ),
                ),
                Positioned(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.30000001192092896),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0C000000),
                                      blurRadius: 52,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0C000000),
                                      blurRadius: 52,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                   Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return PhotoQuestionScreen();
                                    },
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 21),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    "txt_first_photography".tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 16),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 16),
                                width: MediaQuery.of(context).size.width,
                                height: 90,
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.30000001192092896),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0C000000),
                                      blurRadius: 52,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 6),
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: ShapeDecoration(
                                  color: Theme.of(context)
                                      .primaryColor
                                      .withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x0C000000),
                                      blurRadius: 52,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(
                                    builder: (context) {
                                      return QuestionsScreen();
                                    },
                                  ));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 21),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Theme.of(context).primaryColor),
                                  child: Text(
                                    tr("questions"),
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
                                  ),
                                ),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ])),
    );*/
  }
}
