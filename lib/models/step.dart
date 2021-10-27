class Step{
  final bool shouldUpload;
  final String title;
  final String videoId;


  Step({required this.shouldUpload, required this.title,required this.videoId});

  Map<String, dynamic> toMap() =>
      {
        "should_upload": shouldUpload,
        "title": title,
        "videoId":videoId
      };

  Step.fromMap(Map<dynamic, dynamic> map)
      : shouldUpload= map["should_upload"],
        title = map["title"],
        videoId = map["videoId"];
}