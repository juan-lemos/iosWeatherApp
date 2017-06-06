
import Foundation

extension Date {
    func thereIs10MinutesDifference(oldDate:Date, newDate:Date)->Bool{
        let aux=Calendar.current.date(byAdding: .minute, value: 10, to: oldDate)
        return aux!>oldDate
    }

}
