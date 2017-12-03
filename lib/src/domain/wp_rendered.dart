import 'package:lr_storage/lr_storage.dart';

class WPRendered extends JsonObject{
    String rendered;
    bool protected;

    @override
    void fromMap(Map target){
        rendered = target['rendered'];
        protected = target.containsKey('protected') ? target['protected'] : false;
    }

    @override
    Map toMap(){
        var m = new Map();

        m['rendered'] = rendered;
        m['protected'] = protected;

        return m;
    }
}