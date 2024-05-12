import 'package:flutter/material.dart';
import 'package:resturant_task/view/widgets/customized_textfield.dart';

import '../widgets/customized_button.dart';

class LocationMapScreen extends StatelessWidget {
  LocationMapScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(22),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Padding( padding: const EdgeInsets.all(8.0),
                    child: Text('Location',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),),

                    SizedBox(height: 10),
                    CustomTextField(hintText: 'Your Location',
                    suffixIcon: Icons.location_on,),
                    SizedBox(height: 15),
                    CustomTextField(hintText: 'Location Name',
                   ),
                    SizedBox(height: 17,),
                    CustomButton(
                      text: 'Save',
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Container(
          color: Colors.transparent,
          child: Center(
            child: Text('The Map should be here'),
          ),
        ),
      ),
    );
  }
}