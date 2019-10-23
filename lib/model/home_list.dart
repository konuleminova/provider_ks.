
import 'home_model.dart';

class HomeList {
  List<Home> homelist;

  HomeList({this.homelist});

  factory HomeList.fromJson(List<dynamic> json) {
    List<Home> listCategories = new List<Home>();
    listCategories = json.map((i) => Home.fromJson(i)).toList();
    return HomeList(homelist: listCategories);
  }

  @override
  String toString() {
    return 'HomeList{categories: $homelist}';
  }

}
