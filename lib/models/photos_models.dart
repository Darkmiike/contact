class Photo {
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo(
      {required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> pics) {
    return Photo(
        id: pics['id'],
        title: pics['title'],
        url: pics['url'],
        thumbnailUrl: pics['thumbnailUrl']);
  }
}
