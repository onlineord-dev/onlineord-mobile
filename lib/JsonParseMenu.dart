//

import 'package:flutter/material.dart';
import 'MenuServices.dart';
import 'MenuJsonFull.dart';

class JsonParseMenu extends StatefulWidget {
  JsonParseMenu() : super();

  @override
  _JsonParseMenuState createState() => _JsonParseMenuState();
}

class  _JsonParseMenuState extends State<JsonParseMenu> {
  //
  List<DishOfTheDay> _discounts;
  List<Menu> _menu;
  bool _loading;



  @override
  void initState(){
    super.initState();
    _loading = true;
    Services.getDiscount().then((discount){

        setState(() {
          _menu = discount.menu;

          _discounts = discount.discounts;
          _loading = false;
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'Menu'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: null == _menu ? 0 : 6,
            itemBuilder: (context, index){
              Menu menu = _menu[1];

              DishOfTheDay discounts = menu.items[index];
              return ListTile(
                title: Text(discounts.name),
                subtitle: Text(discounts.price.toString()),
            );
        }),
      ),
    );
  }
}