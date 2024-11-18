import 'package:flutter/material.dart';

class Radio_button extends StatefulWidget {
  const Radio_button({super.key});

  @override
  State<Radio_button> createState() => _Radio_buttonState();
}

class _Radio_buttonState extends State<Radio_button> {

 var organ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title:const Text('Teeth',),
          value: 1, groupValue: organ, onChanged: (eslam){
          setState(() {
            organ=eslam;
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>const TeethView(),));
          });

        }),

        RadioListTile(
            title:const Text('Skin'),
          value: 2, groupValue: organ, onChanged: (eslam){
          setState(() {
            organ=eslam;
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>const SkinView(),));
          });

        }),

        RadioListTile(
            title:const Text('Foot'),
          value: 3, groupValue: organ, onChanged: (eslam){
          setState(() {
            organ=eslam;
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>const FootView(),));
          });

        }),

        RadioListTile(
            title:const Text('Eyes'),
          value: 6, groupValue: organ, onChanged: (eslam){
          setState(() {
            organ=eslam;
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>const EyesView(),));
          });

        }),
        RadioListTile(
            title:const Text('Heart'),
          value: 11, groupValue: organ, onChanged: (eslam){
          setState(() {
            organ=eslam;
            // Navigator.push(context,MaterialPageRoute(builder:(context)=>const HeartView(),));
            
          });

        }),
        
      ],
    );
  }
}