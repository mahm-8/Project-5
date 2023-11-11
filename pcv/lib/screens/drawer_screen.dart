import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pcv/screens/edit_about.dart';
import 'package:pcv/screens/project.dart';
import 'package:pcv/screens/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

class DrawerScreens extends StatefulWidget {
  const DrawerScreens({
    super.key,
  });

  @override
  State<DrawerScreens> createState() => _DrawerScreensState();
}

class _DrawerScreensState extends State<DrawerScreens> {
  Map about = {};
  final ImagePicker picker = ImagePicker();
  File? imageFile;
  @override
  // void initState() {
  //   super.initState();
  //   _loadingAbout();
  // }

  // _loadingAbout() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final token = prefs.getString('token');
  //   final Response res = await network.aboutUploadMethod(token: token!);
  //   if (res.statusCode == 200) {
  //      await jsonDecode(res.body);
  //     setState(() {});
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              if (imageFile == null) {
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                print(image!.path);
                imageFile = File(image.path);
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setString('image', image.path);
                setState(() {});
              }
            },
            child: DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                children: [
                  const Text('Drawer Header'),
                  // if (about["image"] != null)
                  //   Container(
                  //       height: 100,
                  //       width: 100,
                  //       decoration: const BoxDecoration(
                  //         shape: BoxShape.circle,
                  //       ),
                  //       child: Image.file(about["image"])),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text('Update information'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditAboutScreen(),
                  ));
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: const Text('projects'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProjectScreen(),
                  ));
              // Update the state of the app.
              // ...
            },
          ),
          const Divider(
            color: Colors.black,
          ),
          const Spacer(),
          ListTile(
            title: const Text(
              'Delete Account',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              showAdaptiveDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Are You Sure Delete Account?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("back"),
                    ),
                    TextButton(
                      onPressed: () async {
                        final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        final token = prefs.getString('token');
                        network.deleteAccountMethod(token: token!);
                      },
                      child: const Text("DELETE"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}