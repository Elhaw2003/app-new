import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/utilies/app_colors.dart';
import '../../../../../core/utilies/app_texts.dart';
import '../../controller/select_image_cubit.dart';

class ShowBottomSheet extends StatelessWidget {
  const ShowBottomSheet({super.key, required this.imageCubit,});
  final ImageCubit imageCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                return imageCubit.getPhoto(ImageSource.camera, context);
              },
              child: Container(
                child: Column(
                  children: [
                    Icon(
                      Icons.add_a_photo,
                      color: AppColors.blue,
                      size: 30,
                    ),
                    SizedBox(height: 15,),
                    Text(
                      AppTexts.camera,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.blue
                      ),
                    )
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                return imageCubit.getPhoto(ImageSource.gallery,context);
              },
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.photo,
                      color: AppColors.blue,
                      size: 30,
                    ),
                    SizedBox(height: 15,),
                    Text(
                      AppTexts.gallery,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.blue
                      ),
                    )
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
//showModalBottomSheet(
//                       backgroundColor: AppColors.white,
//                       context: context, builder:(c){
//                     return Padding(
//                       padding: const EdgeInsets.all(20),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: GestureDetector(
//                               onTap: (){
//                                 return getPhoto(ImageSource.camera);
//                               },
//                               child: Container(
//                                 child: Column(
//                                   children: [
//                                     Icon(
//                                       Icons.add_a_photo,
//                                       color: AppColors.mainColor,
//                                       size: 30,
//                                     ),
//                                     SizedBox(height: 15,),
//                                     Text(
//                                       AppTexts.camera,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 15,
//                                           color: AppColors.mainColor
//                                       ),
//                                     )
//                                   ],
//                                   mainAxisSize: MainAxisSize.min,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: GestureDetector(
//                               onTap : (){
//                                 return getPhoto(ImageSource.gallery);
//                               },
//                               child: Container(
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       Icons.photo,
//                                       color: AppColors.mainColor,
//                                       size: 30,
//                                     ),
//                                     SizedBox(height: 15,),
//                                     Text(
//                                       AppTexts.gallery,
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 15,
//                                           color: AppColors.mainColor
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     );
//                   } );
