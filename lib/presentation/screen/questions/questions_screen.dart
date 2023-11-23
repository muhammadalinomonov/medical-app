import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/colors.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/screen/questions/question_bloc.dart';
import 'package:medical_app/presentation/screen/short_questions/short_questions_screen.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final bloc = QuestionBloc();

  @override
  void initState() {
    AppRepository.getInstance().clearData();
    bloc.add(Load());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(builder: (context, themeNotifier, child){
      return SafeArea(
        child: BlocProvider.value(
          value: bloc,
          child: BlocBuilder<QuestionBloc, QuestionState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  child: Stack(children: [
                    Positioned(bottom:24,child: Image.asset('assets/images/ic_effect.png')),
                    Padding(
                      padding: EdgeInsets.only(top: 0),
                      child: Container(

                        child: Column(
                          children: [
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
                            Row(children: [
                              SizedBox(width: 60,),
                              Spacer(),
                              Container(width:180,child: Text('fototipTilte'.tr(), textAlign:TextAlign.center,style: TextStyle(color: secondaryColor, fontSize: 20, fontWeight: FontWeight.w500),),),
                              Spacer(),
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
                            ],),

                            SizedBox(height: 12),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
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
                                              vertical: 20, horizontal: 20),
                                          // margin: EdgeInsets.symmetric(horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(1),
                                              borderRadius:
                                              BorderRadius.circular(16)),
                                          child: Column(
                                            children: [

                                              Text(
                                                "fototipQuestion"
                                                    .tr(),
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(color: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!.color, fontWeight: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!.fontWeight, fontSize: 15),
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
                            SizedBox(height: 12),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
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
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.symmetric(horizontal: 8),
                                      width: MediaQuery.of(context).size.width,
                                      height: 83,
                                      decoration: ShapeDecoration(
                                        color: Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.5),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 26, horizontal: 14),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Theme.of(context).primaryColor),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "multivariantquestions${state.question}".tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .color,
                                        fontSize: 20,

                                        fontFamily: 'SF Pro Display',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: -0.60,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              alignment: Alignment.center,
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: ColorsRow(
                                colorList:state.colorList,
                                selectedItem: (color) {
                                  bloc.add(SelectVariant(selectedColor: color, context: context));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 32,
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(horizontal: 16),
                            //   child: Stack(
                            //     children: [
                            //       Container(
                            //         margin: EdgeInsets.symmetric(horizontal: 8),
                            //         width: MediaQuery.of(context).size.width,
                            //         height: 64,
                            //         decoration: ShapeDecoration(
                            //           color: Color(0x7F109F9A).withOpacity(0.5),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //         ),
                            //       ),
                            //       Container(
                            //         margin: EdgeInsets.symmetric(horizontal: 4),
                            //         width: MediaQuery.of(context).size.width,
                            //         height: 60,
                            //         decoration: ShapeDecoration(
                            //           color: Color(0x7F109F9A),
                            //           shape: RoundedRectangleBorder(
                            //             borderRadius: BorderRadius.circular(20),
                            //           ),
                            //         ),
                            //       ),
                            //       /*Container(
                            //         alignment: Alignment.center,
                            //         padding: EdgeInsets.symmetric(vertical: 16),
                            //         width: MediaQuery.of(context).size.width,
                            //         decoration: BoxDecoration(
                            //             borderRadius:
                            //             BorderRadius.all(Radius.circular(16)),
                            //             color: secondaryColor),
                            //         child: Row(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             SvgPicture.asset(
                            //                 "assets/icons/ic_picture.svg"),
                            //             Text(
                            //               'insertPhoto'.tr(),
                            //               style: TextStyle(
                            //                 color: Colors.white,
                            //                 fontSize: 16,
                            //                 fontFamily: 'SF Pro Display',
                            //                 fontWeight: FontWeight.w400,
                            //                 height: 0,
                            //                 letterSpacing: -0.24,
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       )*/
                            //     ],
                            //   ),
                            // ),
                            Spacer(),

                          ],
                        ),
                      ),
                    )
                  ],),
                ),
              );
            },
          ),
        ),
      );
    },);
  }
}
