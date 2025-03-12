class StoneShape {
  int? id;
  String? stoneName;
  String? stoneImage;

  StoneShape({this.id, this.stoneName, this.stoneImage});

  StoneShape.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stoneName = json['stone_name'];
    stoneImage = json['stone_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stone_name'] = this.stoneName;
    data['stone_image'] = this.stoneImage;
    return data;
  }
}
