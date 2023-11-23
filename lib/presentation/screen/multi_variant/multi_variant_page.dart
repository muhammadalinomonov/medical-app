import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/screen/multi_variant/multi_variant_bloc.dart';
import 'package:medical_app/presentation/screen/results_for_top_screen/results_screen.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';

class MultiVariantPage extends StatefulWidget {
  final int score;
  const MultiVariantPage({super.key, required this.score});

  @override
  State<MultiVariantPage> createState() => _MultiVariantPageState();
}

class _MultiVariantPageState extends State<MultiVariantPage> {
  final bloc = MultiVariantBloc(repository: AppRepository.getInstance());

  @override
  void initState() {
    bloc.add(Load( score: widget.score));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: Stack(
              children: [
                Positioned(bottom:32,child: Image.asset(
                    "assets/images/ic_effect.png")),
                BlocProvider.value(
                  value: bloc,
                  child: BlocBuilder<MultiVariantBloc, MultiVariantState>(
                    builder: (context, state) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Container(
                          // color: Theme.of(context).scaffoldBackgroundColor,
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
                                              horizontal: 16, vertical: 18),
                                          decoration: ShapeDecoration(
                                            color: Theme.of(context).primaryColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            'multivariantquestions${state.question}'.tr(),
                                            style:
                                                Theme.of(context).textTheme.bodyLarge,
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
                                height: 36,
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
                                                //todo
                                                bloc.add(SelectVariant(selectedColor: 0, context: context));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(16)),
                                                child: Text("multivariants${state.question}.1".tr(),
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
                              SizedBox(height: 12),
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
                                                //todo
                                                bloc.add(SelectVariant(selectedColor: 1, context: context));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(16)),
                                                child: Text("multivariants${state.question}.2".tr(),
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
                              SizedBox(height: 12),
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
                                                //todo
                                                bloc.add(SelectVariant(selectedColor: 2, context: context));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(16)),
                                                child: Text("multivariants${state.question}.3".tr(),
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
                              SizedBox(height: 12),
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
                                                //todo
                                                bloc.add(SelectVariant(selectedColor:3, context: context));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(16)),
                                                child: Text("multivariants${state.question}.4".tr(),
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
                              SizedBox(height: 12),
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
                                                //todo
                                                bloc.add(SelectVariant(selectedColor: 5, context: context));
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12),
                                                decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(16)),
                                                child: Text("multivariants${state.question}.5".tr(),
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
                             /* Container(
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Positioned(
                                        child: Image.asset(
                                            "assets/images/ic_effect.png")),
                                  ],
                                ),
                              ),*/
                              SizedBox(height: 24)
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
