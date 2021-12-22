import 'package:flutter/material.dart';
import 'package:identitypass_hack/core/ui/ui.dart';

class SolidButton extends StatelessWidget {
  const SolidButton({
    Key? key,
    this.text,
    this.onPressed,
    this.color = CsColors.primary,
    this.textColor = CsColors.white,
    this.textSize = 18.0,
    this.elevation = 0.0,
    this.border = const BorderSide(color: CsColors.primary),
    this.isLoading = false,
  }) : super(key: key);

  final String? text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final double textSize;
  final double elevation;
  final BorderSide border;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: double.infinity,
      onPressed: onPressed,
      elevation: elevation,
      disabledColor: color.withOpacity(0.6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          12,
        ),
        side: onPressed == null
            ? const BorderSide(color: Colors.transparent)
            : border,
      ),
      child: Padding(
        padding: const EdgeInsets.all(
          15,
        ),
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                text!,
                style: CsTextStyle.caption.copyWith(
                  color: textColor,
                  fontSize: textSize,
                ),
              ),
      ),
    );
  }
}
