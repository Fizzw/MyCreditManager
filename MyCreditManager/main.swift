//
//  main.swift
//  MyCreditManager
//
//  Created by 박정우 on 2022/11/23.
//


import Foundation

var controlValue = true
var checkStudentName : [String] = []
var checkSubjectName : [String] = []
var checkSubjectChange : [String] = []
var checkSubjectAdd : [String] = []
var checkSubjectAddNameSplit : [Substring] = []
var checkSubjectDictionary : [Substring : Substring] = [:]


class MyCreditFunction{
   
    func StudentInsert(_ name : String){
     
        if(name.isEmpty){
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if(checkStudentName.contains(name) == false){
            checkStudentName.append(name)
            print("\(name) 학생을 추가했습니다.")
        }else if(checkStudentName.contains(name) == true){
           print("\(name)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
   }
    
    func studentDelete(_ name : String){
        if let index = checkStudentName.firstIndex(of: name) {
            checkStudentName.remove(at: index)
            print("\(name) 학생을 삭제하였습니다.")
        }else {
            print("\(name) 학생을 찾지 못했습니다.")
        }
    }
    
    func SubjectAdd(name : Substring?,subject : Substring?, grade : Substring?){
        checkSubjectDictionary[name!+" "+subject!] = grade!
        print("\(name!) 학생의 \(subject!) 과목이 \(grade!)로 추가 (변경)되었습니다.")
    }
    
    func subjectDelete(){
        let deleteSubjectName = readLine()!
        let checkSubjectDeleteNameSplit = deleteSubjectName.split(separator: " ")
        
        if(deleteSubjectName.isEmpty){
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if(checkSubjectDictionary.keys.contains(Substring(deleteSubjectName))==true){
            checkSubjectDictionary.removeValue(forKey: Substring(deleteSubjectName))
            print("\(checkSubjectDeleteNameSplit[0]) 학생의 \(checkSubjectDeleteNameSplit[1]) 과목의 성적이 삭제되었습니다.")
        }else if(checkStudentName.contains(String(checkSubjectDeleteNameSplit[0])) == false){
            print("\(checkSubjectDeleteNameSplit[0]) 학생을 찾지 못했습니다.")
        }else if(checkStudentName.contains(String(checkSubjectDeleteNameSplit[0])) == true){
            print("입력이 잘못되었습니다.다시 확인해주세요.")
        }
    }
    
   func ExitProgram(){
        print("프로그램을 종료합니다.")
    }
}


final class MyCreditExplantion{
    let startExplanation = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
    let subjectAddExplanation = "성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다."
    let subjectDeleteExplanation = "성적을 삭제할 학생의 이름,과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift"
}

let myCreditFunction = MyCreditFunction()
let myCreditExplanation = MyCreditExplantion()



while (controlValue){
   
    print(myCreditExplanation.startExplanation)
    let myValue = readLine()!
    
    switch myValue{
    case "1":
        print("추가할 학생의 이름을 입력해주세요")
        let insertStudentName = readLine()!
        myCreditFunction.StudentInsert(insertStudentName)
       break
    case "2":
        print("삭제할 학생의 이름을 입력하세요.")
        let deleteStudentName = readLine()!
        myCreditFunction.studentDelete(deleteStudentName)
        break
    case "3":
        print(myCreditExplanation.subjectAddExplanation)
        let subjectAddName = readLine()!
        let checkSubjectAddNameSplit = subjectAddName.split(separator: " ")
       
        if(subjectAddName == ""){
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if (checkStudentName.contains(String(checkSubjectAddNameSplit[0])) == false){
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if (checkStudentName.contains(String(checkSubjectAddNameSplit[0])) == true){
            if(checkSubjectAddNameSplit.contains(checkSubjectAddNameSplit[1]) && checkSubjectAddNameSplit.contains(checkSubjectAddNameSplit[2]) == false ){
                print("입력이 잘못되었습니다. 다시 확인해주세요.")
            }else if(checkSubjectAddNameSplit.contains(checkSubjectAddNameSplit[1]) || checkSubjectAddNameSplit.contains(checkSubjectAddNameSplit[2]) == true ){
                checkSubjectDictionary[checkSubjectAddNameSplit[0]+" "+checkSubjectAddNameSplit[1]] = checkSubjectAddNameSplit[2]
                print("\(checkSubjectAddNameSplit[0]) 학생의 \(checkSubjectAddNameSplit[1]) 과목이 \(checkSubjectAddNameSplit[2])로 추가 (변경)되었습니다.")
            }
            
        }else {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }
        break
    case "4":
        print(myCreditExplanation.subjectDeleteExplanation)
        myCreditFunction.subjectDelete()
        break
    case "5":
        print("평점을 알고싶은 학생의 이름을 입력해주세요")
        let studentGrade = readLine()!
        
        if(studentGrade.isEmpty){
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
        }else if(checkStudentName.contains(studentGrade) == true){
            print(checkSubjectDictionary)
            var keyArray : [Substring] = [Substring]()
            var valueArray : [Substring] = [Substring]()
            
            print(studentGrade.count)
         //   let startIdx : Substring.Index = keyArray.index(keyArray.startIndex, offsetBy: studentGrade.count)
            print(keyArray)
            print(type(of: keyArray))
            print(type(of: valueArray))
        }else if(checkSubjectName.contains(studentGrade) == false){
            print("\(studentGrade) 학생을 찾지 못했습니다.")
        }
        
       
        break
    case "X":
        myCreditFunction.ExitProgram()
        controlValue = false
        break
    default:
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        break
        
    }
    
}
