//
//  CharacterView.swift
//  Cleanny
//
//  Created by 종건 on 2022/06/08.
//

import SwiftUI

struct CharacterView: View {
   
    @Binding var isCleaning: Bool
    @Binding var index: Int
    @State private var complateText = ""
    @State private var showModal = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var userData: UserDataStore
    @EnvironmentObject var cleaning: CleaningDataStore

    @State private var isUpdatingView: Bool = true

   
//    let charcterArr = ["Cry", "Heit", "Laugh", "Love"]
        
    var body: some View {
        ZStack {
            Color("MBackground").ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Button(action: { self.showModal = true })
                    {
                        Image("Setting")
                            .foregroundColor(Color("MBlue"))
                            .padding()
                    }
                    .sheet(isPresented: self.$showModal) {
                        SettingModalView(showModal: $showModal)
                    }
                }
                Spacer()
                
                Text("\(complateText)")
                    .padding(.bottom)
                
                LottieView(name: isCleaning ? "Cleaning" : cleaning.charcterArr[index])
                
                Spacer()
                
                CleaningCategoryProgress(isCleaning: $isCleaning, index: $index, complateText: $complateText)
                Spacer(minLength:  150)
            }
        }
        .onChange(of: userData.totalPercentage) { newValue in
            isUpdatingView.toggle()
        }
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//            .environmentObject(CleaningDataStore())
//    }
//}
