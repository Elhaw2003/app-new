import 'package:app_new/core/utilies/app_texts.dart';
import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_cubit.dart';
import 'package:app_new/featuers/bookmark/presentation/controller/book_mark/book_mark_states.dart';
import 'package:app_new/featuers/home_page/presentation/view/widget/home_widget/widgets_in_home_widget/list_view_for_news_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookMarkCubit, BookMarkState>(
      builder: (context, state) {
        return BlocProvider.of<BookMarkCubit>(context).bookMarks.isEmpty?
            const Center(
                child: Text(
                  AppTexts.noItemsAddedInBookMark,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500
                  ),
                )
            )
            : ListViewForNewsWidget(
            news: BlocProvider.of<BookMarkCubit>(context).bookMarks
        );
      },
    );
  }
}
