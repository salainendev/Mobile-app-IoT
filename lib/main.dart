import 'package:flutter/material.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('умная вытяжка',style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 48, 48, 47),
      ),
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _tabController.index,
        onTap: (int index){
          setState(() {

            _tabController.index=index;

          });
        
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: 'мои устройства',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'управление устройствами',
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            child: const Center(
              child:Text('тут должны быть доступные устройства'),
            ),
          ),
          Container(
            child :const Center(
              child: Text('тут должна быть панель управления устройством'

            )
            ),
          )
        ],
      )
    );
  }
}