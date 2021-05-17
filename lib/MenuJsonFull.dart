// To parse this JSON data, do
//
//     final mainMenu = mainMenuFromJson(jsonString);

import 'dart:convert';

MainMenu mainMenuFromJson(String str) => MainMenu.fromJson(json.decode(str));

String mainMenuToJson(MainMenu data) => json.encode(data.toJson());

class MainMenu {
  MainMenu({
    this.discounts,
    this.dishOfTheDay,
    this.dishOfTheWeek,
    this.menu,
  });

  List<DishOfTheDay> discounts;
  DishOfTheDay dishOfTheDay;
  DishOfTheDay dishOfTheWeek;
  List<Menu> menu;

  factory MainMenu.fromJson(Map<String, dynamic> json) => MainMenu(
    discounts:  List<DishOfTheDay>.from(json["discounts"].map((x) => DishOfTheDay.fromJson(x))),
    dishOfTheDay: DishOfTheDay.fromJson(json["dish_of_the_day"]),
    dishOfTheWeek: DishOfTheDay.fromJson(json["dish_of_the_week"]),
    menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "discounts": List<dynamic>.from(discounts.map((x) => x.toJson())),
    "dish_of_the_day": dishOfTheDay.toJson(),
    "dish_of_the_week": dishOfTheWeek.toJson(),
    "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
  };
}

class DishOfTheDay {
  DishOfTheDay({
    this.description,
    this.id,
    this.image,
    this.name,
    this.price,
    this.weight,
  });

  Description description;
  int id;
  String image;
  String name;
  num price;
  num weight;

  factory DishOfTheDay.fromJson(Map<String, dynamic> json) => DishOfTheDay(
    description: descriptionValues.map[json["description"]],
    id: json["id"],
    image: json["image"] == null ? null : json["image"],
    name: json["name"],
    price: json["price"],
    weight: json["weight"] == null ? null : json["weight"],
  );

  Map<String, dynamic> toJson() => {
    "description": descriptionValues.reverse[description],
    "id": id,
    "image": image == null ? null : image,
    "name": name,
    "price": price,
    "weight": weight == null ? null : weight,
  };
}

enum Description { LOREM_IPSUM_DOLOR_SIT_AMET, FOOD }

final descriptionValues = EnumValues({
  "food": Description.FOOD,
  "Lorem ipsum dolor sit amet.": Description.LOREM_IPSUM_DOLOR_SIT_AMET
});

class Menu {
  Menu({
    this.items,
    this.submenuId,
    this.submenuName,
  });

  List<DishOfTheDay> items;
  int submenuId;
  String submenuName;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
    items: List<DishOfTheDay>.from(json["items"].map((x) => DishOfTheDay.fromJson(x))),
    submenuId: json["submenu_id"],
    submenuName: json["submenu_name"],
  );

  Map<String, dynamic> toJson() => {
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "submenu_id": submenuId,
    "submenu_name": submenuName,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
