//
//  RecordView.swift
//  Cleanny
//
//  Created by 종건 on 2022/06/08.
//

import SwiftUI


struct RecordView: View {
    
    @EnvironmentObject var cleaning: CleaningDataStore
    @State var index: Int = 0
    
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black]
    }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                
                switch index {
                case 0:
                    ChartPage1()
                case 1:
                    ChartPage2()
                case 2:
                    ChartPage3()
                case 3:
                    ChartPage4()
                case 4:
                    ChartPage5()
                default:
                    ChartPage6()
                }
                
                Spacer()
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(cleaning.list) {category in
                        RecordButton(cleaning: category, index: $index)
                    }
                }
                .padding(.horizontal)
                
                Spacer(minLength: 110)
            }.background(Color("MBackground"))
                .navigationTitle(Text("월별 통계"))
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}
struct RecordView_Previews: PreviewProvider {
    static var previews: some View {
        RecordView()
            .environmentObject(CleaningDataStore())
            .environmentObject(MonthDataStore())
        
    }
}
