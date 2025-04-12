import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImageView extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  const BookImageView({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder:
            (context, url) => SizedBox(
              height: height,
              width: width,
              child: SizedBox(
                height: height,
                width: width,
                child:
                    placeholder ??
                    const Center(child: CircularProgressIndicator()),
              ),
            ),
        errorWidget:
            (context, url, error) => SizedBox(
              height: height,
              width: width,
              child: Center(
                child: errorWidget ?? const Icon(Icons.book_online_outlined),
              ),
            ),
      ),
    );
  }
}
