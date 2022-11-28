import 'package:flutter/material.dart';

Widget myDivider() => Padding(
  padding: const EdgeInsets.symmetric(vertical: 15.0),
  child:   Container(
    color: Colors.grey,
    height: 2,
    width: double.infinity,
  ),
) ;

String dummyText = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur hendrerit, leo vitae interdum pretium, tortor risus dapibus tortor, eu suscipit orci leo sed nisl. Integer et ipsum eu nulla auctor mattis sit amet in diam. Vestibulum non ornare arcu. Class aptent taciti sociosqu';

Widget basicButton({
  required Function() onPressed,
  required  String title,
  }) => MaterialButton(
    onPressed:onPressed,
    color: Colors.white,

    shape: RoundedRectangleBorder(
      side: const BorderSide(
      color: Colors.black,
      width: 2,
    ),
      borderRadius: BorderRadius.circular(10),),
    child: Text(title.toUpperCase())
);

void navigateTo(context,widget)
=>Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => widget,
    ));

