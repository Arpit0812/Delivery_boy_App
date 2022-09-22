import 'package:delivery_boy_app/services/api_service_get/catagories.dart';
import 'package:delivery_boy_app/services/api_service_get/insight.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.'
    'dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/res_model/insight_model.dart';

class InsightScreen extends StatefulWidget {
  InsightScreen({Key? key}) : super(key: key);

  @override
  State<InsightScreen> createState() => _InsightScreenState();
}

class _InsightScreenState extends State<InsightScreen> {
  String dropdownvalue = 'Today';

  bool isSwitch = false;
  // List of items in our dropdown menu
  var items = [
    'Today',
    'Tomorrow',
    'Yesterday',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Insight',
          style: TextStyle(
              color: Colors.black, fontSize: 22.h, fontWeight: FontWeight.bold),
        ),
        // title: Switch(
        //   onChanged: (bool value) {
        //     setState(() {
        //       isSwitch = value;
        //     });
        //     if (isSwitch == true) {
        //       Get.changeTheme(ThemeData.dark());
        //     } else {
        //       Get.changeTheme(ThemeData.light());
        //     }
        //   },
        //   value: isSwitch,
        // ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: DropdownButton(
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            FutureBuilder(
              builder:
                  (BuildContext context, AsyncSnapshot<Insight?> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Divider(
                        thickness: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data?.data?.insight?.totalOrder}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Orders',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${snapshot.data?.data?.insight?.totalItem}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Items Sold',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$ ${snapshot.data?.data?.insight?.totalEarning}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17.h,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                'Earnings',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 17.h,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      Divider(
                        thickness: 2,
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Align(
                          child: Text(
                            'Earnings',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.h),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        height: 300,
                        child: BarChart(
                          BarChartData(
                            borderData: FlBorderData(
                                show: true,
                                border: const Border(
                                  top: BorderSide.none,
                                  right: BorderSide.none,
                                  left: BorderSide(width: 1),
                                  bottom: BorderSide(width: 1),
                                )),
                            groupsSpace: 50,
                            maxY: 12000,
                            backgroundColor: Colors.transparent,
                            barGroups: [
                              ...List.generate(
                                snapshot.data!.data!.chartEarnings!.length,
                                (index) => BarChartGroupData(
                                  x: int.parse((snapshot.data!.data!
                                          .chartEarnings![index].time!)
                                      .split(':')[0]),
                                  barRods: [
                                    BarChartRodData(
                                        toY: double.parse(
                                            '${snapshot.data!.data!.chartEarnings![index].earnings!}'),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.green,
                                            Colors.green,
                                            Colors.green,
                                            Colors.amberAccent,
                                            Colors.amberAccent,
                                            Colors.white54
                                          ],
                                        ),
                                        width: 20,
                                        borderRadius: BorderRadius.circular(0)
                                        // color: Colors.green,
                                        ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'VIEW ALL TRANSACTAION',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data?.data?.productList?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Container(
                              height: 50.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          '${snapshot.data?.data?.productList?[index].product?.image}'))),
                            ),
                            title: Text(
                              '${snapshot.data?.data?.productList![index].product!.name}',
                              style: TextStyle(fontSize: 17.h),
                            ),
                            subtitle: Text(
                              '${snapshot.data?.data?.productList![index].product!.unitId}',
                              style: TextStyle(fontSize: 17.h),
                            ),
                          );
                        },
                      )
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
              future: InsightServices.insightServices(),
            ),
          ],
        ),
      ),
    );
  }
}
