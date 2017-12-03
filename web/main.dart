import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:lab_rat_wp_api/lab_rat_wp_api.dart';

String key = 'ck_09632eba43a5e6f5623179952e0078ba1446db11';
String secret = 'cs_b92da41ca70ce07bf642f0c0c978dbda54533a8c';

Future main() async {
  WCApi.Configure('zadmin.madrat.studio', key, secret);

  var client = new WCApi();

  var result2 = await client.getWC('products');
  var prods = JSON.decode(result2).map((x) => new WCProduct()..fromJson(x)).toList();
  window.console.log(prods);
}
