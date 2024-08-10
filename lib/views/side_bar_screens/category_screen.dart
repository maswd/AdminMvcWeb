import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const String id = "/category";

  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String categoryName;
  dynamic _image;
  dynamic _banner;

  pickImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    }
  }

  pickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.image, allowMultiple: false);

    if (result != null) {
      setState(() {
        _banner = result.files.first.bytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 24),
              child: Container(
                alignment: Alignment.topRight,
                child: Text(
                  "دسته بندی",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: _image != null
                        ? Image.memory(_image)
                        : Text("عکس دسته بندی"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          categoryName = value;
                        });
                      },
                      validator: (value) {
                        if (value!.isNotEmpty) {
                          return null; // No error
                        } else {
                          return "لطفا نام دسته بندی را وارد کنید";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "نام دسته بندی را وارد کنید"),
                    ),
                  ),
                ),
                TextButton(onPressed: () {}, child: Text("لغو")),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Color(0xff4B49Ac))),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {}
                    },
                    child: Text(
                      "ذخیره",
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    pickBannerImage();
                  },
                  child: Text("بارگزاری عکس")),
            ),
            Divider(
              color: Colors.grey.shade200,
            ),
            Row(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: _banner != null
                        ? Image.memory(_banner)
                        : Text(
                            "بنر دسته بندی",
                            style: TextStyle(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    pickImage();
                  },
                  child: Text("بارگزاری عکس")),
            ),
          ],
        ),
      ),
    );
  }
}
