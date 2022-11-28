import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ftoast/ftoast.dart';
import 'package:medical_app/shared/colors.dart';
import 'package:medical_app/shared/components.dart';
import 'package:medical_app/shared/sqflite_controller.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var subjectController = TextEditingController();
    var messageController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: defaultColor
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: defaultColor
        ),
        title: const Text(
          'Contact Us',
          style: TextStyle(
            color: defaultColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.location_on_outlined,
                      size: 22,
                      color: defaultColor,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Address',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0,),
                const Text(
                  '   123 Porto Blvd, Suite 100, New York, NY',
                  style: TextStyle(
                    fontSize: 16
                  ),
                ),
                myDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.phone_outlined,
                      size: 22,
                      color: defaultColor,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Phone',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0,),
                const Text(
                  '     123 - 456 - 7890 , 123 - 456 - 7891',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
                myDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.mail_outline,
                      size: 22,
                      color: defaultColor,
                    ),
                    SizedBox(width: 10.0,),
                    Text(
                      'Mail',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0,),
                const Text(
                  '       mail@example.com\n      mail2@example.com',
                  style: TextStyle(
                      fontSize: 16
                  ),
                ),
                myDivider(),
                const Text(
                  'Send a Message to Us',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      border: OutlineInputBorder(),
                    labelText:'Your name'
                  ),
                  validator:(value){
                    if(value!.isEmpty)
                      return 'your name mustn\'t be embty';
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: emailController,
                  validator:(value){
                    if(value!.isEmpty)
                      return 'your email mustn\'t be embty';
                  },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(),
                    labelText:'Your E-mail'
                  ),

                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: subjectController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    border: OutlineInputBorder(),
                    labelText:'Subject'

                  ),
                  validator:(value){
                    if(value!.isEmpty)
                      return 'your subject mustn\'t be embty';
                  },
                ),
                const SizedBox(height: 8.0,),
                TextFormField(
                  controller: messageController,
                  maxLines: 8,
                  minLines: 4,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(20.0),
                    border: OutlineInputBorder(),
                    labelText:'Message'
                  ),
                  validator:(value){
                    if(value!.isEmpty)
                      return 'your messsage mustn\'t be embty';
                  },
                ),
                basicButton(onPressed: (){
                  if(formKey.currentState!.validate()) {
                    MyDatabase.instance.insertEmail(
                      nameController.text,
                      emailController.text,
                      subjectController.text,
                      messageController.text);
                    FToast.toast(
                        context,
                        msg: 'we received your email',

                    );
                    nameController.clear();
                    emailController.clear();
                    subjectController.clear();
                    messageController.clear();
                    MyDatabase.instance.selectAll().then((value) => print(value.toString()));
                  }

                }, title: 'send')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
