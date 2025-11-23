import Foundation

// Palindrome

func isPalindrome(_ word: String) -> Bool {
    let chars = Array(word)
    var leftPointer = 0
    var rightPointer = word.count - 1
    
    while leftPointer < rightPointer {
        if chars[leftPointer] != chars[rightPointer] {
            return false
        }
        leftPointer += 1
        rightPointer -= 1
    }
    
    return true
}

// Palindrome tests
isPalindrome("racecar")
isPalindrome("abccba")
isPalindrome("hello")
isPalindrome("palindrome")

// Two sums

func getTargetSumIndexes(nums: [Int], target: Int) -> [Int] {
    var complements: [Int: Int] = [:]
    
    for (i, num) in nums.enumerated() {
        let complement = target - num
        if let indexMatch = complements[complement] {
            return [i, complement]
        }
        complements[num] = i
    }
    
    return []
}

getTargetSumIndexes(nums: [2, 7, 11, 15], target: 9)

// Closing bracket, parenthesis, ...

func isValid(string: String) -> Bool {
    var stack: [Character] = []
    let pairs: [Character: Character] = ["]": "[", "}": "{", ")": "("]
    
    for s in string {
        if let match = pairs[s] {
            if stack.isEmpty || stack.removeLast() != match {
                return false
            }
        } else {
            stack.append(s)
        }
    }
    
    return stack.isEmpty
}

isValid(string: "[{}]")
isValid(string: "[{(())}[")
isValid(string: "[{([])}]")
isValid(string: "[({})]")

// Find duplicates
func findDuplicates(_ nums: [Int]) -> [Int] {
    var seen = Set<Int>()
    var duplicates = Set<Int>()
    for num in nums {
        if !seen.insert(num).inserted {
            duplicates.insert(num)
        }
    }
    return Array(duplicates)
}
