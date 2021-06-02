import 'package:youtube_challenge/models/comment_model.dart';
import 'package:youtube_challenge/models/creator_model.dart';

class VideoModel{
  final String id, title, preview, duration;
  final int views, uploadDate, likes, dislikes;
  final List<CommentModel> comments;
  final CreatorModel author;

  VideoModel({required this.id, required this.title, required this.preview, required this.duration, required this.views, required this.uploadDate, required this.likes, required this.dislikes, required this.comments, required this.author});


}