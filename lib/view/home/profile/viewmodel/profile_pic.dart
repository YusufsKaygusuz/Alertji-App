import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  final ValueChanged<File?> onImageChanged;
  final File? initialImage;

  const ProfilePic({
    Key? key,
    required this.onImageChanged,
    this.initialImage,
  }) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  late ImagePicker _imagePicker;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
    _imageFile = widget.initialImage;
  }

  Future<void> _pickImage() async {
    final pickedImage =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final newImageFile = File(pickedImage.path);
      widget.onImageChanged(newImageFile);

      setState(() {
        _imageFile = newImageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          CircleAvatar(
            backgroundImage: _imageFile != null
                ? FileImage(_imageFile!)
                : AssetImage("assets/images/onboard2.jpg")
                    as ImageProvider<Object>?,
          ),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.white),
                  ),
                  backgroundColor: const Color(0xFFF5F6F9),
                ),
                onPressed: _pickImage,
                child: const Icon(Icons.camera_alt),
              ),
            ),
          )
        ],
      ),
    );
  }
}
