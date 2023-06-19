import 'package:flutter/material.dart';
import 'package:flutter_contact_list/pages/form_add/controller/form_add_controller.dart';
import 'package:flutter_contact_list/style/color.dart';
import 'package:flutter_contact_list/style/text.dart';
import 'package:get/get.dart';

class FormAdd extends StatefulWidget {
  const FormAdd({super.key});

  @override
  State<FormAdd> createState() => _FormAddState();
}

class _FormAddState extends State<FormAdd> {
  String? email;
  String? firstName;
  String? lastName;

  FormAddController formAddController = FormAddController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Add',
          style: appBarTextStyle,
        ),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  TextFormField(
                    style: loginFormStyle,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type an First Name';
                      }
                      email = input;
                      return null;
                    },
                    onSaved: (input) => firstName = input,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'First Name',
                        hintStyle: loginHintStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: loginFormStyle,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type an lastName';
                      }
                      email = input;
                      return null;
                    },
                    onSaved: (input) => lastName = input,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Last Name',
                        hintStyle: loginHintStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: loginFormStyle,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type an email';
                      }
                      email = input;
                      return null;
                    },
                    onSaved: (input) => email = input,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Email Address',
                        hintStyle: loginHintStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: width,
                    padding: EdgeInsets.fromLTRB(12, 8, 12, 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade200,
                    ),
                    child: DropdownButton(
                      value: formAddController.genderInit,
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: SizedBox(),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          formAddController.genderInit = value!;
                        });
                      },
                      items: formAddController.genderList
                          .map<DropdownMenuItem<String>>((dynamic value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(
                            value,
                            style: loginFormStyle,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                      height: height / 15,
                      child: Obx(
                        () => ListView.builder(
                            itemCount: formAddController.avatarList.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    formAddController.avatarInit.value = index;
                                  });
                                },
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color:
                                          formAddController.avatarInit.value ==
                                                  index
                                              ? Colors.blueAccent
                                              : Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      )),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        formAddController.avatarList[index]),
                                  ),
                                ),
                              );
                            }),
                      )),
                  SizedBox(
                    height: height / 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: mainColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            formAddController.Firsname.value = firstName!;
                            formAddController.Lastname.value = lastName!;
                            formAddController.Email.value = email!;
                            formAddController.addUser();
                          }
                        },
                        highlightColor: Colors.red.withOpacity(0.4),
                        splashColor: Colors.purple.withOpacity(0.5),
                        child: Center(
                            child: Text(
                          "Add Data",
                          style: loginButtonStyle,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
