class ResponseCarousel {
  String? image;

  ResponseCarousel({this.image});

  ResponseCarousel.fromJson(Map<String, dynamic> json) {
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    return data;
  }

  static List<ResponseCarousel> fromJsonList(List list) {
    return list.map((item) => ResponseCarousel.fromJson(item)).toList();
  }
}
