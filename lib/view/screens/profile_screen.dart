import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../widgets/customized_button.dart';
import '../widgets/customized_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _selectedGender = 'Female';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Your Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children:[
              Center(
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 60,

                    ),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.deepOrange,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Handle edit button tap
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(borderSide: BorderSide()),
                ),
              ),
              const CustomTextField(
                hintText:'Gmail' ,
                suffixIcon: Icons.email,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText:'Name' ,
                suffixIcon: Icons.person_rounded,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText:'Birth Date' ,
                suffixIcon: Icons.calendar_month,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText:'Location' ,
                suffixIcon: Icons.location_on,
              ),
              const SizedBox(height: 20),
              const CustomTextField(
                hintText:'Gender' ,
                suffixIcon: Icons.arrow_drop_down,
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Continue', onPressed: () {  },

              ),
              const SizedBox(height: 10),
            const Align(
              alignment: Alignment.center,
              child: Text('Skip',style: TextStyle(fontSize: 16),),
            )
            ],
          ),
        ),
      ),
    );
  }
}
