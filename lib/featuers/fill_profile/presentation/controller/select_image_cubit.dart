import 'package:app_new/featuers/fill_profile/presentation/controller/select_image_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageCubit extends Cubit<ImageStates>{
  ImageCubit() : super(InitialImageState());


  ImagePicker picker = ImagePicker();

  XFile? image;

  getPhoto(ImageSource imageSource,context) async {
    image = await picker.pickImage(source: imageSource);
    if (image != null) {
      // Close the bottom sheet
      if (Navigator.canPop(context)) {
        Navigator.pop(context);
      }
      emit(SelectImageState());
    }
  }


}