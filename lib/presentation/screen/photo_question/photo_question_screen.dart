import 'dart:io';
import 'package:photo_view/photo_view.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medical_app/domain/app_repository.dart';
import 'package:medical_app/presentation/components/custom_switch_button.dart';
import 'package:medical_app/presentation/components/images.dart';
import 'package:medical_app/presentation/screen/photo_question/photo_data.dart';
import 'package:medical_app/presentation/screen/photo_question/photo_question_bloc.dart';
import 'package:medical_app/presentation/themes/theme_provider.dart';
import 'package:medical_app/utils/constants.dart';
import 'package:provider/provider.dart';

class PhotoQuestionScreen extends StatefulWidget {
  const PhotoQuestionScreen({super.key});

  @override
  State<PhotoQuestionScreen> createState() => _PhotoQuestionScreenState();
}

class _PhotoQuestionScreenState extends State<PhotoQuestionScreen> {
  final bloc = PhotoQuestionBloc(repository: AppRepository.getInstance());

  File? _selectedImage;

  @override
  void initState() {
    bloc.add(Load());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
      builder: (context, themeNotifier, child) {
        return BlocProvider.value(
          value: bloc,
          child: BlocBuilder<PhotoQuestionBloc, PhotoQuestionState>(
            builder: (context, state) {
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
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
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
                                        borderRadius:
                                            BorderRadius.circular(13.50),
                                      ),
                                    ),
                                    child: Text(
                                      "otherLanguage".tr(),
                                      style:
                                          TextStyle(color: secondaryTextColor),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 16,),
                            Container(
                              margin: EdgeInsets.only(right: 0),
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .primaryColor
                                              .withOpacity(0.25),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                  ),
                                  Positioned(
                                    // bottom: 20,
                                    // left: 0,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
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
                                    child: Column(
                                      children: [
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'questionTitle'.tr(),
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge!
                                                        .color,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'SF Pro Display',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
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
                                    child: Container(
                                      height: 40,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 16),
                                      decoration: BoxDecoration(
                                          color:
                                              secondaryColor.withOpacity(0.25),
                                          borderRadius:
                                              BorderRadius.circular(16)),
                                    ),
                                  ),
                                  Positioned(
                                    // bottom: 20,
                                    // left: 0,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 8),
                                          decoration: BoxDecoration(
                                              color: secondaryColor
                                                  .withOpacity(0.5),
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
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 16),
                                          // margin: EdgeInsets.symmetric(horizontal: 8),
                                          decoration: BoxDecoration(
                                              color:
                                                  secondaryColor.withOpacity(1),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  _pickImageFromGallery();
                                                },
                                                child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Spacer(),
                                                        SvgPicture.asset(
                                                            "assets/icons/ic_picture.svg"),
                                                        Text(
                                                          'insertPhoto'.tr(),
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 16,
                                                            fontFamily:
                                                                'SF Pro Display',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        Spacer(),
                                                      ],
                                                    )),
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
                            (state.userPhoto != null)
                                ? GestureDetector(
                              onTap: (){
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      child: Container(
                                        width: 280,
                                        height: 240,
                                        decoration: ShapeDecoration(
                                          image: DecorationImage(
                                            image: FileImage((state.userPhoto! as FromFile).file),
                                            fit: BoxFit.cover,
                                          ), shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 150,
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 0,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Colors.white,
                                          ),
                                          borderRadius: BorderRadius.circular(16),
                                        ),
                                        image: DecorationImage(
                                            image: FileImage(
                                                (state.userPhoto! as FromFile)
                                                    .file),
                                            fit: BoxFit.cover),
                                        color: Theme.of(context).primaryColor,
                                        // border: Border.all( color: (_selectedColor != null && _selectedColor == widget.imageList[index])?secondaryColor:Colors.transparent, width:(_selectedColor != null && _selectedColor == widget.imageList[index])? 3:0)
                                      ),
                                    ),
                                )
                                : SizedBox(),
                            SizedBox(
                              height: (state.userPhoto != null) ? 16 : 0,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(horizontal: 0),
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 16),
                                        decoration: ShapeDecoration(
                                          color: Theme.of(context).primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        child: Text(
                                          'photo_question${state.index}'.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        )),
                                    Container(
                                      height: 4,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      width: MediaQuery.of(context).size.width,
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
                                      height: 4,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      width: MediaQuery.of(context).size.width,
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
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 0),
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
                                              bloc.add(SelectAnswer(
                                                  answer: 1, context: context));
                                              setState(() {});
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 19),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Text("yes".tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall),
                                            ),
                                          ),
                                          Container(
                                            height: 5,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24),
                                                    bottomRight:
                                                        Radius.circular(24))),
                                          ),
                                          Container(
                                            height: 5,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.25),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24),
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
                                              bloc.add(SelectAnswer(
                                                  answer: 0, context: context));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 19),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              child: Text("no".tr(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall),
                                            ),
                                          ),
                                          Container(
                                            height: 5,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 12),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.5),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24),
                                                    bottomRight:
                                                        Radius.circular(24))),
                                          ),
                                          Container(
                                            height: 5,
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 16),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor
                                                    .withOpacity(0.25),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(24),
                                                    bottomRight:
                                                        Radius.circular(24))),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                                alignment: Alignment.bottomCenter,
                                width: MediaQuery.of(context).size.width,
                                height: 126,
                                child: ImagesRow(imageList: state.photoList)),
                            SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )));
            },
          ),
        );
      },
    );
  }

  /*_getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }*/

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(returnImage!.path);
    });
    bloc.add(SelectPhoto(photo: FromFile(file: File(returnImage!.path))));
  }
}
