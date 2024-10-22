import 'dart:io';



void main(){
  performTasks();
}

void performTasks() async {
  task1();
  String debugString = await task2();
  task3(debugString);
}


void task1(){
  String result = "task 1 data";
  print("task 1 complete");
}
Future task2() async{
  String result = "";
  await Future.delayed(Duration(seconds: 3), (){
    result = "task 2 data";
  });
  return result;
}
void task3(String debugString){
  print('Task 3 complete');
  print("Debug string : $debugString");
  // Future.delayed(Duration(seconds: 3), (){
  //
  // });
}