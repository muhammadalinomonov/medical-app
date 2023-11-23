import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:url_launcher/url_launcher.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.maxResult, required this.currentResult});

  final int maxResult;
  final int currentResult;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  final AppRepository _repository = AppRepository.getInstance();

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return SafeArea(
          child: Scaffold(
              body: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(bottom: 12, child: Image.asset("assets/images/ic_effect.png")),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                  //.symmetric(horizontal: 16, vertical: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
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
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            right: 4,
                          ),
                          alignment: Alignment.centerRight,
                          child: CustomSwitchButton(
                            value: !themeNotifier.isDark,
                            onValueChange: () {
                              themeNotifier.isDark ? themeNotifier.isDark = false : themeNotifier.isDark = true;
                            },
                          ),
                        ),
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
                                      color: Theme.of(context).primaryColor.withOpacity(0.25),
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
                                          color: Theme.of(context).primaryColor.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(16)),
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
                                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor.withOpacity(1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'result'.tr(),
                                              style: TextStyle(
                                                color: Color(0xFF109F9A),
                                                fontSize: 20,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                letterSpacing: -0.60,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            'resultShortQuestion${(_repository.correctAnswerCount <= 7) ? '1-6.5' : (_repository.correctAnswerCount <= 13) ? '6.5-12.5' : '12.5-20'}'
                                                .tr(),
                                            style: Theme.of(context).textTheme.bodySmall,
                                            textAlign: TextAlign.left,
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
                        /* Container(
                            child: SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: 25,
                              useRangeColorForAxis: true,

                              ranges: <GaugeRange>[

                                GaugeRange(
                                  labelStyle: GaugeTextStyle(),
                                    startValue: 0,
                                    endValue: 1,
                                    color: Colors.green),
                                GaugeRange(
                                    startValue: 1,
                                    endValue: 2,
                                    color: Colors.green.shade300),
                                GaugeRange(
                                    startValue: 2,
                                    endValue: 4,
                                    color: Colors.orange.shade300),
                                GaugeRange(
                                    startValue: 4,
                                    endValue:6,
                                    color: Colors.orange),
                                GaugeRange(
                                    startValue: 6,
                                    endValue: 15,
                                    color: Colors.red),
                                GaugeRange(
                                    startValue: 15,
                                    endValue: widget.maxResult/1.0,
                                    color: Colors.red.shade900)
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: widget.currentResult.toDouble(), needleColor: secondaryColor,knobStyle:  KnobStyle(knobRadius: 14,
                                    sizeUnit: GaugeSizeUnit.logicalPixel, color: secondaryColor)),
                              ],
                              annotations: <GaugeAnnotation>[
                                GaugeAnnotation(
                                    widget: Container(
                                        child: Text('${widget.currentResult}',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold, color: (widget.currentResult <= 2) ?Colors.green:(widget.currentResult <= 6)?Colors.orange:Colors.red))),
                                    angle: 90,
                                    positionFactor: 0.5)
                              ])
                        ])),*/
                        SizedBox(
                          height: 16,
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
                                      color: secondaryColor.withOpacity(0.25), borderRadius: BorderRadius.circular(16)),
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
                                          borderRadius: BorderRadius.circular(16)),
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
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: secondaryColor.withOpacity(1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${_repository.correctAnswerCount} " + 'point'.tr(),
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
                                    SizedBox(
                                      height: 10,
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
                                      color: Theme.of(context).primaryColor.withOpacity(0.25),
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
                                          color: Theme.of(context).primaryColor.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(16)),
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
                                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor.withOpacity(1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.topLeft,
                                            child: Text(
                                              'conclusion'.tr(),
                                              style: TextStyle(
                                                color: Color(0xFF109F9A),
                                                fontSize: 20,
                                                fontFamily: 'SF Pro Display',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                letterSpacing: -0.60,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Text(
                                            "userConclusion".tr(),
                                            style: Theme.of(context).textTheme.bodySmall,
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
                        /*Container(
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
                                      color: Theme.of(context).primaryColor.withOpacity(0.25),
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
                                          color: Theme.of(context).primaryColor.withOpacity(0.5),
                                          borderRadius: BorderRadius.circular(16)),
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
                                      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 12),
                                      // margin: EdgeInsets.symmetric(horizontal: 8),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor.withOpacity(1),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Column(
                                        children: [
                                          Container(
                                              // padding: EdgeInsets.symmetric(horizontal: 8),
                                              width: MediaQuery.of(context).size.width,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  ClipOval(
                                                    child: Container(
                                                        width: 85,
                                                        height: 85,
                                                        child: Image.asset(
                                                          "assets/ic_avatar.PNG",
                                                          fit: BoxFit.cover,
                                                        )),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'name'.tr(),
                                                            style: TextStyle(
                                                              color: Theme.of(context).textTheme.bodyLarge!.color,
                                                              fontSize: 16,
                                                              fontFamily: 'SF Pro Display',
                                                              fontWeight: FontWeight.w700,
                                                            ),
                                                          ),
                                                          Container(
                                                            // width:MediaQuery.of(context).size.width,
                                                            child: Text(
                                                              'job'.tr(),
                                                              style: TextStyle(
                                                                color: Theme.of(context)
                                                                    .textTheme
                                                                    .bodySmall!
                                                                    .color!
                                                                    .withOpacity(0.6000000238418579),
                                                                fontSize: 14,
                                                                fontFamily: 'SF Pro Display',
                                                                fontWeight: FontWeight.w400,
                                                              ),
                                                              textAlign: TextAlign.left,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8,
                                                          ),
                                                          Text.rich(
                                                            TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: 'tel'.tr(),
                                                                  style: TextStyle(
                                                                    color: Theme.of(context)
                                                                        .textTheme
                                                                        .bodySmall!
                                                                        .color!
                                                                        .withOpacity(0.6000000238418579),
                                                                    fontSize: 18,
                                                                    fontFamily: 'SF Pro Display',
                                                                    fontWeight: FontWeight.w400,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                    text: ' +998944089889',
                                                                    style: TextStyle(
                                                                      color: Color(0xCC1C52E0),
                                                                      fontSize: 18,
                                                                      fontFamily: 'SF Pro Display',
                                                                      fontWeight: FontWeight.w500,
                                                                    ),
                                                                    recognizer: TapGestureRecognizer()
                                                                      ..onTap = () {
                                                                        _launchPhone('+998944089889');
                                                                      }),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )),
                                          SizedBox(
                                            height: 12,
                                          ),
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
                        ),*/
                        SizedBox(
                          height: 16,
                        )
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

  void _launchPhone(String phoneNumber) async {
    final String url = 'tel:$phoneNumber';

    if (!await launchUrl(Uri.parse(url))) {
      debugPrint("could not launch $url");
      throw 'Could not launch $url';
    }
  }
}
