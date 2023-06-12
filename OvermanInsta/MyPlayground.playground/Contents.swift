import SwiftUI

// 반환타입이 있어야 함수구현부 내에서 print() 를 하지 않아도 출력값을 볼 수 있는것 같다

// 함수의 선언
// func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입) -> 반환타입 {
//      함수구현부
//      reture 반환값
// }
func sum(a: Int, b: Int) -> Int {
    return a + b
}
print("함수 선언")
print(sum(a: 1, b: 2))


//func 함수이름(매개변수1이름: 매개변수1타입, 매개변수2이름: 매개변수2타입) -> Void {
//    함수구현부
//}
func printMyName(name: String, name2: String) -> Void {
    return print(name + name2)
}
print("반환타입이 없을 때 Void")
printMyName(name: "A", name2: "B")


// 혹은 생략하기
//func 함수이름(매개변수이름: 매개변수타입) {
//    return
//}
func printMyName2(name: String) {
     return print(name)
}
print("반환타입 생략하기")
printMyName2(name: "A")

//매개변수가 없을 때
//func 매개변수이름() -> 반환타입 {
//    함수구현부
//    return 반환값
//}
func maxImumIntegerValue() -> Int {
    return Int.max
}
print("매개변수가 없을 때")
print(maxImumIntegerValue())

// 매개변수와 반환값이 없는 함수
//func 함수이름() {
//    함수구현부
//    return 반환값
//}
func hellow() {
    return print("hellow")
}
print("매개변수와 반환값이 없는 함수")
hellow()


func myName(name: String, name2: String) -> Void {
    return print(name, name2)
}

myName(name: "qwe", name2: "uuu")
