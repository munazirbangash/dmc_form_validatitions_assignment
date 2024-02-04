
import 'package:dmc_form_validatitions_assignment/screens/decide_grade.dart';
import 'package:flutter/material.dart';

class DmcForm extends StatefulWidget {
  const DmcForm({super.key});

  @override
  State<DmcForm> createState() => _DmcFormState();
}

class _DmcFormState extends State<DmcForm> {
   GlobalKey<FormState> formkey = GlobalKey<FormState>();
  late int eng, urdu,math,sci,isl,ps;

  String obtMarks = "Obtained marks";
  String percentage = "Percentage";
  String grade = "Grade";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DMC Form"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        color: Colors.cyanAccent.shade200,
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'English Marks',
                    ),
                     validator: (text){
                      if(text  == null || text.isEmpty){
                        return 'Please provide english  marks';

                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }
                      eng = int.parse(text!);

                      return null;

                     },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Urdu Marks',
                    ),
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return 'Please provide urdu  marks';
                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }

                      urdu = int.parse(text!);
                      return null;
                    }

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Math Marks',
                    ),
                    validator: (text){
                      if (text == null || text.isEmpty){
                        return "please  provide math marks";
                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }
                      math = int.parse(text!);
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Science Marks',
                    ),
                    validator: (text){
                      if(text == null ||text.isEmpty){
                        return "please provide science marks";
                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }
                      sci = int.parse(text!);
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Islamiat Marks',
                    ),
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return "please provide islamiat marks";
                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }
                      isl = int.parse(text!);
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Pak Study Marks',
                    ),
                    validator: (text){
                      if(text == null || text.isEmpty){
                        return "please provide pakstudy marks";
                      }
                      if (text.length > 3 ){
                        return "Please provide three digits  number";
                      } else if(int.parse(text) > 100){
                        return "Please provide   low number  from 100";
                      }
                       ps = int.parse(text!);

                      return null;

                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          formkey.currentState!.reset();
                          obtMarks = "Obtained Marks";
                          percentage = "Percentage";
                          grade = "";
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text("Clear "),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if(formkey.currentState!.validate()){


                            int obtainedMarks = eng + urdu + math + sci + isl + ps;
                            int percentage = obtainedMarks * 100 ~/ 600;

                            setState(() {
                              obtMarks = "Obtained Marks $obtainedMarks";

                              this.percentage = "Percentage $percentage";

                              grade = decideGrade( percentage);

                            });

                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        child: const Text("Calculate "),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(obtMarks,style: const TextStyle(fontSize: 20),),
                  Text(percentage,style: const TextStyle(fontSize: 20),),
                  Text(grade,style: const TextStyle(fontSize: 20),),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
