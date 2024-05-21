import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:pro_image_editor/models/crop_rotate_editor/transform_factors.dart';

/// Decode the image being edited.
Future<DecodedImageInfos> decodeImageInfos({
  required Uint8List bytes,
  required Size screenSize,
  TransformConfigs? configs,
}) async {
  var decodedImage = await decodeImageFromList(bytes);

  bool rotated = configs?.is90DegRotated == true;
  int w = decodedImage.width;
  int h = decodedImage.height;

  if (configs != null && !configs.isEmpty) {
    w = w ~/ configs.scaleUser;
    h = h ~/ configs.scaleUser;
  }

  double widthRatio = (rotated ? h : w).toDouble() / screenSize.width;
  double heightRatio = (rotated ? w : h).toDouble() / screenSize.height;
  double pixelRatio = max(heightRatio, widthRatio);

  return DecodedImageInfos(
    rawImageSize: Size(w.toDouble(), h.toDouble()),
    imageSize: Size(w / pixelRatio, h / pixelRatio),
    pixelRatio: pixelRatio,
  );
}

class DecodedImageInfos {
  final Size rawImageSize;
  final Size imageSize;
  final double pixelRatio;

  const DecodedImageInfos({
    required this.rawImageSize,
    required this.imageSize,
    required this.pixelRatio,
  });
}