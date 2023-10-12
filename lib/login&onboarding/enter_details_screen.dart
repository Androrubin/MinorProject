import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messmaven_minor_project/nav_screens/base_screen.dart';

class StudentInfoForm extends StatefulWidget {
  @override
  _StudentInfoFormState createState() => _StudentInfoFormState();
}
Color cardColor = const Color(0xFF1F283E);
class _StudentInfoFormState extends State<StudentInfoForm> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController hostelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: cardColor,
        title: Text('Student Information'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 30,),
                  Container(
                    height: 120,
                    margin: EdgeInsets.only(left: 100, right: 100),
                      child:
                          Stack(
                            children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(50),
                                child: Image.asset('lib/assets/person.jpg',fit: BoxFit.cover,height: 110,width: 120,)),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Container(
                                  margin: EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: cardColor,
                                  ),
                                 child: GestureDetector(
                                   onTap: (){

                                   },
                                   child: Padding(
                                     padding: const EdgeInsets.all(8.0),
                                     child: Icon(Icons.edit_rounded,color: Colors.white,),
                                   ),
                                 ),
                                ),
                              )
                            ],
                          )
                  ),

                  SizedBox(height: 70,),
                  Text(
                    'Enter Student Information',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: rollNumberController,
                    decoration: InputDecoration(
                      labelText: 'Roll Number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    controller: hostelController,
                    decoration: InputDecoration(
                      labelText: 'Hostel & Room No',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: ()async {
                      final name = nameController.text;
                      final rollNumber = rollNumberController.text;
                      final hostel = hostelController.text;
                      if(name.isNotEmpty && rollNumber.isNotEmpty && hostel.isNotEmpty) {
                        final user = FirebaseAuth.instance.currentUser;
                        print(user?.email.toString());
                        await FirebaseFirestore.instance.collection('Users').doc(user?.uid).set({
                          "name" : name,
                          "roll no" : rollNumber,
                          "hostel" : hostel,
                        }
                        );

                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> BaseScreen()));
                      //   print(
                      //       'Name: $name, Roll Number: $rollNumber, Hostel: $hostel');
                       }
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        color: cardColor,
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              'Submit',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    rollNumberController.dispose();
    hostelController.dispose();
    super.dispose();
  }
}
