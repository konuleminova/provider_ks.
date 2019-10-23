class Product {
  String type;
  String name;
  String id;
  String name_az;
  String name_ru;
  String name_en;
  String maininfo_az;
  String maininfo_en;
  String maininfo_ru;
  String count;
  String counttype;
  String img;
  String price;
  String hasphoto;
  String code;
  String catid;
  String catIdParent;
  bool isLiked;
  bool isAdded;
  int weight;

  Product(
      {this.id,
      this.name_az,
      this.name_ru,
      this.name_en,
      this.maininfo_az,
      this.maininfo_en,
      this.maininfo_ru,
      this.count,
      this.counttype,
      this.img,
      this.price,
      this.hasphoto,
      this.code,
      this.type,
      this.name,
      this.catid,
      this.catIdParent,this.isLiked,this.isAdded,this.weight});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      type: json['type'] ?? "",
      name: json['name'] ?? "",
      id: json["id"],
      name_en: json["name_en"] ?? null,
      name_az: json["name_az"] ?? "Sample Title",
      name_ru: json["name_ru"] ?? "Sample Title",
      img: json["img"] ??
          "https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg",
      maininfo_az: json["maininfo_az"] ?? "Description",
      maininfo_en: json["maininfo_en"] ?? "Description",
      maininfo_ru: json["maininfo_ru"] ?? "Description",
      count: json["count"] ?? "1",
      counttype: json["counttype"] ?? "eded",
      hasphoto: json["hasphoto"] ?? "0",
      price: json["price"] ?? "AZN",
      code: json["code"] ?? "",
      catid: json['cat_id'] ?? null,
      catIdParent: json['cat-id'] ?? null,
      isLiked: false,
      isAdded: false,
      weight:json['weight']!=null? int.parse(json['weight']):1
    );
  }

  @override
  String toString() {
    return 'NewProduct{id: $id, name_az: $name_az, name_ru: $name_ru, name_en: $name_en, maininfo_az: $maininfo_az, maininfo_en: $maininfo_en, maininfo_ru: $maininfo_ru, count: $count, counttype: $counttype, img: $img, price: $price, hasphoto: $hasphoto}';
  }
}
