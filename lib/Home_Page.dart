import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child:Text('Статус замовлення:',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 20, 0, 0),
                  child:Text('Номер столика:',
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ),
                ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:[
                      Padding(padding:EdgeInsets.fromLTRB(25,10,0,0),child:Text('1.Відправлено')),
                      Padding(padding:EdgeInsets.fromLTRB(25,5,0,0),child:Text('2.Готується')),
                      Padding(padding:EdgeInsets.fromLTRB(25,5,0,0),child:Text('3.На видачі')),
                      Padding(padding:EdgeInsets.fromLTRB(25,5,0,0),child:Text('4.Видано')),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                padding:EdgeInsets.fromLTRB(20, 30, 0, 0),
                child: Text('Страва дня!',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child:Card(
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://placeimg.com/640/200/nature',
                          fit: BoxFit.fill,
                        ),
                        ListTile(
                          title: Text('Смачна страва'),
                          subtitle: Text('Опис смачної страви'),
                          trailing: Text('100₴'),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                icon:Icon(Icons.shopping_cart),
                                onPressed:(){},
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child: Text('Акції',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(20, 10, 0, 0),
                  child:Row(
                    children: [
                      Container(
                        width: 177,
                        child:Card(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://placeimg.com/177/50/nature',
                                fit: BoxFit.fill,
                              ),
                              ListTile(
                                title: Text('Смачна страва',
                                    style: TextStyle(fontSize: 12)),
                                subtitle: Text('Опис смачної страви',
                                    style: TextStyle(fontSize: 10)),
                                trailing: Text('100₴'),
                              ),
                                  ],
                                ),
                              ),
                            ),
                      Container(
                        width: 177,
                        child:Card(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                'https://placeimg.com/177/50/nature',
                                fit: BoxFit.fill,
                              ),
                              ListTile(
                                title: Text('Смачна страва',
                                    style: TextStyle(fontSize: 12)),
                                subtitle: Text('Опис смачної страви',
                                    style: TextStyle(fontSize: 10)),
                                trailing: Text('100₴'),
                              ),
                            ],
                          ),
                        ),
                      ),
                     ]
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
