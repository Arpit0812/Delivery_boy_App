import 'package:delivery_boy_app/services/api_service_get/my_order.dart';
import 'package:delivery_boy_app/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../model/res_model/my_order_model.dart';

class NewOrderScreen extends StatefulWidget {
  const NewOrderScreen({Key? key}) : super(key: key);

  @override
  State<NewOrderScreen> createState() => _NewOrderScreenState();
}

class _NewOrderScreenState extends State<NewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: FutureBuilder(
        future: ApiServicesGet.MyOrders(),
        builder: (BuildContext context, AsyncSnapshot<MyOrder?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data?.data?.orders?.length,
              itemBuilder: (BuildContext context, int index) {
                if (snapshot.data?.data?.orders?[index].orderStatus !=
                    'Delivered') {
                  return Container(
                    margin: EdgeInsets.only(top: 15.h),
                    height: 160.h,
                    width: Get.width,
                    decoration: BoxDecoration(color: Colors.white),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.h, horizontal: 15.w),
                              child: Container(
                                height: 75.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        '${snapshot.data?.data?.orders?[index].pickupImage}'),
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data?.data?.orders?[index].orderInfo?[0].productName}',
                                      style: TextStyle(
                                        fontSize: 18.h,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 75.w),
                                    Text(
                                      '${snapshot.data?.data?.orders?[index].orderInfo?[0].price}',
                                      style: TextStyle(
                                        fontSize: 18.h,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 25.h),
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data?.data?.orders?[index].orderData}',
                                      style: TextStyle(
                                        fontSize: 15.h,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 40.w),
                                    Text(
                                      '${snapshot.data?.data?.orders?[index].modeOfPayment}',
                                      overflow: TextOverflow.visible,
                                      style: TextStyle(
                                        fontSize: 15.h,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            Spacer(),
                            Text(
                              'Order Num:${snapshot.data?.data?.orders?[index].orderId}',
                              style: TextStyle(
                                fontSize: 15.h,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Text(
                              'items:${snapshot.data?.data?.orders?[index].orderInfo?[0].qty}',
                              overflow: TextOverflow.visible,
                              style: TextStyle(
                                fontSize: 15.h,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Text(
                                '${snapshot.data?.data?.orders?[index].orderStatus}',
                                overflow: TextOverflow.visible,
                                style: TextStyle(
                                  fontSize: 15.h,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: Colors.indigo),
            );
          }
        },
      ),
    );
  }
}
