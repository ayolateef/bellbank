import 'package:bell/feature/auth/onboarding/onboarding.dart';
import 'package:bell/shared/utils/asset_images.dart';
import 'package:bell/shared/utils/colors.dart';
import 'package:bell/shared/utils/textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/back_arrow.dart';
import '../../../shared/utils/stringresources.dart';
import '../../../shared/widget/button.dart';
import '../../../shared/widget/custom_checkbox_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  String? passwordError;
  String? errorText;
  bool _isChecked = false;
    bool _isFormValid = false;
  @override
  void initState() {
    super.initState();
    _controller.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _controller.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _isChecked;
    });
  }
  void _login() {
    print('Login button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircularIconButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),

                40.verticalSpace,
                Text(Strings.welcomeBack,  style: GoogleFonts.outfit(
                  textStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w700),
                ),),
                15.verticalSpace,

                Text(Strings.loginToBellmonie,  style: GoogleFonts.outfit(
                  textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                ),),
                10.verticalSpace,
                CustomTextField(
                  controller: _controller,
                  errorText: errorText, hintText: '', headerText: 'Enter Email Address',
                ),
                CustomTextField(
                  hintText: '',
                  headerText: 'Enter Password',
                  controller: _passwordController,
                  errorText: passwordError,
                  isPassword: true,
                ),

                10.verticalSpace,
                Row(
                  children: [
                    CustomCheckbox(value: _isChecked, onChanged: (bool newValue) {
                      setState(() {
                        _isChecked = newValue;
                      });
                    },),
                    const SizedBox(width: 8.0),
                    Expanded(
                        child: Text('Remember me',  style: GoogleFonts.outfit(
                          textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColors.grey),
                        ),)
                    ),
                    TextButton(onPressed: (){}, child: Text('Forgot Password',  style: GoogleFonts.outfit(
                      textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400, color: AppColors.primaryColor),
                    ),))
                  ],
                ),
                15.verticalSpace,
              ],
            ),
          ),


                  const Divider(),
                  20.verticalSpace,
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        AppButton(
                          text: "Login",
                          onPressed: _isFormValid ? _login : null, // Disable button if form is not valid
                          color: _isFormValid
                              ? AppColors.primaryColor
                              : AppColors.primaryColor.withOpacity(0.5), // Apply opacity
                        ),
                        20.verticalSpace,
                        AppButton(
                          color: AppColors.lightYellow,
                          borderColor: AppColors.primaryColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AssetResources.fingerPrint),
                              10.horizontalSpace,
                              Text('Login with Biometric',  style: GoogleFonts.inter(
                                textStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500, color: AppColors.primaryColor),
                              ),)
                            ],
                          ),
                        ),
                        15.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Don’t have an account? ',
                                style: TextStyle(
                                  color: AppColors.grey,
                                  fontSize: 14.sp,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'SIGN UP',
                                    style: TextStyle(
                                      color: AppColors.primaryColor, // Blue color
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // Navigate to sign up page or perform sign up action
                                        Navigator.pushNamed(context, '/sign-up');
                                      },
                                  ),
                                ],
                              ),
                            ),
                            const Icon(Icons.arrow_forward, color: AppColors.primaryColor,),

                          ],
                        ),

                        20.verticalSpace,
                      ],
                    ),
                  ),

                  const Divider(),


                ],
              ),
        ));
  }
}
