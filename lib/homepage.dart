import 'package:flutter/material.dart';
import 'package:untitled/screens/firstscreen.dart';
import 'package:untitled/screens/secondscreen.dart';
import 'package:untitled/screens/thirdscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          actions: [
        const SizedBox(
          width: 10,
        ),
        PopupMenuButton(
            color: Colors.black,
            itemBuilder: (context) => const [
                  PopupMenuItem(
                      value: '1',
                      child: Text(
                        'New group',
                        style: TextStyle(color: Colors.white),
                      )),
                  PopupMenuItem(
                      value: '2',
                      child: Text(
                        'Settings',
                        style: TextStyle(color: Colors.white),
                      )),
                  PopupMenuItem(
                      value: '3',
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white),
                      )),
                ])
      ]),
      body: Column(
        children: [

          Row(
            children: const [
              SizedBox(width: 7.0,),
               Text(
                  'Chats',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Color(0xff2B2B2B),
                      fontWeight: FontWeight.bold),

              ),
              SizedBox(
                width: 290,
              ),
              Icon(
                Icons.edit,
                color:  Color(0xff505357),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
            child: TextFormField(
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                  prefixIcon: const Icon(
                    Icons.search,
                    color:Color(0xff505357),
                  ),
                  hintText: 'Search for chats & messages',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(width: 5.0, color: Colors.orange)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange))),
            ),
          ),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: const [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen(),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                size: 30,
              ),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                size: 30,
              ),
              label: 'Calls'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: 'Prpfile'),
        ],
      ),
    );
  }
}
