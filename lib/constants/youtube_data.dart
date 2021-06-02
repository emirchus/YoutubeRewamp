import 'dart:math';

import 'package:youtube_challenge/models/comment_model.dart';
import 'package:youtube_challenge/models/creator_model.dart';
import 'package:youtube_challenge/models/video_model.dart';

class YoutubeData{
  static final Random random = Random();
  static List<VideoModel> _videos = [
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Sleep on the floor - The Lumineers",
      preview: "assets/images/Sleep on the floor.png",
      duration: "3:17",
      views: 1300000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["tlo"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Little Dark Age - MGMT",
      preview: "assets/images/Little Dark Age.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["mgmt"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Ramona - Ojos Tristes [Letra]",
      preview: "assets/images/ojos tristes.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["r"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Ramona - Ojos Tristes [Letra]",
      preview: "assets/images/ojos tristes letra.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["r"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Ramona - Ojos Tristes [Letra]",
      preview: "assets/images/ojos tristes.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["r"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "The 1997 - Somebody Else [Live]",
      preview: "assets/images/Somebody Else.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["r"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Un Leon Marinero & Keevin Kaarl - Por Ti Me Quedo en San Luis",
      preview: "assets/images/Por Ti Me Quedo en San Luis.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["kk"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "LSD - Mountain [Lyrics] Español",
      preview: "assets/images/Mountains.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["kk"]!
    ),
    VideoModel(
      id: "${(random.nextDouble() * DateTime.now().millisecondsSinceEpoch).round()}",
      title: "Cámara Lenta",
      preview: "assets/images/camara lenta.png",
      duration: "3:17",
      views: 13000000,
      uploadDate: DateTime.now().microsecondsSinceEpoch,
      likes: 200000,
      dislikes: 12402,
      comments: [
        CommentModel(username: "Usuario", comment: "Like si estás acá en 2021 UwU", picture: "assets/images/user_comment.png")
      ],
      author: _creators["omam"]!
    ),
  ];

  static Map<String, CreatorModel> _creators = {
    "tlo": CreatorModel(username: "The Lumineers Official", picture: "assets/images/The Lumineers Official.png", subscribers: 1300000),
    "mgmt": CreatorModel(username: "MGMT", picture: "assets/images/mgmt.png", subscribers: 1300000.toInt()),
    "omam": CreatorModel(username: "Of Monsters And Men", picture: "assets/images/Of Monsters And Men.png", subscribers: 1300000),
    "r": CreatorModel(username: "Ramona", picture: "assets/images/ramona.png", subscribers: 1300000),
    "kk": CreatorModel(username: "Kevin Kaarl", picture: "assets/images/kevin kaarl.png", subscribers: 1300000),
  };

  static List<VideoModel> get getVideos => _videos;

  static List<CreatorModel> get getCreators => _creators.entries.map((e) => e.value).toList();



}