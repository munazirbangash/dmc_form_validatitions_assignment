
      decideGrade(percentage){
  if (percentage >= 85){
   return "A+ ";
  }
  else if(percentage >= 80){
   return "A ";
  }
  else if(percentage >= 70){
   return "B ";
  }
  else if(percentage >= 60){
   return "C ";
  }
  else if(percentage >= 50){
   return "D ";
  }
  else {
   return  "Fail";
  }
}