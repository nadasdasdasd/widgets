import 'package:flutter/material.dart';

class ClipWidget extends StatefulWidget {
  const ClipWidget({super.key});

  @override
  State<ClipWidget> createState() => _ClipWidgetState();
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 5.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ClipWidgetState extends State<ClipWidget> {
  Image img = Image.network(
      'https://images.unsplash.com/photo-1592194996308-7b43878e84a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRect(
          child: Align(alignment: Alignment.center, widthFactor: 0.4, heightFactor: 1.0, child: img),
        ),
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
