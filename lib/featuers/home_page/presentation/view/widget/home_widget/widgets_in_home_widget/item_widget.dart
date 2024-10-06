import 'package:app_new/core/utilies/app_colors.dart';
import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_cubit.dart';
import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_states.dart';
import 'package:app_new/featuers/home_page/data/models/new_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key, required this.newModel});
  final NewModel newModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkCubit, BookMarkState>(
  builder: (context, state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: newModel.urlToImage != null && newModel.urlToImage!.isNotEmpty
                  ? newModel.urlToImage!
                  : 'https://via.placeholder.com/200',  // Fallback image URL
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(color: AppColors.blue),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error_outlined),
            ),
          ),
        ),
        const SizedBox(height: 15,),
        Text(
          textAlign: TextAlign.start,
            newModel.title??"",
          style: TextStyle(
            color: AppColors.black.withOpacity(0.4),
            fontWeight: FontWeight.w400,
            fontSize: 14
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5,),
        Text(
            newModel.desc??"",
          style: const TextStyle(
              color: AppColors.ramady,
              fontWeight: FontWeight.w400,
              fontSize: 14
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 5,),
        Text(newModel.sourceModel.name??"",
          style: const TextStyle(
              color: AppColors.ramady,
              fontWeight: FontWeight.w600,
              fontSize: 13
          ),
        ),
        const SizedBox(height: 5,),
        Row(
          children: [
            const Icon(Icons.date_range,color: AppColors.ramady,),
            const SizedBox(width: 10,),
            Text(
                convertDate(newModel.publishedAt),
              style: const TextStyle(
                  color: AppColors.ramady,
                  fontWeight: FontWeight.w400,
                  fontSize: 13
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: (){
                BlocProvider.of<BookMarkCubit>(context).changeBookMark(newModel);
                },
              icon:
               Icon(
                 Icons.bookmark,
                 color: newModel.bookMark? AppColors.blue : AppColors.greyOriginal,
               ),
            )
          ],
        )
      ],
    );
  },
);
  }
  String  convertDate(dateString ) {
    DateTime dateTime = DateTime.parse(dateString);
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(dateTime);
    // Output: 2024-09-12 – 07:05
    return formattedDate;
  }
}
