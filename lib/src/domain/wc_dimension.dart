import 'package:lr_storage/lr_storage.dart';

class WCDimensions extends JsonObject{
    String length;
    String height;
    String width;

    @override
    void fromMap(Map target){
        length = target['length'];
        height = target['height'];
        width = target['width'];
    }

    @override
    Map toMap(){
        Map m = new Map();

        m['length'] = length;
        m['height'] = height;
        m['width'] = width;

        return m;
    }
}