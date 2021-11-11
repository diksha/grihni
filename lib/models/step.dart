class Step {
  final bool shouldUpload;
  final String title_en;
  final String title_np;
  final String videoId;

  Step(
      {required this.shouldUpload, required this.title_en,required this.title_np, required this.videoId});

  Map<String, dynamic> toMap() =>
      {"should_upload": shouldUpload, "title_en": title_en,"title_np": title_np, "videoId": videoId};

  Step.fromJson(Map<String, dynamic> json)
      : shouldUpload = json["should_upload"],
        title_en = json["title_en"],
        title_np = json["title_np"],
        videoId = json["videoId"];
}
