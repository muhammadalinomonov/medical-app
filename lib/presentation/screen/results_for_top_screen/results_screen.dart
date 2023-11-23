import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';


class ColorsResultsScreen extends StatefulWidget {
  final int fototipScore;
  const ColorsResultsScreen({super.key, required this.fototipScore});

  @override
  State<ColorsResultsScreen> createState() => _ColorsResultsScreenState();
}

class _ColorsResultsScreenState extends State<ColorsResultsScreen> {

  AppRepository repository = AppRepository.getInstance();



  @override
  Widget build(BuildContext context) {

    String result = (widget.fototipScore < 6)?"0-5":(widget.fototipScore < 11)?"6-10":(widget.fototipScore < 16)?"11-15":(widget.fototipScore < 20)?"16-19":(widget.fototipScore < 24)?"20-23":"24-25";
    int resultIndex = (widget.fototipScore < 6)?1:(widget.fototipScore < 11)?2:(widget.fototipScore < 16)?3:(widget.fototipScore < 20)?4:(widget.fototipScore < 24)?5:6;
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return SafeArea(
          child: Scaffold(
              body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                    bottom: 12,
                    child: Image.asset("assets/images/ic_effect.png")),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            
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
                        SizedBox(height: 16,),
                        Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          SizedBox(width: 64,),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              //todo
                              'result'.tr(),
                              style: TextStyle(
                                color: Color(0xFF109F9A),
                                fontSize: 24,
                                fontFamily: 'SF Pro Display',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: -0.60,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 4,),
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
                        ],),

                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                // bottom: 0,
                                // left: 0,
                                child: Container(
                                  height: 40,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                // left: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                // left: 0,
                                child: Column(
                                  children: [



                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 24, horizontal: 24),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(1),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          
                                          SizedBox(height: 8),
                                          Text(
                                            textAlign: TextAlign.justify,
                                            "multivariantanswer$result".tr(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 16,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                       /* Container(
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                // bottom: 0,
                                // left: 0,
                                child: Container(
                                  height: 40,
                                  margin: EdgeInsets.symmetric(horizontal: 16),
                                  decoration: BoxDecoration(
                                      color: secondaryColor.withOpacity(0.25),
                                      borderRadius: BorderRadius.circular(16)),
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                // left: 0,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 40,
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: secondaryColor.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                // bottom: 20,
                                // left: 0,
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => ShortQuestionsScreen(),));
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.symmetric(vertical: 16),
                                        // margin: EdgeInsets.symmetric(horizontal: 8),
                                        decoration: BoxDecoration(
                                            color: secondaryColor.withOpacity(1),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'more'.tr(),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontFamily: 'SF Pro Display',
                                                  fontWeight: FontWeight.w700,
                                                  height: 0,
                                                  letterSpacing: -0.54,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),*/
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
        );
      },
    );
  }
  @override
  void dispose() {
    repository.clearData();
    super.dispose();
  }
}
