import 'package:lr_storage/lr_storage.dart';

class WPTag extends JsonObject{
    int id;
    String name;
    String slug;

    @override
    void fromMap(Map target){
        id = target['id'];
        name = target['name'];
        slug = target['slug'];
    }

    @override
    Map toMap(){
        var m = new Map();

        m['id'] = id;
        m['name'] = name;
        m['slug'] = slug;

        return m;
    }

}