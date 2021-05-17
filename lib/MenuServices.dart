//


import 'package:http/http.dart' as http;
import 'MenuJsonFull.dart';


class Services {
  //
  static const String url = 'https://onlineord.herokuapp.com/menu';

  static Future<MainMenu> getDiscount() async {
    Map data = {
      'organization_id': '439',
      'table_id': '1'
    };
    try{
      final response = await http.post(url, body: data);
      print('Resp code: ${response.statusCode}');
      print('Resp b: ${response.body}');

      if(response.statusCode == 200){
        // TODO get only discounts form object
        final MainMenu myMenu = mainMenuFromJson(response.body);

        return myMenu;
      }else{
        // ignore: deprecated_member_use
        print('Dis: b');
        return MainMenu();
      }
    }catch(e){
      // ignore: deprecated_member_use
      print('Dis: $e');
      return MainMenu();
    }
  }
}