import 'package:client/src/pages/fridge_page.dart';
import 'package:client/src/widgets/register/modal/register_bottom_up_modal.dart';
import 'package:client/src/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class Page {
  const Page(this.iconData, this.text);
  final IconData iconData;
  final String text;
}

class _MainPageState extends State<MainPage> {
  int idx = 0;

  final pageList = const <Page>[
    Page(Icons.home_filled, "fridgy"),
    Page(Icons.add_box_outlined, "modal"),
    Page(Icons.person, "setting"),
  ];

  final _buildBody = <Widget>[
    FridgePage(),
    RegisterModal(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: idx,
        onTap: (x) {
          var y = idx;
          setState(() {
            idx = x;
          });
          if (x == 1) {
            showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return const RegisterModal();
                });
            idx = y;
          }
        },
        elevation: 20.0,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        unselectedItemColor: Colors.black,
        selectedItemColor: const Color(0xff395BA9),
        items: pageList
            .map((Page page) => BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(page.iconData),
                label: page.text))
            .toList(),
      ),
      body: _buildBody[idx],
    );
  }
}
