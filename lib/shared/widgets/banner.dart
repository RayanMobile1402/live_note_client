import 'package:flutter/material.dart';

enum CardBannerPosition {
  TOPLEFT,
  TOPRIGHT,
  BOTTOMLEFT,
  BOTTOMRIGHT,
}

class CardBanner extends StatelessWidget {
  const CardBanner({
    required this.child, required this.text, super.key,
    this.position = CardBannerPosition.TOPLEFT,
    this.color = Colors.blue,
    this.edgeColor = const Color.fromARGB(255, 7, 86, 150),
    this.radius = 4,
    this.padding = 4.0,
    this.edgeSize = 6,
    this.textStyle = const TextStyle(fontSize: 14, color: Colors.white),
    required this.showBanner,
  });

  final Widget child;
  final String text;
  final Color color;
  final Color edgeColor;
  final double edgeSize;
  final double radius;
  final double padding;
  final bool showBanner;
  final CardBannerPosition position;
  final TextStyle textStyle;

  @override
  Widget build(final BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          child,
          if (showBanner)
            Positioned.fill(
              right: position.toString().contains('RIGHT') ? -6 : null,
              left: position.toString().contains('LEFT') ? -6 : null,
              top: position.toString().contains('TOP') ? 10 : null,
              bottom: position.toString().contains('BOTTOM') ? 20 : null,
              child: CustomPaint(
                painter: DesignCardBanner(edgeColor, position, edgeSize),
                child: Container(
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(radius),
                      topRight: Radius.circular(radius),
                      bottomLeft: position.toString().contains('LEFT')
                          ? Radius.zero
                          : Radius.circular(radius),
                      bottomRight: position.toString().contains('RIGHT')
                          ? Radius.zero
                          : Radius.circular(radius),
                    ),
                    color: color,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Text(text, style: textStyle),
                  ),
                ),
              ),
            )
          else
            const SizedBox.shrink(),
        ],
      );
}

class DesignCardBanner extends CustomPainter {
  DesignCardBanner(this.color, this.position, this.edgeSize);

  final Color color;
  final CardBannerPosition position;
  final double edgeSize;

  @override
  void paint(Canvas canvas, Size size) {
    if (position.toString().contains('LEFT')) {
      final Paint paint = Paint()..color = color;
      final path = Path();
      path.moveTo(0, 0);
      path.lineTo(0, size.height);
      path.lineTo(10, size.height + edgeSize);
      path.lineTo(10, size.height);
      path.lineTo(0, size.height);
      path.close();
      canvas.drawPath(path, paint);
    } else {
      final Paint paint = Paint()..color = color;
      final path = Path();
      path.moveTo(size.width, size.height);

      path.lineTo(size.width - 10, size.height + edgeSize);
      path.lineTo(size.width - 10, size.height);
      path.lineTo(size.width, size.height);
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
