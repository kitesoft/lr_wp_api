import 'package:lr_storage/lr_storage.dart';
import 'wp_rendered.dart';

class WPPost extends JsonObject{
    int id;
    String slug;
    String status;
    String type;
    String link;
    WPRendered title;
    WPRendered content;
    WPRendered excerpt;

    DateTime _date;
    void set date(String date) => _date = DateTime.parse(date);
    String get date => _date.toString();

    @override
    void fromMap(Map target){
        id = target['id'];
        slug = target['slug'];
        status = target['status'];
        type = target['type'];
        link = target['link'];

        date = target['date'];

        title = new WPRendered()..fromJson(target['title']);
        content = new WPRendered()..fromJson(target['content']);
        excerpt = new WPRendered()..fromJson(target['excerpt']);
    }

    @override
    Map toMap(){
        var m = new Map();

        m['id'] = id;
        m['slug'] = slug;
        m['status'] = status;
        m['type'] = type;
        m['link'] = link;
        m['title'] = title?.toMap();
        m['content'] = content?.toMap();
        m['excerpt'] = excerpt?.toMap();
        m['date'] = date;

        return m;
    }
}