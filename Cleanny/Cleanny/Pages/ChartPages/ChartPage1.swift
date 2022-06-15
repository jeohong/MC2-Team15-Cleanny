//
//  ChartPage1.swift
//  Cleanny
//
//  Created by 종건 on 2022/06/15.
//

import SwiftUI
import SwiftUICharts

struct ChartPage1: View {
    
    @EnvironmentObject var MonthData: MonthDataStore
    

    var body: some View {

        BarChartView(data: ChartData(values: MonthData.list[0].arr), title: MonthData.listKo[0].name )
           
            .padding()
    }
}
