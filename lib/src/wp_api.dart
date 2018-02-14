import 'api_param.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:html';

import 'package:lr_storage/lr_storage.dart';

class WCApi
{
    static final String protocol = 'https://';
    static final String wpJson = 'wp-json/';
    static final String wc = 'wc/';
    static final String wp = 'wp/';
    static String version = 'v2/';
    static String host = '';  

    static String consumerKey = '';
    static String consumerSecret = '';

    static String get fullWCHost => "$protocol$host/$wpJson$wc$version"; 
    static String get fullConsumer => 'consumer_key=$consumerKey&consumer_secret=$consumerSecret';
    static String get fullHost => "$protocol$host/$wpJson$wp$version";

    static void Configure(String baseHost, [String key, String secret, String ver])
    {
        host = baseHost;

        if(key != null)
            consumerKey = key;
        
        if(secret != null)
            consumerSecret = secret;

        if(ver != null)
            version = ver;
    }

    Future<String> get(String path, [List<ApiParam> params]) async{
        var s = fullHost + path;

        if(params != null)
        {
            s += '?';
            params.forEach((p){
                s += p.param + '=' + p.value;
                if(p != params.last) s += '&'; 
            });
        }

        return (await HttpRequest.getString(s));
    }

    Future<String> getWC(String path, [List<ApiParam> params]) async{
        var s = fullWCHost + path + '?';
        if(params != null){
            params.forEach((p){
                s += p.param + '=' + p.value + '&';
            });
        }
        s += fullConsumer;
        return (await HttpRequest.getString(s));
    }

    Future<HttpRequest> postWC(String path, JsonObject data) async {

        return await HttpRequest.request(fullWCHost + path, method: 'POST', sendData: JSON.encode(data));

        // var s = fullWCHost + path;
        // return (await HttpRequest.postFormData(s, data.toMap()));
    }
}

