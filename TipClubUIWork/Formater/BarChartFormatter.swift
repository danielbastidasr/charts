//
//  Created by Daniel Bastidas Ramirez on 26/02/2019.
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import Foundation
import Charts

@objc(BarChartFormatter)
public class BarChartFormatter: NSObject, IAxisValueFormatter
{
    var months: [String]! = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String
    {
        return months[Int(value)-1]
    }
}

extension BarLineChartViewBase{
    
    func format() {
        self.xAxis.granularity = 1.0
        
        // FORMAT MONTHS
        let formato:BarChartFormatter = BarChartFormatter()
        let xaxis:XAxis = XAxis()
        xaxis.valueFormatter = formato
        self.xAxis.valueFormatter = xaxis.valueFormatter
        
        // PAINT
        self.noDataText = "No data"
        self.xAxis.drawAxisLineEnabled = false
        self.xAxis.drawLimitLinesBehindDataEnabled = false
        self.xAxis.gridColor = UIColor(red:220/255, green:220/255,blue:220/255,alpha:1)
        self.xAxis.gridLineWidth = 0.5
        self.xAxis.drawGridLinesEnabled = true
        
        self.leftAxis.removeAllLimitLines()
        self.leftAxis.drawZeroLineEnabled = false
        self.leftAxis.zeroLineWidth = 0
        self.leftAxis.drawTopYLabelEntryEnabled = true
        self.leftAxis.drawAxisLineEnabled = false
        self.leftAxis.drawGridLinesEnabled = false
        self.leftAxis.drawLabelsEnabled = true
        self.leftAxis.drawLimitLinesBehindDataEnabled = false
        
        self.rightAxis.removeAllLimitLines()
        self.rightAxis.drawZeroLineEnabled = false
        self.leftAxis.zeroLineWidth = 0
        self.rightAxis.drawTopYLabelEntryEnabled = false
        self.rightAxis.drawAxisLineEnabled = false
        self.rightAxis.drawGridLinesEnabled = false
        self.rightAxis.drawLabelsEnabled = false
        self.rightAxis.drawLimitLinesBehindDataEnabled = false
        
        //ANIMATE
        self.animate(xAxisDuration: 0.0, yAxisDuration: 1.5)
    }
}
