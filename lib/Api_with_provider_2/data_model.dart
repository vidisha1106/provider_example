
class DataModel
{
  final String title;
  final String body;

  DataModel({required this.title, required this.body});

  DataModel.fromJson(Map<String,dynamic> json) :
      title=json['title'],
      body=json['body'];

  Map<String,dynamic> toJson() =>
      {
        'title' : title,
        'body' : body
      };
}