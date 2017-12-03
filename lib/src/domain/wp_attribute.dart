import 'package:lr_storage/lr_storage.dart';

class WCAttribute extends JsonObject {
  int id;
  String name;
  String option;

  @override
  void fromMap(Map target) {
    id = target['id'];
    name = target['name'];
    option = target['option'];
  }

  @override
  Map toMap(){
    var m = new Map();

    m['id'] = id;
    m['name'] = name;
    m['option'] = option;

    return m;
  }
}
