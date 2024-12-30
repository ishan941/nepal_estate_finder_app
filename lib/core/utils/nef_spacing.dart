import 'package:flutter/material.dart';

class NefSpacing {
  static const double spacing0_5 = 2.0; // 0.125rem
  static const double spacing1 = 4.0; // 0.25rem
  static const double spacing1_5 = 6.0; // 0.375rem
  static const double spacing2 = 8.0; // 0.5rem
  static const double spacing2_5 = 10.0; // 0.625rem
  static const double spacing3 = 12.0; // 0.75rem
  static const double spacing3_5 = 14.0; // 0.875rem
  static const double spacing4 = 16.0; // 1rem
  static const double spacing5 = 20.0; // 1.25rem
  static const double spacing6 = 24.0; // 1.5rem
  static const double spacing7 = 28.0; // 1.75rem
  static const double spacing8 = 32.0; // 2rem
  static const double spacing9 = 36.0; // 2.25rem
  static const double spacing10 = 40.0; // 2.5rem
  static const double spacing11 = 44.0; // 2.75rem
  static const double spacing12 = 48.0; // 3rem
  static const double spacing13 = 52.0; // 3.25rem
  static const double spacing14 = 56.0; // 3.5rem
  static const double spacing15 = 60.0; // 3.75rem
  static const double spacing16 = 64.0; // 4rem
  static const double spacing17 = 68.0; // 4.25rem
  static const double spacing18 = 72.0; // 4.5rem
  static const double spacing19 = 76.0; // 4.75rem
  static const double spacing20 = 80.0; // 5rem
  static const double spacing21 = 84.0; // 5.25rem
  static const double spacing22 = 88.0; // 5.5rem
  static const double spacing23 = 92.0; // 5.75rem
  static const double spacing24 = 96.0; // 6rem
  static const double spacing25 = 100.0; // 6.25rem
  static const double spacing26 = 104.0; // 6.5rem
  static const double spacing27 = 108.0; // 6.75rem
  static const double spacing28 = 112.0; // 7rem
  static const double spacing29 = 116.0; // 7.25rem
  static const double spacing30 = 120.0; // 7.5rem
  static const double spacing31 = 124.0; // 7.75rem
  static const double spacing32 = 128.0; // 8rem
  static const double spacing33 = 132.0; // 8.25rem
  static const double spacing34 = 136.0; // 8.5rem
  static const double spacing35 = 140.0; // 8.75rem
  static const double spacing36 = 144.0; // 9rem
  static const double spacing37 = 148.0; // 9.25rem
  static const double spacing38 = 152.0; // 9.5rem
  static const double spacing39 = 156.0; // 9.75rem
  static const double spacing40 = 160.0; // 10rem
  static const double spacing41 = 164.0; // 10.25rem
  static const double spacing42 = 168.0; // 10.5rem
  static const double spacing43 = 172.0; // 10.75rem
  static const double spacing44 = 176.0; // 11rem
  static const double spacing45 = 180.0; // 11.25rem
  static const double spacing46 = 184.0; // 11.5rem
  static const double spacing47 = 188.0; // 11.75rem
  static const double spacing48 = 192.0; // 12rem
  static const double spacing49 = 196.0; // 12.25rem
  static const double spacing50 = 200.0; // 12.5rem
  //
  static const double spacing66 = 264;
  static const double spacing67 = 268.0;
  static const double spacing72 = 288.0;
  static const double spacing142 = 568;
  static const double spacing150 = 620;
  static const double noInterNetImageSize = 286;
  static const double thereeStudentSize = 209;
  static const double twoStudentSize = 162;
}

class NefSize {
  static double getHeight(BuildContext context, double value) {
    return MediaQuery.of(context).size.height * (value / 1000);
  }

  static double getWidth(BuildContext context, double value) {
    return MediaQuery.of(context).size.width * (value / 100);
  }

  static double getSize(BuildContext context, BoxConstraints constraints,
          double value, double valueBox) =>
      getHeight(context, value) + getWidth(context, value) + 5;
}

class NefRadius {
  static const double radius1 = 4.0;
  static const double radius1_1 = 5.0;
  static const double radius2 = 8.0;
  static const double radius3 = 12.0;
  static const double radius4 = 16.0;
  static const double radius5 = 20;
  static const double radius6 = 24;
  static const double radius7 = 28;
}
