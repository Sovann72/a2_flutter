import 'dart:io';

import 'package:a2_tutorial/src/pages/sura_test/new_tests/my_video_edit/video_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class MyVideoEditor extends StatefulWidget {
  const MyVideoEditor({super.key});

  @override
  State<MyVideoEditor> createState() => _MyVideoEditorState();
}

class _MyVideoEditorState extends State<MyVideoEditor> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickVideo() async {
    final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);

    if (mounted && file != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoEditor(file: File(file.path))));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my video editor"),
      ),
      body: Center(
          child: IconButton(
        onPressed: _pickVideo,
        icon: Icon(Icons.video_file),
      )),
    );
  }
}
