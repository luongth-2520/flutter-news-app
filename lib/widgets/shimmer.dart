import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget shimmerWidget(double height, double width) {
  return Container(
    width: width,
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        SizedBox(
          height: height,
          child: Shimmer.fromColors(
              child: Container(
                color: Colors.white,
              ),
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100),
        ),
      ],
    ),
  );
}

Widget shimmerLine(double width) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: SizedBox(
      height: 14,
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          color: Colors.white,
        ),
      ),
    ),
  );
}
