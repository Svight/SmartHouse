import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'room_details.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import '/screens/account_screen.dart';
// import '/screens/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;

  final List roomData = [
    {"roomName": "Гостиная", "devices": "3 Devices", "isActive": true},
    {"roomName": "Спальня", "devices": "5 Devices", "isActive": false},
    {"roomName": "Ванная", "devices": "3 Devices", "isActive": false},
    {"roomName": "Кухня", "devices": "4 Devices", "isActive": false},
    {"roomName": "Детская", "devices": "4 Devices", "isActive": false},
    {"roomName": "Коридор", "devices": "2 Devices", "isActive": false},
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF282828),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Главная',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CircleAvatar(
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
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Добро пожаловать!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.84,
                    ),
                    itemCount: roomData.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoomDetails(
                                roomName: roomData[index]['roomName'],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFF131313),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                roomData[index]['roomName'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                roomData[index]['devices'],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white70,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Switch(
                                value: roomData[index]['isActive'],
                                onChanged: (value) {
                                  setState(() {
                                    roomData[index]['isActive'] = value;
                                    print(roomData[index]['roomName'] +
                                        ' isActive: ' +
                                        roomData[index]['isActive'].toString());
                                  });
                                },
                                activeTrackColor: const Color(0xFF7A40F2),
                                activeColor: Colors.white,
                              ),
                              Column(
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                                opaque: false,
                                                pageBuilder: (BuildContext
                                                            context,
                                                        _,
                                                        __) =>
                                                    RoomDetails(
                                                        roomName:
                                                            roomData[index]
                                                                ['roomName'])));
                                      },
                                      child: const Text('Посмотреть')),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
