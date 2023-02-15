class ResponseProductCard {
  int? id;
  String? image;
  String? kategori;
  String? nameItem;
  int? harga;

  ResponseProductCard(
      {this.id, this.image, this.kategori, this.nameItem, this.harga});

  ResponseProductCard.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    kategori = json['kategori'];
    nameItem = json['name_item'];
    harga = json['harga'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['kategori'] = this.kategori;
    data['name_item'] = this.nameItem;
    data['harga'] = this.harga;
    return data;
  }

  static List<ResponseProductCard> fromJsonList(List list) {
    return list.map((item) => ResponseProductCard.fromJson(item)).toList();
  }
}
