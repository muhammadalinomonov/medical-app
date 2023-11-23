import 'package:flutter/material.dart';
import 'package:medical_app/presentation/screen/photo_question/photo_data.dart';

class ImagesRow extends StatefulWidget {
  final List<PhotoData> imageList;

  const ImagesRow({required this.imageList, super.key});

  @override
  State<ImagesRow> createState() => _ImagesRowState();
}

class _ImagesRowState extends State<ImagesRow> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: AssetImage((widget.imageList[index] as FromAsset).url),
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
                  width: 120,
                  height: 100,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            (widget.imageList[index] as FromAsset).url)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
          ),
          separatorBuilder: (context, index) => SizedBox(
                width: 16,
              ),
          itemCount: widget.imageList.length),
    );


  }


}

class GalleryExampleItem {
  GalleryExampleItem({
    required this.id,
    required this.resource,
    this.isSvg = false,
  });

  final String id;
  final String resource;
  final bool isSvg;
}

class GalleryExampleItemThumbnail extends StatelessWidget {
  const GalleryExampleItemThumbnail({
    Key? key,
    required this.galleryExampleItem,
    required this.onTap,
  }) : super(key: key);

  final GalleryExampleItem galleryExampleItem;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Hero(
          tag: galleryExampleItem.id,
          child: Image.asset(galleryExampleItem.resource, height: 80.0),
        ),
      ),
    );
  }
}

List<GalleryExampleItem> galleryItems = <GalleryExampleItem>[
  GalleryExampleItem(
    id: "tag1",
    resource: "assets/gallery1.jpg",
  ),
  GalleryExampleItem(id: "tag2", resource: "assets/firefox.svg", isSvg: true),
  GalleryExampleItem(
    id: "tag3",
    resource: "assets/gallery2.jpg",
  ),
  GalleryExampleItem(
    id: "tag4",
    resource: "assets/gallery3.jpg",
  ),
];
