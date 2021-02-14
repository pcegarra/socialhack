import 'interest.dart';

class Request{

  String title;
  String content;
  String image;
  String url;
  String collaborator;
  Interest interest;

  Request.name({this.title, this.content, this.image, this.url, this.collaborator, this.interest});
}