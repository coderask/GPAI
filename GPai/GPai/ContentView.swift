import SwiftUI

struct ContentView: View {
    @State private var freshmanFirstSemGrades: Grades = Grades()
    @State private var freshmanSecondSemGrades: Grades = Grades()
    @State private var freshmanSummerGrades: Grades = Grades()
    
    @State private var sophomoreFirstSemGrades: Grades = Grades()
    @State private var sophomoreSecondSemGrades: Grades = Grades()
    @State private var sophomoreSummerGrades: Grades = Grades()
    
    @State private var juniorFirstSemGrades: Grades = Grades()
    @State private var juniorSecondSemGrades: Grades = Grades()
    @State private var juniorSummerGrades: Grades = Grades()
    
    @State private var seniorFirstSemGrades: Grades = Grades()
    @State private var seniorSecondSemGrades: Grades = Grades()
    
    @State private var freshmanFirstSemAPs: String = ""
    @State private var freshmanSecondSemAPs: String = ""
    @State private var freshmanSummerAPs: String = ""
    
    @State private var sophomoreFirstSemAPs: String = ""
    @State private var sophomoreSecondSemAPs: String = ""
    @State private var sophomoreSummerAPs: String = ""
    
    @State private var juniorFirstSemAPs: String = ""
    @State private var juniorSecondSemAPs: String = ""
    @State private var juniorSummerAPs: String = ""
    
    @State private var seniorFirstSemAPs: String = ""
    @State private var seniorSecondSemAPs: String = ""
    
    @State private var cumulativeUnweightedGPA: Double? = nil
    @State private var cumulativeWeightedGPA: Double? = nil
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Freshman Year - First Semester")) {
                    GradesInputView(grades: $freshmanFirstSemGrades)
                    TextField("Number of AP/Honors Courses", text: $freshmanFirstSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Freshman Year - Second Semester")) {
                    GradesInputView(grades: $freshmanSecondSemGrades)
                    TextField("Number of AP/Honors Courses", text: $freshmanSecondSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Summer after Freshman Year")) {
                    GradesInputView(grades: $freshmanSummerGrades)
                    TextField("Number of AP/Honors Courses", text: $freshmanSummerAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Sophomore Year - First Semester")) {
                    GradesInputView(grades: $sophomoreFirstSemGrades)
                    TextField("Number of AP/Honors Courses", text: $sophomoreFirstSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Sophomore Year - Second Semester")) {
                    GradesInputView(grades: $sophomoreSecondSemGrades)
                    TextField("Number of AP/Honors Courses", text: $sophomoreSecondSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Summer after Sophomore Year")) {
                    GradesInputView(grades: $sophomoreSummerGrades)
                    TextField("Number of AP/Honors Courses", text: $sophomoreSummerAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Junior Year - First Semester")) {
                    GradesInputView(grades: $juniorFirstSemGrades)
                    TextField("Number of AP/Honors Courses", text: $juniorFirstSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Junior Year - Second Semester")) {
                    GradesInputView(grades: $juniorSecondSemGrades)
                    TextField("Number of AP/Honors Courses", text: $juniorSecondSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Summer after Junior Year")) {
                    GradesInputView(grades: $juniorSummerGrades)
                    TextField("Number of AP/Honors Courses", text: $juniorSummerAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Senior Year - First Semester")) {
                    GradesInputView(grades: $seniorFirstSemGrades)
                    TextField("Number of AP/Honors Courses", text: $seniorFirstSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Senior Year - Second Semester")) {
                    GradesInputView(grades: $seniorSecondSemGrades)
                    TextField("Number of AP/Honors Courses", text: $seniorSecondSemAPs)
                        .keyboardType(.numberPad)
                }
                
                Button(action: calculateGPA) {
                    Text("Calculate")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                
                if let cumulativeUnweightedGPA = cumulativeUnweightedGPA, let cumulativeWeightedGPA = cumulativeWeightedGPA {
                    Section(header: Text("Cumulative GPA")) {
                        Text("Unweighted GPA: \(cumulativeUnweightedGPA, specifier: "%.2f")")
                        Text("Weighted GPA: \(cumulativeWeightedGPA, specifier: "%.2f")")
                    }
                }
            }
            .navigationTitle("Course and Grades Input")
        }
    }
    
    func calculateGPA() {
        let gpaCalculator = GPACalculator()
        let results = gpaCalculator.calculate(
            freshmanFirstSemGrades: freshmanFirstSemGrades, freshmanSecondSemGrades: freshmanSecondSemGrades, freshmanSummerGrades: freshmanSummerGrades,
            sophomoreFirstSemGrades: sophomoreFirstSemGrades, sophomoreSecondSemGrades: sophomoreSecondSemGrades, sophomoreSummerGrades: sophomoreSummerGrades,
            juniorFirstSemGrades: juniorFirstSemGrades, juniorSecondSemGrades: juniorSecondSemGrades, juniorSummerGrades: juniorSummerGrades,
            seniorFirstSemGrades: seniorFirstSemGrades, seniorSecondSemGrades: seniorSecondSemGrades,
            freshmanFirstSemAPs: freshmanFirstSemAPs, freshmanSecondSemAPs: freshmanSecondSemAPs, freshmanSummerAPs: freshmanSummerAPs,
            sophomoreFirstSemAPs: sophomoreFirstSemAPs, sophomoreSecondSemAPs: sophomoreSecondSemAPs, sophomoreSummerAPs: sophomoreSummerAPs,
            juniorFirstSemAPs: juniorFirstSemAPs, juniorSecondSemAPs: juniorSecondSemAPs, juniorSummerAPs: juniorSummerAPs,
            seniorFirstSemAPs: seniorFirstSemAPs, seniorSecondSemAPs: seniorSecondSemAPs
        )
        cumulativeUnweightedGPA = results.cumulativeUnweightedGPA
        cumulativeWeightedGPA = results.cumulativeWeightedGPA
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
