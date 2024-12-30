import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/core/utils/loader.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/pages/resturent_form.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/provider/resturent_provider.dart';

class ResturentTable extends StatefulWidget {
  const ResturentTable({super.key});
  @override
  State<ResturentTable> createState() => _ResturentTableState();
}

class _ResturentTableState extends State<ResturentTable> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Future<void> fetchData() async {
    Future.delayed(Duration.zero, () async {
      await context.read<ResturentProvider>().getResturent();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Consumer<ResturentProvider>(
        builder: (context, resturentProvider, child) => Stack(
          children: [
            userInterface(resturentProvider),
            loader(resturentProvider, context)
          ],
        ),
      )),
    );
  }

  Widget userInterface(ResturentProvider resturentProvider) =>
      resturentProvider.resturentList != null &&
              resturentProvider.resturentList!.isNotEmpty
          ? ListView.builder(
              itemCount: resturentProvider.resturentList?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Resturent Id : ${resturentProvider.resturentList?[index].restaurantId}"),
                                Text(
                                    "Table Name : ${resturentProvider.resturentList?[index].tableName}"),
                                Text(
                                    "Floor : ${resturentProvider.resturentList?[index].floor}"),
                                Text(
                                    "Table number : ${resturentProvider.resturentList?[index].tableNumber}")
                              ],
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      deleteShowAlertDialog(
                                          context,
                                          resturentProvider,
                                          resturentProvider
                                              .resturentList![index].table_id!);
                                    },
                                    icon: Icon(Icons.delete)),
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ResturentForm(
                                          resturentResponseEntity:
                                              resturentProvider
                                                  .resturentList![index],
                                                  
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })
          : const SizedBox.shrink();

  Widget loader(ResturentProvider resturentProvider, BuildContext context) {
    if (resturentProvider.getResturentStatus == StatusUtil.loading) {
      return Loader.backdropFilter(context);
    } else {
      return const SizedBox.shrink();
    }
  }

  void deleteShowAlertDialog(
      BuildContext context, ResturentProvider resturentProvider, String id) {
    // Set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Delete"),
      onPressed: () async {
        Navigator.pop(context);
        resturentProvider.deleteResturent(id);
        if (resturentProvider.deleteResturentStatus == StatusUtil.success) {
          Navigator.pop(context);
          // await resturentProvider.getResturent();
        }
      },
    );

    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete box"),
      content: Text("Are you sure you want to delete?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
