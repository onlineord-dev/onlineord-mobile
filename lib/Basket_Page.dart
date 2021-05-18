import 'package:flutter/material.dart';


class Basket extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Card(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Icon(Icons.fastfood),
                        title: Text('Страва №1'),
                        dense: true,
                        trailing: Text('0₴', style: TextStyle(fontSize: 15.0),),
                        subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                          child: FloatingActionButton(
                            onPressed: (){},
                            child: Icon(Icons.add, color: Colors.black, size:15,),
                            backgroundColor: Colors.white,),
                          ),
                            Padding(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Text('0',
                              style: new TextStyle(fontSize: 15.0),
                            ),
                            ),
                          SizedBox(
                            height: 20.0,
                            width: 20.0,
                          child: FloatingActionButton(
                            onPressed: (){},
                            child: Icon(Icons.remove, color:Colors.black, size: 15,),
                            backgroundColor: Colors.white,),
                          ),
                          const SizedBox(width: 8),
                          ],
                      ),
                    ]
                  ),
                ),
                Card(
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.fastfood),
                          title: Text('Страва №2'),
                          dense: true,
                          trailing: Text('0₴', style: TextStyle(fontSize: 15.0),),
                          subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: FloatingActionButton(
                                onPressed: (){},
                                child: Icon(Icons.add, color: Colors.black, size:15,),
                                backgroundColor: Colors.white,),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text('0',
                                style: new TextStyle(fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: FloatingActionButton(
                                onPressed: (){},
                                child: Icon(Icons.remove, color:Colors.black, size: 15,),
                                backgroundColor: Colors.white,),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ]
                  ),
                ),
                Card(
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          leading: Icon(Icons.fastfood),
                          title: Text('Страва №3'),
                          dense: true,
                          trailing: Text('0₴', style: TextStyle(fontSize: 15.0),),
                          subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: FloatingActionButton(
                                onPressed: (){},
                                child: Icon(Icons.add, color: Colors.black, size:15,),
                                backgroundColor: Colors.white,),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text('0',
                                style: new TextStyle(fontSize: 15.0),
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                              width: 20.0,
                              child: FloatingActionButton(
                                onPressed: (){},
                                child: Icon(Icons.remove, color:Colors.black, size: 15,),
                                backgroundColor: Colors.white,),
                            ),
                            const SizedBox(width: 8),
                          ],
                        ),
                      ]
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: OutlinedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                            ),

                            onPressed : () {
                              Navigator.pushNamed(context, '/Menu');
                            },
                            child: Text("Добавити позицію")
                        ),
                      ),
                      Divider(
                          color: Colors.black
                      ),
                      ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ListTile(
                      title: Text('Всього:',
                          style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                      trailing: Text('0₴', style: TextStyle(fontSize: 15.0),),
                      subtitle: TextField(
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Ваш коментар',
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                    ),
                    Container(
                      width:370,
                      padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                          ),
                          onPressed : () {
                          },
                          child: Text("Оплатити")
                      ),
                    ),
                    ],
                ),
              ],
            ),
          ),
    );
  }
}
