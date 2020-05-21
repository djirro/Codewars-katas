import UIKit


// MARK - check numver Even or Odd
func evenOrOdd(_ number: Int) -> String {
    return number % 2 == 0 ? "Even" : "Odd"
}


// MARK - summ of positives in array
func sumOfPositives(_ numbers: [Int]) -> Int {
    return numbers.isEmpty ? 0 : numbers.filter{$0 > 0}.reduce(0, +)
}


// MARK - expression matter
// for me. If need sort array use sorted{$0 > $1} fo max to min
func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    let exampleOne = a * (b + c)
    let exampleTwo = a * b * c
    let exampleThree = a + b * c
    let exampleFour = (a + b) * c
    let exampleFive = a + b + c
    
    return max(exampleOne, exampleTwo, exampleThree, exampleFour, exampleFive)
}


// MARK - solution
func solution(_ num: Int) -> Int {
    return (0...num-1).filter{ $0 % 3 == 0 || $0 % 5 == 0 }.reduce(0, +)
}


func solutionFast(_ num: Int) -> Int {
    var a = 0
    var b = 0
    var c = 0
    
    a = (num - 1) / 3
    b = (num - 1) / 5
    c = (num - 1) / 15
    
    let sum3 = 3 * a * (a + 1) / 2
    let sum5 = 5 * b * (b + 1) / 2
    let sum15 = 15 * c * (c + 1) / 2
    
    return sum3 + sum5 - sum15
}


//MARK - hack
func ecryptThis(text: String) -> String {
    var arrayOfWords = text.components(separatedBy: " ")
    var arrayOfCryptoWords = [String]()

    for word in arrayOfWords {
        var arrayOfString = Array(word).map{ String($0) }
        
        let firstChar = arrayOfString[0].unicodeScalars.filter{ $0.isASCII }.first?.value
        arrayOfString.remove(at: 0)
        
        if arrayOfString.count > 1 { arrayOfString.swapAt(0, arrayOfString.count-1) }
        let stringReverse = arrayOfString.joined(separator: "")
        
        let cryptoWord = String(firstChar!) + stringReverse
        arrayOfCryptoWords.append(cryptoWord)
    }
    
    return arrayOfCryptoWords.joined(separator: " ")
}


//MARK - digital root
func digitalRoot(of number: Int) -> Int {
    var arrayOfNumbers = String(number).compactMap(){ Int(String($0)) }
    var sum = 0
    
    while arrayOfNumbers.count > 1 {
        sum = arrayOfNumbers.reduce(0, +)
        arrayOfNumbers = String(sum).compactMap(){ Int(String($0)) }
    }
    
    return sum
}


//MARK - dashatize

//var arrayOfNumbers = String(number).compactMap(){ (String($0)) }
//if arrayOfNumbers[0] == "-" { arrayOfNumbers.remove(at: 0) }
//
//return arrayOfNumbers.joined(separator: "")


func myDashatize(number: Int) -> String {
    let number = number < 0 ? -number : number
    
    var arrayOfNumbers  = String(number).compactMap() { Int(String($0)) }
    var stringOfNumbers = String(number).compactMap() { (String($0)) }
    
    if arrayOfNumbers.count > 1 {
        for (index, num) in arrayOfNumbers.enumerated() {
            if num % 2 != 0 {
                if index > 0 { stringOfNumbers[index] = "-" + stringOfNumbers[index] }
                
                if index + 1 < arrayOfNumbers.count && arrayOfNumbers[index + 1] % 2 == 0 {
                    stringOfNumbers[index] = stringOfNumbers[index] + "-"
                }
            }
        }
    }
    
    return stringOfNumbers.joined(separator: "")
}


func dashatize(number: Int) -> String {
    let number = number < 0 ? -number : number
    let stringArray =  String(number).map { Int(String($0))! % 2 == 0 ? "\($0)" : "-\($0)-" }
    var stringed = stringArray.joined(separator: "")
    
    if stringed.first == "-" { stringed.remove(at: stringed.startIndex) }
    if stringed.last == "-" { stringed = String(stringed.dropLast()) }
    
    return stringed.replacingOccurrences(of: "--", with: "-")
}


// MARK - tribonacci
func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
    guard n > 3 else { return Array(signature[0..<n]) }
    
    var signature = signature
    var indexSignature = 3
    var sum = 0
    
    while indexSignature < n {
        sum = signature[indexSignature-1] + signature[indexSignature-2] + signature[indexSignature-3]
        signature.append(sum)
        indexSignature += 1
    }
    
    return signature
}


// MARK - persistence
func persistence(for num: Int) -> Int {
    var arrayofNum = String(num).map { Int(String($0))! }
    var product = 0
    var counter = 0
    
    guard arrayofNum.count > 1 else { return 0 }
    
    while arrayofNum.count > 1 {
        product = arrayofNum.reduce(1, *)
        arrayofNum = String(product).map { Int(String($0))! }
        counter += 1
    }
    
    return counter
}

func persistencePro(for num: Int) -> Int {
  let digits: [Int] = String(num).flatMap { Int(String($0)) }
  
  return digits.count == 1 ? 0 : 1 + persistence(for: digits.reduce(1, *))
}

persistencePro(for: 9999999)





