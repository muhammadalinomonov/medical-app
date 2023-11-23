part of 'photo_question_bloc.dart';

@immutable
class PhotoQuestionState {
  final List<PhotoData> photoList;
  final PhotoData? userPhoto;
  final int index;


  const PhotoQuestionState({this.photoList = const [], this.userPhoto, this.index = 1});

  PhotoQuestionState copyWith(
      {List<PhotoData>? photoList, PhotoData? userPhoto, int? index}) {
    return PhotoQuestionState(
        photoList: photoList ?? this.photoList, userPhoto: userPhoto ?? this.
        userPhoto, index: index??this.index);
  }
}
