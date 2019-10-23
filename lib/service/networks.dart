import 'dart:convert';
import 'package:flutter_kendden_shehere/model/home_list.dart';
import 'package:flutter_kendden_shehere/model/products_in_category_model.dart';
import 'package:http/http.dart' as http;

class Networks {
  Networks._privateConstructor();

  static final Networks _instance = Networks._privateConstructor();

  factory Networks() {
    return _instance;
  }

//Kendden Shehere APIs
  String BASE_KS_URL = "http://kenddenshehere.az/api/?act=";

  dynamic productsInCategory(
      String id, String order, String lang, String limit, String start) async {
    try {
      print("Product in cat");
      print("PRoduct:" + id);
      final response = await http.get(BASE_KS_URL +
          "productincat&id=" +
          id +
          "&order=${order}&lang=${lang}&limit=${limit}&start=${start}");
      print(id + ".. product id ");
      if (response.statusCode == 200) {
        return ProductsInCategory.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic bannerImages() async {
    try {
      print("Product in cat");
      final response = await http.get(BASE_KS_URL + "bannerimages");
      print("Banner Images");
      if (response.statusCode == 200) {
        List<String> photos =
            json.decode(response.body).map<String>((m) => m as String).toList();
        return photos;
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic delivery(String lang) async {
    try {
      print("delivery");
      final response = await http
          .get(BASE_KS_URL + "information&inf=delivery" + "&lang=${lang}");
      if (response.statusCode == 200) {
        var a = json.decode(response.body) as List;
        return a;
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic aboutus(String lang) async {
    try {
      print("About Us");
      final response = await http
          .get(BASE_KS_URL + "information&inf=aboutus" + "&lang=${lang}");
      if (response.statusCode == 200) {
        var a = json.decode(response.body) as List;
        return a;
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic contacts(String lang) async {
    try {
      print("Contacts");
      final response = await http
          .get(BASE_KS_URL + "information&inf=contacts" + "&lang=${lang}");
      if (response.statusCode == 200) {
        var a = json.decode(response.body);
        return a;
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic showAllCollection() async {
    try {
      print("Show all Collection");
      final response = await http.get(BASE_KS_URL + "collection&showall=1");
      if (response.statusCode == 200) {
        return HomeList.fromJson(json.decode(response.body));
      } else {
        return null;
      }
    } catch (exception) {}
  }

  dynamic complaints(String lang) async {
    try {
      print("Complaints");
      final response = await http
          .get(BASE_KS_URL + "information&inf=compliants" + "&lang=${lang}");
      if (response.statusCode == 200) {
        var a = json.decode(response.body);
        return a;
      } else {
        return null;
      }
    } catch (exception) {}
  }
}
