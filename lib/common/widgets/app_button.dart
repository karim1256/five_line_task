import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String title;
  final double? height;
  final double? width;
  final double? minWidth;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? pressedColor;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final TextStyle? textStyle;
  final FontWeight? fontWeight;
  final double? fontSize;
  final bool isFullWidth;
  final bool isDisabled;

  const AppButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.height,
    this.width,
    this.minWidth,
    this.backgroundColor,
    this.textColor,
    this.disabledColor,
    this.pressedColor,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.padding,
    this.margin,
    this.textStyle,
    this.fontWeight,
    this.fontSize,
    this.isFullWidth = false,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Colors
    final effectiveBackgroundColor = backgroundColor ?? theme.primaryColor;
    final effectiveTextColor = textColor ?? theme.colorScheme.onPrimary;
    final effectiveDisabledColor = disabledColor ?? theme.disabledColor;
    final effectivePressedColor =
        pressedColor ?? theme.primaryColor.withOpacity(0.7);
    final effectiveBorderColor = borderColor ?? theme.primaryColor;

    // Sizes
    final effectiveHeight = height ?? 63.h;
    final effectiveWidth = _getWidth(context);
    final effectiveBorderRadius = borderRadius ?? 20.r;
    final effectiveBorderWidth = borderWidth ?? 0;

    // Padding - Control left/right padding independently
    final effectivePadding = padding ?? EdgeInsets.symmetric(horizontal: 100.w);
    final effectiveMargin = margin ?? EdgeInsets.symmetric(vertical: 4.h);

    // Text Style
    final effectiveTextStyle =
        textStyle ??
        TextStyle(
          color: effectiveTextColor,
          fontWeight: fontWeight ?? FontWeight.w600,
          fontSize: fontSize ?? 16.sp,
        );

    return Container(
      width: effectiveWidth,
      height: effectiveHeight,
      margin: effectiveMargin,
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDisabled
              ? effectiveDisabledColor
              : effectiveBackgroundColor,
          foregroundColor: effectiveTextColor,
          minimumSize: Size(minWidth ?? 0, effectiveHeight),
          fixedSize: effectiveWidth != null
              ? Size(effectiveWidth, effectiveHeight)
              : null,
          padding: effectivePadding, // This controls the internal padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(effectiveBorderRadius),
            side: BorderSide(
              color: isDisabled ? effectiveDisabledColor : effectiveBorderColor,
              width: effectiveBorderWidth,
            ),
          ),
          elevation: 2,
          shadowColor: Colors.black12,
          animationDuration: const Duration(milliseconds: 200),
          enableFeedback: true,
        ),
        child: Text(
          title,
          style: effectiveTextStyle,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  double? _getWidth(BuildContext context) {
    if (isFullWidth) {
      return double.infinity;
    }
    return width;
  }
}
