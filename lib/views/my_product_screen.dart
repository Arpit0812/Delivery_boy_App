import 'package:delivery_boy_app/views/catagories/dairy_screen.dart';
import 'package:delivery_boy_app/views/catagories/fruit_screen.dart';
import 'package:delivery_boy_app/views/catagories/herbs_screen.dart';
import 'package:delivery_boy_app/views/catagories/vegetable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProductScreen extends StatefulWidget {
  const MyProductScreen({Key? key}) : super(key: key);

  @override
  State<MyProductScreen> createState() => _MyProductScreenState();
}

class _MyProductScreenState extends State<MyProductScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: tabData.length, vsync: this);
    super.initState();
  }

  List tabData = ['VEGETABLES', 'FRUITS', 'HERBS', 'DAIRY'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.indigo,
          indicatorWeight: 3.h,
          tabs: List.generate(
              tabData.length,
              (index) => Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Flexible(
                      child: Text(
                        '${tabData[index]}',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
        ),
        title: Text(
          ' My Products',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                VegetableScreen(),
                FruitScreen(),
                HerbsScreen(),
                DairyScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
