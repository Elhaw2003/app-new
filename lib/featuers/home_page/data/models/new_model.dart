import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'new_model.g.dart';
@HiveType(typeId: 0)
class NewModel extends Equatable{
  @HiveField(0)
  final String? title;
  @HiveField(1)
  final String? urlToImage;
  @HiveField(2)
  final String? url;
  @HiveField(3)
  final String? desc;
  @HiveField(4)
  final String? content;
  @HiveField(5)
  final String? publishedAt;
  @HiveField(6)
  final String? author;
  @HiveField(7)
  final SourceModel sourceModel;
  @HiveField(8)
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
@HiveType(typeId: 1)
class SourceModel extends Equatable{
  @HiveField(9)
  final String? name;
  @HiveField(10)
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