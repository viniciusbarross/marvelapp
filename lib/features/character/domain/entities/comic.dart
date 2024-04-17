import 'package:heroesapp/features/character/domain/entities/comic_items.dart';

class Comics {
  int? available;
  String? collectionURI;
  List<ComicItems>? items;
  int? returned;

  Comics({this.available, this.collectionURI, this.items, this.returned});

  Comics.fromJson(Map<String, dynamic> json) {
    available = json['available'];
    collectionURI = json['collectionURI'];
    if (json['items'] != null) {
      items = <ComicItems>[];
      json['items'].forEach((v) {
        items!.add(ComicItems.fromJson(v));
      });
    }
    returned = json['returned'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['collectionURI'] = collectionURI;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['returned'] = returned;
    return data;
  }
}
