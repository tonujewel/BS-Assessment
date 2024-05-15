import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class CustomNetworkImage extends StatelessWidget {
  final String path;
  final String? placeHolderPath;
  final double? height;
  final double? width;
  final BoxFit? fit;

  const CustomNetworkImage({
    super.key,
    required this.path,
    this.placeHolderPath,
    this.height,
    this.width,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return path == ""
        ? Image.asset(
            placeHolderPath ?? "assets/images/logo.png",
            fit: fit,
            height: height,
            width: width,
          )
        : CachedNetworkImage(
            height: height,
            width: width,
            imageUrl: path,
            fit: fit,
            errorWidget: (context, url, error) => Image.asset(
              placeHolderPath ?? "assets/images/logo.png",
              fit: fit,
              height: height,
              width: width,
            ),
          );
  }
}
