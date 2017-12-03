import 'package:lr_storage/lr_storage.dart';

class WPImage extends JsonObject {
  int id = -1;
  String src;
  String name;
  String alt;
  int position;

  WPImage() {}

  WPImage.fromSrc(String url) {
    src = url;
  }

  @override
  void fromMap(target) {
    id = target['id'];
    src = target['src'];
    name = target['name'];
    alt = target['alt'];
    position = target['position'];
  }

  @override
  Map toMap(){
    var m = new Map();

    m['id'] = id;
    m['src'] = src;
    m['name'] = name;
    m['alt'] = alt;
    m['position'] = position;

    return m;
  }
}
