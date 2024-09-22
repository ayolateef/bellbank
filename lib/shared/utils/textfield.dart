import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? errorText;
  final String hintText;
  final String headerText;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    this.errorText,
    required this.hintText,
    required this.headerText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: GoogleFonts.outfit(
    textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, ),
    ),
        ),
        const SizedBox(height: 8), // Spacing between header and TextField
        TextField(
          controller: widget.controller,
          obscureText: widget.isPassword ? !_isPasswordVisible : false, // Toggle password visibility
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            errorText: widget.errorText,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              borderSide: BorderSide(
                color: Colors.grey.shade400, // Light grey border
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              borderSide: const BorderSide(
                color: Colors.black, // Black border when focused
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              borderSide: const BorderSide(
                color: Colors.red, // Red border when there's an error
                width: 2,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
              borderSide: const BorderSide(
                color: Colors.red, // Red border when focused with error
                width: 2,
              ),
            ),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility : Icons.visibility_off, // Eye icon
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                });
              },
            )
                : null, // Only add eye icon for password field
          ),
        ),
        const SizedBox(height: 20), // Spacing after TextField
      ],
    );
  }
}



// class CustomTextField extends FormField<String> {
//   final String? header;
//   final Color? borderColor;
//   final String? hint;
//   final bool obscureText;
//   final Widget? suffix;
//   final Widget? outerSuffix;
//   final bool readOnly;
//   final Widget? prefix;
//   final bool? headerLess;
//   final bool autoFocus;
//   final bool useMargin;
//   final int? minLines;
//   final int? maxLines;
//   final int? maxLength;
//   final int? lines;
//   final VoidCallback? onTap;
//   final Color? color;
//   final FocusNode? focusNode;
//   final List<TextInputFormatter>? textInputFormatters;
//   final FieldType? type;
//   final ActionType? textActionType;
//   final Color? errorBorderColor;
//
//   final FormFieldValidator<String>? validator;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmit;
//   final TextEditingController? textEditingController;
//   final bool alignLabelWithHint;
//
//   CustomTextField({
//     Key? key,
//     this.header,
//     this.type,
//     this.hint,
//     this.obscureText = false,
//     this.suffix,
//     this.readOnly = false,
//     this.outerSuffix,
//     this.headerLess = false,
//     this.prefix,
//     this.minLines,
//     this.maxLength,
//     this.color = Colors.transparent,
//     this.maxLines,
//     this.lines,
//     this.onTap,
//     this.autoFocus = false,
//     this.textEditingController,
//     this.textInputFormatters,
//     this.validator,
//     this.onSubmit,
//     this.textActionType,
//     this.focusNode,
//     this.onChanged,
//     this.useMargin = true,
//     this.alignLabelWithHint = false,
//     this.borderColor,
//     this.errorBorderColor,
//   }) : super(
//     key: key,
//     validator: validator,
//     enabled: true,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     initialValue:
//     textEditingController != null ? textEditingController.text : "",
//     builder: (FormFieldState<String> field) {
//       // final _CustomTextFieldState state = field as _CustomTextFieldState;
//       FocusNode _focusNode = focusNode ?? FocusNode();
//       Color currentBorderColor = borderColor ?? AppColors.grey;
//
//       // Handle focus change
//       _focusNode.addListener(() {
//         if (_focusNode.hasFocus) {
//           field.setState(() {
//             currentBorderColor = AppColors.black; // Focus border color
//           });
//         } else {
//           field.setState(() {
//             currentBorderColor = field.hasError
//                 ? Colors.red
//                 : (borderColor ?? AppColors.grey); // Error or default color
//           });
//         }
//       });
//
//       void onChangedHandler(String value) {
//         field.didChange(value);
//         if (onChanged != null) {
//           onChanged(value);
//         }
//       }
//
//       TextInputType getTextInputType() {
//         switch (type) {
//           case FieldType.email:
//             return TextInputType.emailAddress;
//
//           case FieldType.phone:
//             return TextInputType.phone;
//
//           case FieldType.multiline:
//             return TextInputType.multiline;
//
//           case FieldType.number:
//             return TextInputType.number;
//           default:
//             return TextInputType.text;
//         }
//       }
//
//       TextInputAction getActionInputType() {
//         switch (textActionType) {
//           case ActionType.next:
//             return TextInputAction.next;
//
//           case ActionType.done:
//             return TextInputAction.done;
//
//           default:
//             return TextInputAction.next;
//         }
//       }
//
//       return Container(
//
//         margin: useMargin
//             ? EdgeInsets.only(bottom: 20.h)
//             : const EdgeInsets.symmetric(vertical: 0),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(header ?? '',   style: GoogleFonts.outfit(
//         textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
//       )),
//                 8.verticalSpace,
//                 Container(
//                   decoration: BoxDecoration(
//                     color: color??  Colors.white,
//                     borderRadius: BorderRadius.circular(15.r),
//
//                       border: Border.all(
//                         color: field.hasError
//                             ? Colors.red
//                             : currentBorderColor,
//                         width: 1,
//                     ),
//
//                   ),
//                   child: Row(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 10),
//                         child: prefix ?? SizedBox(width: 7.w),
//                       ),
//                       Expanded(
//                         child: TextField(
//                           onTap: onTap,
//                           focusNode: _focusNode,
//                           cursorColor: AppColors.primaryColor,
//
//                           readOnly: readOnly,
//                           onChanged: onChangedHandler,
//                           textInputAction: getActionInputType(),
//
//                           obscureText: obscureText,
//                           keyboardType: getTextInputType(),
//                           controller: textEditingController,
//                           onSubmitted: onSubmit,
//                           inputFormatters: textInputFormatters,
//                           minLines: lines ?? minLines ?? 1,
//                           maxLines: lines ?? maxLines ?? 1,
//                           style: TextStyle(
//                             fontWeight: FontWeight.w700,
//                             fontSize: 14.sp,
//                           ),
//                           decoration: InputDecoration(
//
//                               // labelText: header ?? null,
//                               hintText: hint,
//                               hintStyle: GoogleFonts.outfit(
//                                 fontWeight: FontWeight.w500,
//                                 color: AppColors.black,
//                                 fontSize: 14.sp,
//                               ),
//                               alignLabelWithHint: alignLabelWithHint,
//                               labelStyle:GoogleFonts.outfit(
//                                 color: AppColors.black,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14.sp,
//                               ),
//                               border: const NothingInputBorder()
//
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10),
//                         child: suffix ?? const SizedBox(),
//                       )
//                     ],
//                   ),
//                 ),
//                 if (field.errorText != null)
//                   Container(
//                     margin: const EdgeInsets.only(left: 5, top: 4),
//                     child: Text(
//                       field.errorText ?? "",
//                       style: const TextStyle(
//                         color: Colors.red,
//                         fontSize: 12,
//                       ),
//                     ),
//                   )
//               ],
//             ),
//           ],
//         ),
//       );
//     },
//   );
//
//   @override
//   _CustomTextFieldState createState() => _CustomTextFieldState();
//   @override
//   void debugFillProperties(DiagnosticPropertiesBuilder properties) {
//     super.debugFillProperties(properties);
//     properties.add(DiagnosticsProperty('color', color));
//   }
// }
//
// class _CustomTextFieldState extends FormFieldState<String> {
//   late TextEditingController _controller;
//   String? _hasError;
//   final bool _isFocused = false;
//   final Color _borderColor = AppColors.grey;
//
//   TextEditingController get _effectiveController =>
//       widget.textEditingController ?? _controller;
//
//   @override
//   CustomTextField get widget => super.widget as CustomTextField;
//
//   TextInputType getTextInputType() {
//     switch (widget.type) {
//       case FieldType.email:
//         return TextInputType.emailAddress;
//
//       case FieldType.phone:
//         return TextInputType.phone;
//
//       case FieldType.multiline:
//         return TextInputType.multiline;
//
//       case FieldType.number:
//         return TextInputType.number;
//       default:
//         return TextInputType.text;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.textEditingController == null) {
//       _controller = TextEditingController(text: widget.initialValue);
//     } else {
//       widget.textEditingController!.addListener(_handleControllerChanged);
//     }
//       setState(() {
//         if (widget.validator != null) {
//           _hasError = widget.validator!(_controller.text);
//         } else {
//           _hasError = null;
//         }
//       });
//   }
//
//   @override
//   void didUpdateWidget(CustomTextField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.textEditingController != oldWidget.textEditingController) {
//       oldWidget.textEditingController?.removeListener(_handleControllerChanged);
//       widget.textEditingController?.addListener(_handleControllerChanged);
//
//       if (oldWidget.textEditingController != null &&
//           widget.textEditingController == null) {
//         _controller = TextEditingController.fromValue(
//             oldWidget.textEditingController!.value);
//       }
//       if (widget.textEditingController != null) {
//         setValue(widget.textEditingController!.text);
//         if (oldWidget.textEditingController == null) {
//           _controller;
//         }
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     widget.textEditingController?.removeListener(_handleControllerChanged);
//     super.dispose();
//   }
//
//   @override
//   void didChange(String? value) {
//     super.didChange(value);
//     if (_effectiveController.text != value) {
//       _effectiveController.text = value ?? '';
//     }
//   }
//
//   @override
//   void reset() {
//     _effectiveController.text = widget.initialValue ?? '';
//     super.reset();
//   }
//
//   void _handleControllerChanged() {
//     if (_effectiveController.text != value)
//       didChange(_effectiveController.text);
//   }
// }
//
// class NothingInputBorder extends InputBorder {
//   /// Creates an underline border for an [InputDecorator].
//   ///
//   /// The [borderSide] parameter defaults to [BorderSide.none] (it must not be
//   /// null). Applications typically do not specify a [borderSide] parameter
//   /// because the input decorator substitutes its own, using [copyWith], based
//   /// on the current theme and [InputDecorator.isFocused].
//   ///
//   /// The [borderRadius] parameter defaults to a value where the top left
//   /// and right corners have a circular radius of 4.0. The [borderRadius]
//   /// parameter must not be null.
//   const NothingInputBorder({
//     BorderSide borderSide = const BorderSide(),
//     this.borderRadius = const BorderRadius.only(
//       topLeft: Radius.circular(4.0),
//       topRight: Radius.circular(4.0),
//     ),
//   }) : super(borderSide: borderSide);
//
//   /// The radii of the border's rounded rectangle corners.
//   ///
//   /// When this border is used with a filled input decorator, see
//   /// [InputDecoration.filled], the border radius defines the shape
//   /// of the background fill as well as the bottom left and right
//   /// edges of the underline itself.
//   ///
//   /// By default the top right and top left corners have a circular radius
//   /// of 4.0.
//   final BorderRadius borderRadius;
//
//   @override
//   bool get isOutline => false;
//
//   @override
//   NothingInputBorder copyWith(
//       {BorderSide? borderSide, BorderRadius? borderRadius}) {
//     return NothingInputBorder(
//       borderSide: borderSide ?? this.borderSide,
//       borderRadius: borderRadius ?? this.borderRadius,
//     );
//   }
//
//   @override
//   EdgeInsetsGeometry get dimensions {
//     return EdgeInsets.only(bottom: borderSide.width);
//   }
//
//   @override
//   NothingInputBorder scale(double t) {
//     return NothingInputBorder(borderSide: borderSide.scale(t));
//   }
//
//   @override
//   Path getInnerPath(Rect? rect, {TextDirection? textDirection}) {
//     return Path()
//       ..addRect(Rect.fromLTWH(
//           rect!.left, rect.top, rect.width, rect.height - borderSide.width));
//   }
//
//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));
//   }
//
//   @override
//   ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
//     if (a is NothingInputBorder) {
//       return NothingInputBorder(
//         borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
//         borderRadius: BorderRadius.lerp(a.borderRadius, borderRadius, t)!,
//       );
//     }
//     return super.lerpFrom(a, t);
//   }
//
//   @override
//   ShapeBorder? lerpTo(ShapeBorder? b, double t) {
//     if (b is NothingInputBorder) {
//       return NothingInputBorder(
//         borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
//         borderRadius: BorderRadius.lerp(borderRadius, b.borderRadius, t)!,
//       );
//     }
//     return super.lerpTo(b, t);
//   }
//
//   /// Draw a horizontal line at the bottom of [rect].
//   ///
//   /// The [borderSide] defines the line's color and weight. The `textDirection`
//   /// `gap` and `textDirection` parameters are ignored.
//   @override
//   void paint(
//       Canvas canvas,
//       Rect rect, {
//         double? gapStart,
//         double gapExtent = 0.0,
//         double gapPercentage = 0.0,
//         TextDirection? textDirection,
//       }) {
//     if (borderRadius.bottomLeft != Radius.zero ||
//         borderRadius.bottomRight != Radius.zero)
//       canvas.clipPath(getOuterPath(rect, textDirection: textDirection));
//     // canvas.drawLine(rect.bottomLeft, rect.bottomRight, borderSide.toPaint());
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) return true;
//     if (other.runtimeType != runtimeType) return false;
//     return other is InputBorder && other.borderSide == borderSide;
//   }
//
//   @override
//   int get hashCode => borderSide.hashCode;
// }
//
// enum FieldType { text, email, phone, password, dropdown, number, multiline }
//
// enum ActionType { next, done }
