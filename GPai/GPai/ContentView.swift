import SwiftUI

struct ContentView: View {
    @State private var freshmanCourses: String = ""
    @State private var freshmanWeightedCourses: String = ""
    @State private var freshmanGrades: Grades = Grades()
    
    @State private var summerFreshmanCourses: String = ""
    @State private var summerFreshmanWeightedCourses: String = ""
    @State private var summerFreshmanGrades: Grades = Grades()
    
    @State private var sophomoreCourses: String = ""
    @State private var sophomoreWeightedCourses: String = ""
    @State private var sophomoreGrades: Grades = Grades()
    
    @State private var summerSophomoreCourses: String = ""
    @State private var summerSophomoreWeightedCourses: String = ""
    @State private var summerSophomoreGrades: Grades = Grades()
    
    @State private var juniorCourses: String = ""
    @State private var juniorWeightedCourses: String = ""
    @State private var juniorGrades: Grades = Grades()
    
    @State private var summerJuniorCourses: String = ""
    @State private var summerJuniorWeightedCourses: String = ""
    @State private var summerJuniorGrades: Grades = Grades()
    
    @State private var seniorCourses: String = ""
    @State private var seniorWeightedCourses: String = ""
    @State private var seniorGrades: Grades = Grades()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Freshman Year")) {
                    TextField("Number of Courses Taken", text: $freshmanCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $freshmanWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $freshmanGrades)
                }
                
                Section(header: Text("Summer after Freshman Year")) {
                    TextField("Number of Courses Taken", text: $summerFreshmanCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $summerFreshmanWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $summerFreshmanGrades)
                }
                
                Section(header: Text("Sophomore Year")) {
                    TextField("Number of Courses Taken", text: $sophomoreCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $sophomoreWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $sophomoreGrades)
                }
                
                Section(header: Text("Summer after Sophomore Year")) {
                    TextField("Number of Courses Taken", text: $summerSophomoreCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $summerSophomoreWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $summerSophomoreGrades)
                }
                
                Section(header: Text("Junior Year")) {
                    TextField("Number of Courses Taken", text: $juniorCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $juniorWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $juniorGrades)
                }
                
                Section(header: Text("Summer after Junior Year")) {
                    TextField("Number of Courses Taken", text: $summerJuniorCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $summerJuniorWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $summerJuniorGrades)
                }
                
                Section(header: Text("Senior Year")) {
                    TextField("Number of Courses Taken", text: $seniorCourses)
                        .keyboardType(.numberPad)
                    TextField("Total Weighted Courses", text: $seniorWeightedCourses)
                        .keyboardType(.numberPad)
                    GradesInputView(grades: $seniorGrades)
                }
                
                Button(action: calculateGPA) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .navigationTitle("Course and Grades Input")
        }
    }
    
    func calculateGPA() {
        // Create an instance of gpacalc and call the appropriate method
        let gpaCalculator = GPACalculator()
        gpaCalculator.calculate(
            freshmanCourses: freshmanCourses,
            freshmanWeightedCourses: freshmanWeightedCourses,
            freshmanGrades: freshmanGrades,
            summerFreshmanCourses: summerFreshmanCourses,
            summerFreshmanWeightedCourses: summerFreshmanWeightedCourses,
            summerFreshmanGrades: summerFreshmanGrades,
            sophomoreCourses: sophomoreCourses,
            sophomoreWeightedCourses: sophomoreWeightedCourses,
            sophomoreGrades: sophomoreGrades,
            summerSophomoreCourses: summerSophomoreCourses,
            summerSophomoreWeightedCourses: summerSophomoreWeightedCourses,
            summerSophomoreGrades: summerSophomoreGrades,
            juniorCourses: juniorCourses,
            juniorWeightedCourses: juniorWeightedCourses,
            juniorGrades: juniorGrades,
            summerJuniorCourses: summerJuniorCourses,
            summerJuniorWeightedCourses: summerJuniorWeightedCourses,
            summerJuniorGrades: summerJuniorGrades,
            seniorCourses: seniorCourses,
            seniorWeightedCourses: seniorWeightedCourses,
            seniorGrades: seniorGrades
        )
    }
}

struct GradesInputView: View {
    @Binding var grades: Grades
    
    var body: some View {
        VStack {
            HStack {
                TextField("A's", text: $grades.As)
                    .keyboardType(.numberPad)
                TextField("B's", text: $grades.Bs)
                    .keyboardType(.numberPad)
                TextField("C's", text: $grades.Cs)
                    .keyboardType(.numberPad)
                TextField("D's", text: $grades.Ds)
                    .keyboardType(.numberPad)
                TextField("F's", text: $grades.Fs)
                    .keyboardType(.numberPad)
            }
        }
    }
}

struct Grades {
    var As: String = ""
    var Bs: String = ""
    var Cs: String = ""
    var Ds: String = ""
    var Fs: String = ""
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Assuming gpacalc.swift contains the following code
class GPACalculator {
    func calculate(
        freshmanCourses: String, freshmanWeightedCourses: String, freshmanGrades: Grades,
        summerFreshmanCourses: String, summerFreshmanWeightedCourses: String, summerFreshmanGrades: Grades,
        sophomoreCourses: String, sophomoreWeightedCourses: String, sophomoreGrades: Grades,
        summerSophomoreCourses: String, summerSophomoreWeightedCourses: String, summerSophomoreGrades: Grades,
        juniorCourses: String, juniorWeightedCourses: String, juniorGrades: Grades,
        summerJuniorCourses: String, summerJuniorWeightedCourses: String, summerJuniorGrades: Grades,
        seniorCourses: String, seniorWeightedCourses: String, seniorGrades: Grades
    ) {
        // Your GPA calculation logic goes here
        
    }
}

