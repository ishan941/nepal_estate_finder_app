import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';

class homePage extends ConsumerStatefulWidget {
  const homePage({super.key});

  @override
  ConsumerState<homePage> createState() => _homePageState();
}

TextEditingController _searchController = TextEditingController();

class _homePageState extends ConsumerState<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NefAppBar(
        title: "Home page",
      ),
      body: Column(
        children: [
          NefPadding(child: NefSearchTextForm(controller: _searchController)),
          SizedBox(
              height: 120,
              child: Image.asset(
                "assets/images/discover_your_home.png",
                fit: BoxFit.cover,
              )),
          Expanded(
            child: SingleChildScrollView(
              child: NefPadding(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Features Properties",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return NefPadding(
                            padding: const EdgeInsets.only(
                                right: 10, top: 16, bottom: 16),
                            child: Container(
                              width: 120,
                              height: 100,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
