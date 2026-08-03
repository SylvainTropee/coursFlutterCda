class Subject {

  String name;
  List<double> notes;

  Subject({required this.name, required this.notes});

  double getAverage(){

    //foreach
    // for(double note in notes){}

    double average = notes.reduce((a,b) => a + b) / notes.length;
    print("La moyenne en $name est $average");
    return average;
  }
}

void main(){
  List<Subject> subjects = [
    Subject(name: "Français", notes: [6,2,3,12.5]),
    Subject(name: "Maths", notes: [16,2,13,12.5]),
    Subject(name: "Informatique", notes: [12,18,15])
  ];

  double totalAverage = 0;

  for(Subject s in subjects){
    totalAverage += s.getAverage() / subjects.length;
  }
  print("La moyenne générale est de $totalAverage");

}




