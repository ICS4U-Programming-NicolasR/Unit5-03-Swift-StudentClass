//
// Student.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-06-07
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Creates the Student Class
import Foundation

struct Student {
    let firstName: String
    let middleInit: String?
    let lastName: String
    let grade: Int
    let iep: Bool
    
    init(firstName: String, middleInit: String?, lastName: String, grade: Int, iep: Bool) {
        self.firstName = firstName
        self.middleInit = middleInit
        self.lastName = lastName
        self.grade = grade
        self.iep = iep
    }
    
    func printInfo() {
        if let middleInit = middleInit {
            print("First Name: \(firstName), Middle Initial: \(middleInit), Last Name: \(lastName), Grade: \(grade), IEP: \(iep)")
        } else {
            print("First Name: \(firstName), Last Name: \(lastName), Grade: \(grade), IEP: \(iep)")
        }
    }
}
//
// Main.swift
//
//  Created by Nicolas Riscalas
//  Created on 2023-06-07
//  Version 1.0
//  Copyright (c) 2023 Nicolas Riscalas. All rights reserved.
//
//  Creates the Main Class

func main() {
    // set the file paths
    let inputFilePath = "input.txt"
    let outputFilePath = "output.txt"
    // split the input into separate values and separate them into variables 
    if let inputFile = try? String(contentsOfFile: inputFilePath) {
        let lines = inputFile.components(separatedBy: "\n")

        var answers = [String]()
        for line in lines {
            if line.isEmpty {
                answers.append("Invalid Input: Empty value")
                continue
            }
            let studentInfoArr = line.split(separator: " ").map { String($0) }
            let firstName = studentInfoArr[0]
            var middleInit: String?
            var lastName: String
            var grade: Int
            var iep = false
            // check if there's a middle name
            if studentInfoArr.count >= 5 {
                middleInit = studentInfoArr[1]
                lastName = studentInfoArr[2]
                grade = Int(studentInfoArr[3]) ?? 0
                iep = studentInfoArr[4] == "y"
            } else {
                lastName = studentInfoArr[1]
                grade = Int(studentInfoArr[2]) ?? 0
                iep = studentInfoArr[3] == "y"
            }
            // create the student object
            let student = Student(firstName: firstName, middleInit: middleInit, lastName: lastName, grade: grade, iep: iep)
            // print the info
            student.printInfo()
        }
        let outputString = answers.joined(separator: "\n")
        do {
            try outputString.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
        } catch {
            print("Error writing to file: \(error)")
        }
    } else {
        print("File not found or unable to read input file")
    }
}

main()
