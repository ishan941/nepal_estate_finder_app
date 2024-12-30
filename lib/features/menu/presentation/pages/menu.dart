import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/loader.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/entities/resturent_entities.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/pages/resturent_table.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/provider/resturent_provider.dart';

class CreateMenu extends StatefulWidget {
  final ResturentResponseEntity? resturentResponseEntity;

  const CreateMenu({Key? key, this.resturentResponseEntity})
      : super(key: key);

  @override
  _ResturentFormState createState() => _ResturentFormState();
}

class _ResturentFormState extends State<CreateMenu> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,(){
      getControllerData();
    });
    
  }
  getControllerData(){
      final provider = Provider.of<ResturentProvider>(context, listen: false);
    if (widget.resturentResponseEntity != null) {
    
      provider.tableNameController.text =
          widget.resturentResponseEntity?.tableName ?? '';
      provider.floorController.text =
          widget.resturentResponseEntity?.floor ?? '';
      provider.tableNumberController.text =
          widget.resturentResponseEntity?.tableNumber?.toString() ?? '';
      provider.numberOfSeatsController.text =
          widget.resturentResponseEntity?.numberOfSeats?.toString() ?? '';
    }

  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ResturentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resturentResponseEntity == null
            ? 'Add Menu'
            : 'Edit Resturent'),
      ),
      body: SafeArea(
        child: Consumer<ResturentProvider>(
          builder: (context, resturentProvider, child) => Form(
            key: _formKey,
            child: Stack(
              children: [
                userInterface(resturentProvider),
                loader(resturentProvider, context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loader(ResturentProvider resturentProvider, BuildContext context) {
    if (resturentProvider.editResturentStatus == StatusUtil.loading ||
        resturentProvider.addResturentStatus == StatusUtil.loading) {
      return Loader.backdropFilter(context);
    }
    return const SizedBox();
  }

  Widget userInterface(ResturentProvider provider) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: provider.tableNameController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: provider.floorController,
              decoration: const InputDecoration(labelText: 'Category'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Category';
                }
                return null;
              },
            ),
            TextFormField(
              controller: provider.tableNumberController,
              decoration: const InputDecoration(labelText: "Price"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter table number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: provider.tableNumberController,
              decoration: const InputDecoration(labelText: "Cooking Time"),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter table number';
                }
                return null;
              },
            ),
            TextFormField(
              controller: provider.numberOfSeatsController,
              decoration: const InputDecoration(labelText: 'Description'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter number of seats';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  handleResponse(provider);
                }
              },
              child:
                  Text(widget.resturentResponseEntity == null ? 'Add' : 'Edit'),
            ),
          ],
        ),
      ),
    );
  }

  void handleResponse(ResturentProvider provider) async {
    if (widget.resturentResponseEntity == null) {
      await provider.addResturent();
      if (provider.addResturentStatus == StatusUtil.success) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResturentTable()));
        InfoHelper.showToast("Successfully Added");
      } else if (provider.addResturentStatus == StatusUtil.error) {
        InfoHelper.showToast("Failed to Add");
      }
    } else {
      await provider.editResturent(widget.resturentResponseEntity!.table_id!);
      if (provider.editResturentStatus == StatusUtil.success) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResturentTable()));
        InfoHelper.showToast("Successfully Edited");
      } else if (provider.editResturentStatus == StatusUtil.error) {
        InfoHelper.showToast("Failed to Edit");
      }
    }
  }
}
