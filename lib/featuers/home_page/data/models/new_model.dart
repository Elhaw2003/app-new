class NewModel{

  final String? title;
  final String? urlToImage;
  final String? url;
  final String? desc;
  final String? content;
  final String? publishedAt;
  final String? author;

  final SourceModel sourceModel;

  NewModel({

    required this.title,
    required this.urlToImage,
    required this.url,
    required this.desc,
    required this.content,
    required this.publishedAt,
    required this.sourceModel,
    required this.author,

});

}

class SourceModel{
  final String? name;
  final String? id;

  SourceModel({
    required this.name,
    required this.id,
});

}