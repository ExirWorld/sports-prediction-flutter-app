import 'package:flutter/material.dart';
import 'package:oxir_game/core/common/constants.dart';

class DiagonalImagesContainer extends StatefulWidget {
  final String image1;
  final String image2;

  const DiagonalImagesContainer({
    super.key,
    required this.image1,
    required this.image2,
  });

  @override
  State<DiagonalImagesContainer> createState() =>
      _DiagonalImagesContainerState();
}

class _DiagonalImagesContainerState extends State<DiagonalImagesContainer> {
  final ValueNotifier<bool> isImage1Selected = ValueNotifier(false);
  final ValueNotifier<bool> isImage2Selected = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final String imageUrl1 = '${Constants.baseUrl}${widget.image1}';
    final String imageUrl2 = '${Constants.baseUrl}${widget.image2}';
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: GestureDetector(
            onTap: () {
              isImage1Selected.value = !isImage1Selected.value;
              if (isImage1Selected.value) {
                isImage2Selected.value = false;
              }
            },
            child: ClipPath(
              clipper: DiagonalClipper(),
              child: Image.network(
                imageUrl1,
                width: 350,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: GestureDetector(
            onTap: () {
              isImage2Selected.value = !isImage2Selected.value;
              if (isImage2Selected.value) {
                isImage1Selected.value = false;
              }
            },
            child: ClipPath(
              clipper: ReverseDiagonalClipper(),
              child: Image.network(
                imageUrl2,
                width: 350,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: DiagonalLineClipper(),
          child: Container(
            width: 350,
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
        ),
        Center(
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xffe9c475),
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 241, 193, 89),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 0),
                ),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Image.asset(
              'assets/images/katana_4773942.png',
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ReverseDiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(size.width, 0)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class DiagonalLineClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 10, 0)
      ..lineTo(10, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
