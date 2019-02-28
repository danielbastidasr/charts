//
//  Created by Daniel Bastidas Ramirez on 26/02/2019.
//  Copyright © 2019 Daniel Bastidas. All rights reserved.
//

import UIKit
import Charts

class ChartViewController: UIViewController {
    
    @IBOutlet weak var chartView: LineChartView!
    @IBOutlet weak var combinedChartView: CombinedChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLinearChart()
        setCombinedChart()
    }
    
    func setCombinedChart() {
    
        // SET1
        let values = [
            ChartDataEntry(x: 1.0, y: 10.0),
            ChartDataEntry(x: 2.0, y: 50.0),
            ChartDataEntry(x: 3.0, y: 100.0),
            ChartDataEntry(x: 4.0, y: 15.0),
            ChartDataEntry(x: 5.0, y: 60.0),
            ChartDataEntry(x: 6.0, y: 64.0),
            ChartDataEntry(x: 7.0, y: 70.0),
            ChartDataEntry(x: 8.0, y: 45.0),
            ChartDataEntry(x: 9.0, y: 55.0),
            ChartDataEntry(x: 10.0, y: 97.0),
            ChartDataEntry(x: 11.0, y: 35.0),
            ChartDataEntry(x: 12.0, y: 44.0)
        ]
        let set1 = LineChartDataSet(values: values, label: "Avg. WinRate")
        set1.setColor(.red)
        set1.setCircleColor(.red)
        set1.circleHoleColor = .red
        set1.drawFilledEnabled = true
        set1.fillColor = .red
        set1.mode = .cubicBezier
        
        // SET2
        let barChartValues : [BarChartDataEntry] = [
            BarChartDataEntry(x:3.0, y: 78.0)
        ]
        let barChartSet: BarChartDataSet = BarChartDataSet(values: barChartValues, label: "Current WinRate")
        barChartSet.setColor(.blue)
        
        // PAINT CHART
        let data: CombinedChartData =  CombinedChartData(dataSets: [set1,barChartSet])
        data.barData = BarChartData(dataSet: barChartSet)
        data.lineData = LineChartData(dataSet: set1)
        
        combinedChartView.data = data
        self.combinedChartView.format()
    }
    
    func setLinearChart() {
        
        // SET 1
        let values = [
            ChartDataEntry(x: 1.0, y: 20.0),
            ChartDataEntry(x: 2.0, y: 80.0),
            ChartDataEntry(x: 3.0, y: 40.0),
            ChartDataEntry(x: 4.0, y: 60.0),
            ChartDataEntry(x: 5.0, y: 60.0),
            ChartDataEntry(x: 6.0, y: 70.0)
        ]
        let set1 = LineChartDataSet(values: values, label: "Tipster A")
        set1.setColor(.red)
        set1.setCircleColor(.red)
        set1.circleHoleColor = .red
        set1.drawFilledEnabled = true
        set1.fillColor = .red
        set1.mode = .cubicBezier
        
        // SET 2
        let values2 = [
            ChartDataEntry(x: 1.0, y: 10.0),
            ChartDataEntry(x: 2.0, y: 50.0),
            ChartDataEntry(x: 3.0, y: 100.0),
            ChartDataEntry(x: 4.0, y: 15.0),
            ChartDataEntry(x: 5.0, y: 60.0),
            ChartDataEntry(x: 6.0, y: 64.0)
        ]
        let set2 = LineChartDataSet(values: values2, label: "Tipster B")
        set2.setColor(.blue)
        set2.setCircleColor(.blue)
        set2.drawFilledEnabled = true
        set2.fillColor = .blue
        set2.mode = .cubicBezier
        
        // SET 3
        let values3 = [
            ChartDataEntry(x: 1.0, y: 100.0),
            ChartDataEntry(x: 2.0, y: 50.0),
            ChartDataEntry(x: 3.0, y: 30.0),
            ChartDataEntry(x: 4.0, y: 15.0),
            ChartDataEntry(x: 5.0, y: 44.0),
            ChartDataEntry(x: 6.0, y: 34.0)
        ]
        let set3 = LineChartDataSet(values: values3, label: "Tipster C")
        set3.setColor(.black)
        set3.setCircleColor(.black)
        set3.drawFilledEnabled = true
        set3.fillColor = .black
        set3.mode = .cubicBezier
        
        // PAINT GRAPH
        let data = LineChartData(dataSets: [set1,set2,set3])
        self.chartView.data = data
        self.chartView.format()
    }
}
