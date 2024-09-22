import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({Key? key, required this.value, required this.onChanged})
      : super(key: key);

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.value);
      },
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          color: widget.value ? AppColors.primaryColor : Colors.transparent,
          border: Border.all(
            color: widget.value ? AppColors.primaryColor: Colors.grey,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        child: widget.value
            ? const Icon(
          Icons.check,
          color: Colors.white,
          size: 15.0,
        )
            : null,
      ),
    );
  }
}





// class CustomCheckboxButton extends StatelessWidget {
//   CustomCheckboxButton({
//     Key? key,
//     required this.onChange,
//     this.decoration,
//     this.alignment,
//     this.isRightCheck,
//     this.iconSize,
//     this.value,
//     this.text,
//     this.width,
//     this.padding,
//     this.textStyle,
//     this.textAlignment,
//     this.isExpandedText = false,
//     this.widget,
//     this.fontSize,
//   }) : super(
//           key: key,
//         );
//
//   final BoxDecoration? decoration;
//
//   final Alignment? alignment;
//
//   final bool? isRightCheck;
//
//   final double? iconSize;
//
//   bool? value;
//
//   final Function(bool) onChange;
//
//   final String? text;
//   final Widget? widget;
//
//   final double? width;
//   final double? fontSize;
//
//   final EdgeInsetsGeometry? padding;
//
//   final TextStyle? textStyle;
//
//   final TextAlign? textAlignment;
//
//   final bool isExpandedText;
//
//   @override
//   Widget build(BuildContext context) {
//     return alignment != null
//         ? Align(
//       alignment: alignment ?? Alignment.topCenter,
//       child: buildCheckBoxWidget(),
//     )
//         : buildCheckBoxWidget();
//   }
//
//   Widget buildCheckBoxWidget() {
//     return InkWell(
//       onTap: () {
//         value = !(value!);
//         onChange(value!);
//       },
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(),
//             height: 26,
//             width: 26,
//             decoration: BoxDecoration(
//               color: value == true ? AppColors.primaryColor : Colors.transparent,
//
//               borderRadius: BorderRadius.circular(5.r),
//               border: value == true
//                   ? Border.all(color: AppColors.primaryColor, width: 2)
//                   : null,
//             ),
//             // padding: const EdgeInsets.only(bottom: 100, right: 10),
//             child: Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(bottom: 20.0),
//                 child: Icon(
//                   value == true ? Icons.check : Icons.check_box_outline_blank,
//                   color: value == true ? Colors.white : AppColors.iconGrey,
//                   size: iconSize,
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(width: 5),
//           textWidget,
//         ],
//       ),
//     );
//   }
//
//   Widget get leftSideCheckbox => Row(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 8),
//             child: checkboxWidget,
//           ),
//           isExpandedText ? Expanded(child: textWidget) : textWidget,
//         ],
//       );
//   Widget get rightSideCheckbox => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           isExpandedText ? Expanded(child: textWidget) : textWidget,
//           Padding(
//             padding: const EdgeInsets.only(left: 8),
//             child: checkboxWidget,
//           ),
//         ],
//       );
//   Widget get textWidget => widget ?? Text(
//         text ?? "",
//         textAlign: textAlignment ?? TextAlign.left,
//         style: textStyle ??   GoogleFonts.inter(
//   textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
//   ),
//       );
//   Widget get checkboxWidget => Icon(
//     value == true ? Icons.check : Icons.check_box_outline_blank,
//     color: value == true? AppColors.iconGrey : Colors.transparent,
//     size: iconSize,
//   );
// }
