import 'package:delivery_boy_app/views/new_order_screen.dart';
import 'package:delivery_boy_app/views/past_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  List tabData = ['NEW ORDER', 'PAST ORDER'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          ' My Orders',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 55.w),
            child: Row(
              children: [
                Expanded(
                  child: TabBar(
                    controller: tabController,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 40.w),
                    indicatorColor: Colors.indigo,
                    indicatorWeight: 3.h,
                    tabs: List.generate(
                        tabData.length,
                        (index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.h),
                              child: Text(
                                '${tabData[index]}',
                                style: TextStyle(color: Colors.grey),
                              ),
                            )),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
                physics: BouncingScrollPhysics(),
                controller: tabController,
                children: [
                  NewOrderScreen(),
                  PastOrderScreen(),
                ]),
          ),
        ],
      ),
    );
  }
}
