import 'wc_dimension.dart';
import 'wp_attribute.dart';
import 'wp_category.dart';
import 'wp_image.dart';
import 'package:lr_storage/lr_storage.dart';
import 'wp_tag.dart';

class WCProduct extends JsonObject {
  int id;
  int parentId;
  List<String> variations;

  String slug;
  String permalink;

  String name;
  String description;
  String short_description;

  String _dateCreated;
  String _dateModified;

  DateTime get date_created => DateTime.parse(_dateCreated);
  void set date_created(DateTime date) {
    _dateCreated = date.toString();
  }

  DateTime get date_modified => DateTime.parse(_dateModified);
  void set date_modified(DateTime date) {
    _dateModified = date.toString();
  }

  bool purchasable;

  String type;
  String status;
  bool featured;
  bool catalog_visibility;

  int price;
  int regular_price;
  int sale_price;
  bool on_sale;
  String price_html;

  List<String> cross_sale_ids = [];
  List<String> upsale_ids = [];
  List<String> related_ids = [];

  int weight;

  List<WPTag> tags;
  List<WPImage> images;
  WPImage _image = null;
  WPImage get image => _image != null ? _image : (images != null && images.length > 0) ? images.first : new WPImage.fromSrc('http://placehold.it/300/300');

  List<WPCategory> categories;
  WCDimensions dimensions;
  List<WCAttribute> attributes;

  @override
  void fromMap(target) {
    id = target['id'];
    parentId = target['parent_id'];

    slug = target['slug'];
    permalink = target['permalink'];

    name = target['name'];
    description = target['description'];
    short_description = target['short_description'];

    date_created = target['date_created'];
    date_modified = target['date_modified'];

    purchasable = target['purchasable'];

    type = target['type'];
    status = target['status'];
    featured = target['featured'];
    catalog_visibility = target['catalog_visibility'];

    price = target['price'];
    regular_price = target['regular_price'];
    sale_price = target['sale_price'];
    on_sale = target['on_sale'];
    price_html = target['price_html'];

    if (target.containsKey('cross_sale_ids')) cross_sale_ids = target['cross_sale_ids']?.toList() ?? new List<String>();

    if (target.containsKey('upsale_ids')) upsale_ids = target['upsale_ids'].toList() ?? new List<String>();

    weight = target['weight'];

    tags = [];
    if (target.containsKey('tags')) tags = target['tags'].map((x) => new WPTag()..fromJson(x)).toList();

    images = [];
    if (target.containsKey('images')) images = target['images'].map((x) => new WPImage()..fromJson(x)).toList();

    _image = null;
    if (target.containsKey('image')) {
      _image = new WPImage()..fromJson(target['image']);
    }
    categories = [];
    if (target.containsKey('categories')) categories = target['categories'].map((x) => new WPCategory()..fromJson(x)).toList();

    attributes = [];
    if (target.containsKey('attributes')) attributes = target['attributes'].map((x) => new WCAttribute()..fromJson(x)).toList();

    variations = [];
    if (target.containsKey('variations')) variations = target['variations'].toList();

    if (target.containsKey('related_ids')) related_ids = target['related_ids'].toList();

    dimensions = new WCDimensions()..fromJson(target['dimensions']);
  }

  @override
  Map toMap() {
    Map m = new Map();

    m['id'] = id;
    m['parentId'] = parentId;

    m['variations'] = variations;
    m['slug'] = slug;
    m['permalink'] = permalink;

    m['name'] = name;
    m['description'] = description;
    m['short_description'] = short_description;

    m['date_created'] = _dateCreated;
    m['date_modified'] = _dateModified;

    m['purchasable'] = purchasable;

    m['type'] = type;
    m['status'] = status;
    m['featured'] = featured;
    m['catalog_visibility'] = catalog_visibility;

    m['price'] = price;
    m['regular_price'] = regular_price;
    m['sale_price'] = sale_price;
    m['on_sale'] = on_sale;
    m['price_html'] = price_html;

    m['cross_sale_ids'] = cross_sale_ids;
    m['upsale_ids'] = upsale_ids;
    m['related_ids'] = related_ids;

    m['weight'] = weight;

    if (tags != null) {
      m['tags'] = tags.map((x) => x.toMap()).toList();
    } else {
      m['tags'] = [];
    }

    if (images != null) {
      m['images'] = images.map((x) => x.toMap()).toList();
    } else {
      m['images'] = [];
    }

    m['image'] = image?.toMap();

    if (categories != null) {
      m['categories'] = categories.map((x) => x.toMap()).toList();
    } else {
      m['categories'] = [];
    }

    m['dimensions'] = dimensions?.toMap();

    if (attributes != null) {
      m['attributes'] = attributes.map((x) => x.toMap()).toList();
    } else {
      m['attributes'] = [];
    }

    return m;
  }
}
