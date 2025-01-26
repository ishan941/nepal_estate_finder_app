import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';

class CreateListing extends ConsumerStatefulWidget {
  const CreateListing({super.key});

  @override
  ConsumerState<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends ConsumerState<CreateListing> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NefAppBar(title: "Create Listing"),
      body: NefPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name"),
            NefTextFormField(),
            Text("Description"),
            NefTextFormField(),
            Text('Address'),
            NefTextFormField(),
            Row(
              children: [
                Checkbox(
                    value: check,
                    onChanged: (bool? value) {
                      check = false;
                    }),
                Text("sell"),
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: check,
                    onChanged: (bool? value) {
                      check = false;
                    }),
                Text("Rent"),
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: check,
                    onChanged: (bool? value) {
                      check
                          ? setState(() {
                              check = false;
                            })
                          : setState(() {
                              check = true;
                            });
                    }),
                Text("Parking sport"),
              ],
            ),
            Row(
              children: [
                Checkbox(
                    value: true,
                    onChanged: (bool? value) {
                      value = false;
                    }),
                Text("Furnished"),
                SizedBox(
                  width: 10,
                ),
                Checkbox(
                    value: true,
                    onChanged: (bool? value) {
                      value = false;
                    }),
                Text("Offer")
              ],
            ),
            DropdownButtonFormField(items: const [], onChanged: (value) {})
          ],
        ),
      ),
    ); // Your UI here
  }
}
