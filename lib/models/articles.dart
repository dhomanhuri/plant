class Articles {
  String id;
  String title;
  String isi;

  Articles({
    required this.id,
    required this.title,
    required this.isi,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'isi': isi,
      };
  static Articles fromJson(Map<String, dynamic> json) => Articles(
        id: json['id'],
        title: json['title'],
        isi: json['isi'],
      );
}
