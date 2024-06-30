import Foundation

struct Grades {
    var As: String = ""
    var Bs: String = ""
    var Cs: String = ""
    var Ds: String = ""
    var Fs: String = ""
}

struct GPAResults {
    var cumulativeUnweightedGPA: Double
    var cumulativeWeightedGPA: Double
}

class GPACalculator {
    func calculate(
        freshmanFirstSemGrades: Grades, freshmanSecondSemGrades: Grades, freshmanSummerGrades: Grades,
        sophomoreFirstSemGrades: Grades, sophomoreSecondSemGrades: Grades, sophomoreSummerGrades: Grades,
        juniorFirstSemGrades: Grades, juniorSecondSemGrades: Grades, juniorSummerGrades: Grades,
        seniorFirstSemGrades: Grades, seniorSecondSemGrades: Grades,
        freshmanFirstSemAPs: String, freshmanSecondSemAPs: String, freshmanSummerAPs: String,
        sophomoreFirstSemAPs: String, sophomoreSecondSemAPs: String, sophomoreSummerAPs: String,
        juniorFirstSemAPs: String, juniorSecondSemAPs: String, juniorSummerAPs: String,
        seniorFirstSemAPs: String, seniorSecondSemAPs: String
    ) -> GPAResults {
        let allGrades = [
            freshmanFirstSemGrades, freshmanSecondSemGrades, freshmanSummerGrades,
            sophomoreFirstSemGrades, sophomoreSecondSemGrades, sophomoreSummerGrades,
            juniorFirstSemGrades, juniorSecondSemGrades, juniorSummerGrades,
            seniorFirstSemGrades, seniorSecondSemGrades
        ]
        
        let apCourses = [
            freshmanFirstSemAPs, freshmanSecondSemAPs, freshmanSummerAPs,
            sophomoreFirstSemAPs, sophomoreSecondSemAPs, sophomoreSummerAPs,
            juniorFirstSemAPs, juniorSecondSemAPs, juniorSummerAPs,
            seniorFirstSemAPs, seniorSecondSemAPs
        ].compactMap { Int($0) }.reduce(0, +)
        
        var totalAs = 0
        var totalBs = 0
        var totalCs = 0
        var totalDs = 0
        var totalFs = 0
        
        for grades in allGrades {
            totalAs += Int(grades.As) ?? 0
            totalBs += Int(grades.Bs) ?? 0
            totalCs += Int(grades.Cs) ?? 0
            totalDs += Int(grades.Ds) ?? 0
            totalFs += Int(grades.Fs) ?? 0
        }
        
        let totalGrades = totalAs + totalBs + totalCs + totalDs + totalFs
        
        guard totalGrades > 0 else {
            return GPAResults(cumulativeUnweightedGPA: 0.0, cumulativeWeightedGPA: 0.0)
        }
        
        let totalGradePoints = (totalAs * 4) + (totalBs * 3) + (totalCs * 2) + (totalDs * 1)
        let unweightedGPA = Double(totalGradePoints) / Double(totalGrades)
        
        let weightedGPA = Double(totalGradePoints + apCourses) / Double(totalGrades)
        
        return GPAResults(
            cumulativeUnweightedGPA: unweightedGPA,
            cumulativeWeightedGPA: weightedGPA
        )
    }
}
