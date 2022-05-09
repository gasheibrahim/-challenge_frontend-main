import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:form_builder_file_picker/form_builder_file_picker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        searchBar: true,
        title: const Text("Edit Sector"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.only(top: 10,left:15),
            margin: const EdgeInsets.only(left: 65, top: 10, bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              const Text("Please Update Sector.", style: TextStyle(color: Colors.blue,fontSize: 25),),
            ]),
          ),
          FormBuilderTextField(
                name: "Sector Name",
                decoration: const InputDecoration(labelText: "Sector name"),
                validator: FormBuilderValidators.compose([
                  (val) {
                    return val == null ? "Field is empty" : null;
                  },
                  FormBuilderValidators.required(), 
                /// others validator
                ]),
          ),
          FormBuilderFilePicker(
            name: "Sector Image",
            decoration: const InputDecoration(labelText: "Sector Image"),
            maxFiles: null,
            previewImages: true,
            onChanged: (val) => print(val),
            selector: Row(
              children: <Widget>[
                const Icon(Icons.file_upload),
                const Text('Upload'),
              ],
            ),
            onFileLoading: (val) {
              print(val);
            },
          ),
          FormBuilderTextField(
                name: "Description",
                decoration: const InputDecoration(labelText: "Description"),
                validator: FormBuilderValidators.compose([
                  (val) {
                    return val == null ? "Field is empty" : null;
                  },
                  FormBuilderValidators.required(), 
                /// others validator
                ]),
          ),
          FormBuilderTextField(
                name: "Requirement",
                decoration: const InputDecoration(labelText: "Requirement"),
                validator: FormBuilderValidators.compose([
                  (val) {
                    return val == null ? "Field is empty" : null;
                  },
                  FormBuilderValidators.required(), 
                /// others validator
                ]),
          ),
          FormBuilderFilePicker(
            name: "Documents",
            decoration: const InputDecoration(labelText: "Documents"),
            maxFiles: null,
            previewImages: true,
            onChanged: (val) => print(val),
            selector: Row(
              children: <Widget>[
                const Icon(Icons.file_upload),
                const Text('Upload'),
              ],
            ),
            onFileLoading: (val) {
              print(val);
            },
          ),
          new Container(
              margin: const EdgeInsets.only(top: 25),
              child: Column(children: <Widget>[
                GFButton(
                  onPressed: (){},
                  text: "Update Sector",
                  size: GFSize.LARGE,
                  color: Colors.blue,
                  blockButton: true,
                ),
              ],
          ),),
        ],),
      ),
    );
  }
}
