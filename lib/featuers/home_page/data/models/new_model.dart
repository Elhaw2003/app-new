import 'package:equatable/equatable.dart';

class NewModel extends Equatable{

  final String? title;
  final String? urlToImage;
  final String? url;
  final String? desc;
  final String? content;
  final String? publishedAt;
  final String? author;

  final SourceModel sourceModel;
  bool bookMark;

  NewModel({

    required this.title,
    required this.urlToImage,
    required this.url,
    required this.desc,
    required this.content,
    required this.publishedAt,
    required this.sourceModel,
    required this.author,
    this.bookMark = false,

});

  @override
  // TODO: implement props
  List<Object?> get props => [
    title,
    urlToImage,
    url,
    desc,
    content,
    publishedAt,
    author,
    sourceModel
  ];

}

class SourceModel extends Equatable{
  final String? name;
  final String? id;

  SourceModel({
    required this.name,
    required this.id,
});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id,
    name
  ];

}