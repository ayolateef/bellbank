import 'package:bell/feature/auth/route/routes.dart';
import 'package:bell/shared/utils/asset_images.dart';
import 'package:bell/shared/utils/colors.dart';
import 'package:bell/shared/widget/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/utils/stringresources.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;
  final List<String> _texts = [
    Strings.secureGlobal,
    Strings.performInternational,
    Strings.secureGlobal,
    Strings.performInternational,
    Strings.secureGlobal,
    Strings.performInternational,
  ];

  @override
  void initState() {
    // Timer.periodic(Duration(seconds: 3), (timer) {
    //   setState(() {
    //     _currentIndex = (_currentIndex + 1) % _texts.length;
    //   });
    // });
    super.initState();
  }
  final _pages = [
    Column(
      children: [
        Text(
          Strings.secureGlobal,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
          ),
        ),
        10.verticalSpace,
        Text(Strings.performInternational,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle:
              TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey

              ),
            )),
      ],
    ),
    Column(
      children: [
        Text(
          Strings.enjoyEnhanced,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
          ),
        ),
        10.verticalSpace,
        Text(Strings.gainUnrestricted,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle:
              TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey

              ),
            )),
      ],
    ),
    Column(
      children: [
        Text(
          Strings.inviteOversee,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            textStyle: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.w700),
          ),
        ),
        10.verticalSpace,
        Text(Strings.inviteTeam,
            textAlign: TextAlign.center,
            style: GoogleFonts.inter(
              textStyle:
              TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.grey

              ),
            )),
      ],
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 80,),
            child: Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                 mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(AssetResources.OnboardingPage,
                 width: double.infinity,
          
          
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/5,
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: PageView(
                          onPageChanged: (index) => setState(() => _currentPage = index),
                          children: _pages,
                        ),
                      ),
                      20.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_pages.length, (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 14.w,
                          height: 3.h,
                          decoration: BoxDecoration(
                            color: _currentPage == index ? Colors.blue : Colors.grey,
                     borderRadius: BorderRadius.circular(
                       20.r
                     )
                          ),
                        )),
                      ),
                      20.verticalSpace,

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.w),
                        child: Column(
                          children: [
                            AppButton(
                              text: "Create Account",
                              radius: 100.r,
                            ),
                            20.verticalSpace,
                            AppButton(
                              onPressed: (){
                                Navigator.of(context).pushNamed(AuthRoutes.login);
                              },
                              text: "Already a member? Login",
                              radius: 100.r,
                              borderColor: AppColors.primaryColor,
                              color: AppColors.whiteColor,
                              textStyle: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 15.sp
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
            ),
          ),
        ));
  }
}
