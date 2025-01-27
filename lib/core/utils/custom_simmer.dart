import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  final double height;
  final double width;
  final BorderRadius? borderRadius;
  final bool? isProfile;

  const CustomShimmer({
    Key? key,
    required this.height,
    required this.width,
    this.borderRadius,
    this.isProfile = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          if (isProfile!)
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: borderRadius ?? BorderRadius.circular(100),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 10,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                    ),
                  )
                ],
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          isProfile!
              ? Row(
                  children: [
                    Container(
                      height: 20,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius:
                            borderRadius ?? BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
          const SizedBox(height: 10),
          Row(
            children: List.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 10),
          if (isProfile == false)
            Row(
              children: [
                Container(
                  height: 20,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: borderRadius ?? BorderRadius.circular(8.0),
                  ),
                ),
              ],
            ),
          if (isProfile == false)
            Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius:
                              borderRadius ?? BorderRadius.circular(8.0),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            )
        ],
      ),
    );
  }
}
