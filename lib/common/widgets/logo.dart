import 'package:five_line_task/core/constants/assets_path/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

Widget spotifyLogo({double width = 0.6}) {
  return SvgPicture.asset(AppVectors.spotifyLogo, width: width.sw);
}
