import 'dart:async';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class RoomDetails extends StatefulWidget {
  const RoomDetails({super.key, required this.roomName});
  final String roomName;
  //RoomDetails({required this.roomName});

  @override
  _RoomDetailsState createState() => _RoomDetailsState();
}

class _RoomDetailsState extends State<RoomDetails> {
  bool isSwitched = false;
  DatabaseReference tempRef =
      FirebaseDatabase.instance.ref('value/temperature');
  DatabaseReference humiRef = FirebaseDatabase.instance.ref('value/humidity');
  Map<String, dynamic> _temp = <String, dynamic>{};
  Map<String, dynamic> _humi = <String, dynamic>{};
  late StreamSubscription<DatabaseEvent> _tempSubscription;
  late StreamSubscription<DatabaseEvent> _humiSubscription;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    _tempSubscription = tempRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        print(data);
        Map<String, dynamic> temp = Map<String, dynamic>.from(data as Map);
        _temp = temp;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
    _humiSubscription = humiRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        final data = event.snapshot.value;
        Map<String, dynamic> humi = Map<String, dynamic>.from(data as Map);
        print(humi);
        _humi = humi;
      });
    }, onError: (Object o) {
      final error = o as FirebaseException;
      setState(() {
        //_error = error;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tempSubscription.cancel();
    _humiSubscription.cancel();
  }

  final List roomAssets = [
    {
      "icon": "assets/img/lampa.png",
      "title": "Лампа",
      "subTitle": "Включена",
      "isActive": true,
      // "button": ElevatedButton(
      //   onPressed: () {},
      //   child: Text('Посмотреть статистику'),
      // )
    },
    {
      "icon": "assets/img/move.png",
      "title": "Датчик движения",
      "subTitle": "Движение не зафикисровано",
      "isActive": true
    },
    {
      "icon": "assets/img/temandhum.png",
      "title": "Температура и влажность",
      "subTitle": "24°C температура 50% влажность",
      //"value": "_temp.toString()",
      "isActive": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    // temp.onValue.listen((DatabaseEvent event) {
    //   final data = event.snapshot.value;
    //   print(data);
    // });
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              decoration: const BoxDecoration(
                color: Color(0xFF37353A),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                )),
                            Text(
                              widget.roomName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      const CircleAvatar(
                        radius: 19,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFF8833F),
                          radius: 18,
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.person,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF37353A),
                            radius: 20,
                            child: Image.asset('assets/img/temp.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                //'24°C',
                                '${_temp.toString()}',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Температура',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF37353A),
                            radius: 20,
                            child: Image.asset('assets/img/humi.png'),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Column(
                            children: [
                              Text(
                                '50%',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Влажность',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount: roomAssets.length,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.black54,
                                offset: Offset(3, 5),
                                blurRadius: 9,
                                spreadRadius: 1)
                          ]),
                      child: ListTile(
                        leading: Image.asset(roomAssets[index]['icon']),
                        title: Text(roomAssets[index]['title']),
                        subtitle: Text(roomAssets[index]['subTitle']),
                        trailing: Switch(
                          value: roomAssets[index]['isActive'],
                          onChanged: (value) {
                            setState(() {
                              roomAssets[index]['isActive'] = value;
                              print(roomAssets[index]['title'] +
                                  ' isActive: ' +
                                  roomAssets[index]['isActive'].toString());
                            });
                          },
                          activeTrackColor: const Color(0xFF7A40F2),
                          activeColor: Colors.white,
                        ),
                        //selected: ElevatedButton(roomAssets[index]['button']),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
