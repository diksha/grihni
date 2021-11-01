class Step {
  final bool shouldUpload;
  final String title;
  final String videoId;

  Step(
      {required this.shouldUpload, required this.title, required this.videoId});

  Map<String, dynamic> toMap() =>
      {"should_upload": shouldUpload, "title": title, "videoId": videoId};

  Step.fromJson(Map<String, dynamic> json)
      : shouldUpload = json["should_upload"],
        title = json["title"],
        videoId = json["videoId"];
}
