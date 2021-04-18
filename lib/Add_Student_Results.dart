import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'Global_Variables.dart' as globals;

class Add_Student_Results extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return Add_Student_Results_State();
  }
}

class Add_Student_Results_State extends State<Add_Student_Results> {

  final CollectionReference firestore_courses_collection = FirebaseFirestore.instance.collection('tblcourses');
  TextEditingController Student_ID= TextEditingController();
  TextEditingController Module_ID= TextEditingController();
  TextEditingController Module_Result = TextEditingController();



  bool course_exist = false;
  final _Form_Validation_Key = GlobalKey<FormState>();


  /*Future <void> Add_New_Course(String course_id, String no_of_semester, String no_of_credits) async{

    await firestore_courses_collection.where('course_id', isEqualTo: course_id).get().then((filtered_courses){
      course_exist = false;
      filtered_courses.docs.forEach((filtered_courses_i) {
        print("Inside filtered_courses_i");
        course_exist = true;
        return;
      });
    });

    if (course_exist == false){
      Course_ID.text = "";
      Number_of_semesters.text = "";
      total_no_of_credits.text = "";
      return await firestore_courses_collection.doc().set({
        'course_id' : course_id,
        'no_of_semesters' : no_of_semester,
        'total_credits' : no_of_credits,
      });
    }

  }*/

  @override
  Widget build(BuildContext context){
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.yellowAccent[400],
          title: Text(
            'Add Results Recod',
            style: TextStyle(color: Colors.blueAccent),
          ),
        ),

        body: SingleChildScrollView(
            child: Form(
              key: _Form_Validation_Key,
              child: Container(
                margin:EdgeInsets.all(50),
                child: Column(
                  children: [

                    SizedBox(height: 10),

                    TextFormField(

                      validator: (validator_input) {
                        if(validator_input == null || validator_input.isEmpty){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                      controller: Student_ID,
                      decoration: InputDecoration(
                          labelText: "Student ID",
                          fillColor: Colors.amber[400], filled: true
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      validator: (validator_input) {
                        if(validator_input == null || validator_input.isEmpty){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                      controller: Module_ID,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                          labelText: "Module ID",
                          fillColor: Colors.amber[400], filled: true
                      ),
                    ),

                    SizedBox(height: 10),

                    TextFormField(
                      validator: (validator_input) {
                        if(validator_input == null || validator_input.isEmpty){
                          return 'This field is mandatory';
                        }
                        return null;
                      },
                      controller: Module_Result,
                      decoration: InputDecoration(
                          labelText: "Module Result",
                          fillColor: Colors.amber[400], filled: true
                      ),
                    ),

                    SizedBox(height: 10),

                    ButtonTheme(
                      height: 40.0,
                      minWidth: 2000.00,
                      child: RaisedButton(
                        color: Colors.yellowAccent[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                        ),
                        onPressed: () {
                          
                        },
                        child: Text("Create Result Record"),

                      ),

                    )

                  ],
                ),
              ),

            )
        )
    );
  }

}