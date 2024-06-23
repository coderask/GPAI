import tkinter as tk

class Grades:
    def __init__(self):
        self.As = tk.StringVar(value="0")
        self.Bs = tk.StringVar(value="0")
        self.Cs = tk.StringVar(value="0")
        self.Ds = tk.StringVar(value="0")
        self.Fs = tk.StringVar(value="0")

class GPACalculator:
    @staticmethod
    def calculate(grades_data):
        total_unweighted_points = 0.0
        total_weighted_points = 0.0
        total_credits = 0.0
        
        grade_points = {'A': 4.0, 'B': 3.0, 'C': 2.0, 'D': 1.0, 'F': 0.0}
        
        for data in grades_data:
            grades, weighted_courses = data
            weighted_courses = int(weighted_courses.get()) if weighted_courses.get().isdigit() else 0
            credits = sum(int(getattr(grades, grade).get()) if getattr(grades, grade).get().isdigit() else 0 for grade in ['As', 'Bs', 'Cs', 'Ds', 'Fs'])

            for grade, suffix in zip(grade_points.keys(), ['As', 'Bs', 'Cs', 'Ds', 'Fs']):
                count = int(getattr(grades, suffix).get()) if getattr(grades, suffix).get().isdigit() else 0
                points = grade_points[grade] if grade in grade_points else 0
                total_unweighted_points += points * count
                total_weighted_points += (points + (1.0 if weighted_courses > 0 else 0)) * count
                total_credits += count

        cumulative_unweighted_gpa = total_unweighted_points / total_credits if total_credits != 0 else 0
        cumulative_weighted_gpa = total_weighted_points / total_credits if total_credits != 0 else 0
        
        return cumulative_unweighted_gpa, cumulative_weighted_gpa

class Application(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("GPA Calculator")
        self.grades_data = []
        
        self.create_widgets()
    
    def create_widgets(self):
        for i, period in enumerate(["Freshman", "Summer after Freshman", "Sophomore", "Summer after Sophomore", "Junior", "Summer after Junior", "Senior"]):
            frame = tk.LabelFrame(self, text=f"{period} Year", padx=10, pady=10)
            frame.pack(padx=10, pady=5, fill="x", expand="yes")
            
            tk.Label(frame, text="Number of Courses Taken:").pack(side="top", fill="x")
            courses = tk.Entry(frame)
            courses.pack(side="top", fill="x")
            
            tk.Label(frame, text="Total Weighted Courses:").pack(side="top", fill="x")
            weighted_courses = tk.Entry(frame)
            weighted_courses.pack(side="top", fill="x")
            
            grades = Grades()
            self.grades_data.append((grades, weighted_courses))
            
            for grade in ['A', 'B', 'C', 'D', 'F']:
                tk.Label(frame, text=f"{grade}'s:").pack(side="left")
                entry = tk.Entry(frame, textvariable=getattr(grades, f"{grade}s"))
                entry.pack(side="left")
        
        calculate_button = tk.Button(self, text="Calculate GPA", command=self.calculate_gpa)
        calculate_button.pack(pady=20)
    
    def calculate_gpa(self):
        unweighted_gpa, weighted_gpa = GPACalculator.calculate(self.grades_data)
        print(f"Cumulative Unweighted GPA: {unweighted_gpa}")
        print(f"Cumulative Weighted GPA: {weighted_gpa}")

if __name__ == "__main__":
    app = Application()
    app.mainloop()