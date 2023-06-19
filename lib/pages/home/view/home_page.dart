import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/home/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../style/color.dart';
import '../../../style/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: appBarTextStyle,
        ),
        backgroundColor: mainColor,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
          Get.toNamed('/add-data');
        },
        label: Text(
          'ADD',
          style: appBarTextStyle,
        ),
        icon: const Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
        backgroundColor: mainColor,
      ),
      body: Center(
          child: Obx(() => homeController.isLoading.value
              ? LoadingAnimationWidget.discreteCircle(
                  color: mainColor,
                  size: width / 12,
                )
              : ListView.builder(
                  itemCount: homeController.listData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
                      margin: const EdgeInsets.only(bottom: 10, top: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                    homeController.listData[index].avatar),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${homeController.listData[index].firstName} ${homeController.listData[index].lastName}",
                                    style: nameListStyle,
                                  ),
                                  Text(
                                    homeController.listData[index].email,
                                    style: subNameListStyle,
                                  ),
                                  Text(
                                    homeController.listData[index].gender,
                                    style: subNameListStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              // const Icon(
                              //   Icons.edit_outlined,
                              //   color: Colors.amber,
                              // ),
                              // const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  homeController.listData.removeAt(index);
                                },
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ))),
    );
  }
}
