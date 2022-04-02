import 'package:cospick/models/item.dart';

class Cos{
  String title = "", content = "";
  List<Item> items = [];
  int cost = 0;

  Cos(this.title, this.content, this.items){
    for(int i=0;i<items.length;i++){
      cost += items[i].cost;
    }
  }

}