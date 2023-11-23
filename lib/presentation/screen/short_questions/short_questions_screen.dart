import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/screen/short_questions/short_question_bloc.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';

class ShortQuestionsScreen extends StatefulWidget {
  const ShortQuestionsScreen({super.key});

  @override
  State<ShortQuestionsScreen> createState() => _ShortQuestionsScreenState();
}

class _ShortQuestionsScreenState extends State<ShortQuestionsScreen> {
  final block = ShortQuestionBloc(repository: AppRepository.getInstance());

  @override
  void initState() {
    block.add(Load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(builder: (context, themeNotifier, child) {
      return SafeArea(
        child: BlocProvider.value(
          value: block,
          child: BlocBuilder<ShortQuestionBloc, ShortQuestionState>(
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                body: Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      children: [
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
                                      borderRadius:
                                          BorderRadius.circular(13.50),
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
                        SizedBox(height: 24),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    decoration: ShapeDecoration(
                                      color: Theme.of(context).primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    child: Text(
                                      'question${state.question}'.tr(),
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    )),
                                Container(
                                  height: 4,
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24))),
                                ),
                                Container(
                                  height: 4,
                                  margin: EdgeInsets.symmetric(horizontal: 12),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .primaryColor
                                          .withOpacity(0.25),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(24),
                                          bottomRight: Radius.circular(24))),
                                ),
                              ],
                            )),
                        const SizedBox(
                          height: 32,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          block.add(
                                              ClickYesBtn(context: context));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 19),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                              (state.question == 1)
                                                  ? "male".tr()
                                                  : "yes".tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(24),
                                                bottomRight:
                                                    Radius.circular(24))),
                                      ),
                                      Container(
                                        height: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.25),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(24),
                                                bottomRight:
                                                    Radius.circular(24))),
                                      ),
                                    ],
                                  )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  flex: 1,
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          block.add(
                                              ClickNoBtn(context: context));
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 19),
                                          decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Text(
                                              (state.question == 1)
                                                  ? "female".tr()
                                                  : "no".tr(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall),
                                        ),
                                      ),
                                      Container(
                                        height: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(24),
                                                bottomRight:
                                                    Radius.circular(24))),
                                      ),
                                      Container(
                                        height: 5,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 16),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.25),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(24),
                                                bottomRight:
                                                    Radius.circular(24))),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Positioned(
                                  child: Image.asset(
                                      "assets/images/ic_effect.png")),
                            ],
                          ),
                        ),
                        SizedBox(height: 24)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}
