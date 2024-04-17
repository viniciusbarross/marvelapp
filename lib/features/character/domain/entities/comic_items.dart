class ComicItems {
  String? resourceURI;
  String? name;
  String? type;

  ComicItems({this.resourceURI, this.name, this.type});

  ComicItems.fromJson(Map<String, dynamic> json) {
    resourceURI = json['resourceURI'];
    name = json['name'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resourceURI'] = resourceURI;
    data['name'] = name;
    data['type'] = type;
    return data;
  }
}
