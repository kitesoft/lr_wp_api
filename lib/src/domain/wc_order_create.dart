import 'package:lr_storage/lr_storage.dart';

class WCOrderCreate extends JsonObject{

  String payment_method = 'basic';
  String payment_method_title = '';
  
  bool set_paid = false;
  WCOrderUserData billing;
  WCOrderUserData shipping;

  List<WCOrderProductData> line_items;
  WCOrderShippingLines shipping_lines;

  @override
  void fromMap(Map target) {
    
  }

  @override
  Map toMap() {
    var target = new Map();

    target['payment_method'] = payment_method;
    target['payment_method_title'] = payment_method_title;
    target['set_paid'] = set_paid;

    if(billing != null){
      target['billing'] = billing.toMap();
    }

    if(shipping != null){
      target['shipping'] = shipping.toMap();
    }

    if(line_items != null){
      var i = [];
      line_items.forEach((x){
        i.add(x.toMap());
      });
      target['line_items'] = i;
    }

    if(shipping_lines != null){
      target['shipping_lines'] = shipping_lines.toMap();
    }
    

    return target;
  }
}

class WCOrderUserData extends JsonObject{
  String first_name;
  String second_name;
  String address_1;
  String address_2;
  String city;
  String state;
  String postcode;
  String email;
  String phone;

  @override
  void fromMap(Map target) {
    first_name = target['first_name'];
    second_name = target['second_name'];
    address_1 = target['address_1'];
    address_2 = target['address_2'];
    city = target['city'];
    state = target['state'];
    postcode = target['postcode'];
    
    if(target.containsKey('email'))
      email = target['email'];
    
    if(target.containsKey('phone'))
      phone = target['phone'];
  }

  @override
  Map toMap() {
    var target = new Map();

    target['first_name'] = first_name;
    target['second_name'] = second_name;
    target['address_1'] = address_1;
    target['address_2'] = address_2;
    target['city'] = city;
    target['state'] = state;
    target['postcode'] = postcode;
    target['email'] = email;
    target['phone'] = phone;

    return target;
  }
}

class WCOrderProductData extends JsonObject{
  int product_id;
  int variation_id;
  int quantity;

  
  @override
  void fromMap(Map target) {
    product_id = target['product_id'];
    variation_id = target['variation_id'];
    quantity = target['quantity'];
  }

  @override
  Map toMap() {
    var target = new Map();

    target['product_id'] = product_id;
    target['quantity'] = quantity;
    if(variation_id != null)
      target['variation_id'] = variation_id;

    return target;
  }
}

class WCOrderShippingLines extends JsonObject{
  String method_id;
  String method_title;
  int total;

  @override
  void fromMap(Map target) {
  }

  @override
  Map toMap() {
    var target = new Map();

    target['method_id'] = method_id;
    target['method_title'] = method_title;
    target['total'] = total;

    return target;
  }
}