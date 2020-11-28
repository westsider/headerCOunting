import Foundation

let headerText = ["Section One", "Section Two", "Section Three"]
let tableViewContent = [["1", "2", "3"], ["4", "5", "6"], ["7" ,"8", "9", "10"]]

// what is the distance from a row in a tableview with headers to the to beginning of the tableview?

// 1st try
let indexPath = (section: 1, row: 2)
let target = tableViewContent[indexPath.section][indexPath.row]

func findDistToStart(section: Int, row: Int)-> Int {
    var distance = 0
    for (i, arr) in tableViewContent.enumerated() {
        if i <= section {
            for (j, _ ) in arr.enumerated() {
                if j <= row {
                    distance += 1
                }
            }
        }
    }
    return distance
}

var distance = findDistToStart(section: indexPath.section, row: indexPath.row)
print("1st try:\nTarget \(target), Distance: \(distance)")

// 2nd try after thinking about it I could do this
let flattened = tableViewContent.flatMap({ $0 })
if let index = flattened.firstIndex(of: "6") {
    print("\n2ndTry:\nDistance to begining is \(index + 1) of this flattened array: \(flattened)")
}

/* Output
 1st try:
 Target 6, Distance: 6

 2ndTry:
 Distance to beggining is 6 of this tableview array: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
*/

