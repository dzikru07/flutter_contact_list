import 'package:flutter/material.dart';

import '../../../style/color.dart';
import '../../../style/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: ListView.builder(
        itemCount: 10,
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
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://assets.bizjournals.com/static/img/potm/marketing/team-success-img.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: nameListStyle,
                        ),
                        Text(
                          'Email',
                          style: subNameListStyle,
                        ),
                        Text(
                          'Phone',
                          style: subNameListStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const Row(
                  children: [
                    Icon(
                      Icons.edit_outlined,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
