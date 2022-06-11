//
//  SettingCard.swift
//  Cleanny
//
//  Created by 한경준 on 2022/06/10.
//

import SwiftUI

struct SettingCard: View {
    
    @State var cleaningCategory: CleaningCategory
    
    var body: some View {
        
        ZStack {
            //배경 박스
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(cleaningCategory.activated ? Color.white : Color("LGray"))
                .shadow(color: cleaningCategory.activated ? Color("SBlue").opacity(0.4) : Color("MBlack").opacity(0.2), radius:4 , y:2
                )
            
            //청소 아이콘
            Image("\(cleaningCategory.imageName)")
                .renderingMode(.template)
                .resizable()
                .foregroundColor(cleaningCategory.activated ? /*@START_MENU_TOKEN@*/Color("MBlue")/*@END_MENU_TOKEN@*/ : Color("DGray"))
                .frame(width: 45, height: 45)
                .position(x: 57, y: 64)
            
            //청소 이름
            Text("\(cleaningCategory.name)")
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(Color("DGray"))
                .position(x: 57, y: 106)
            
            //체크 아이콘
            // 이미지 없어서 SFsymbol로 설정해놨습니다
            Image(systemName: "checkmark.circle.fill")
                .resizable(resizingMode: .tile)
            // MARK: 컬러 변경 필요
                .foregroundColor(cleaningCategory.activated ? Color("MBlue").opacity(0.8) : Color("DGray"))
                .frame(width: /*@START_MENU_TOKEN@*/20.0/*@END_MENU_TOKEN@*/, height: 20)
                .position(x: 97, y: 17)
            
        }
        .frame(width: 114, height: 140.0)
        .gesture(
            TapGesture()
                .onEnded{ _ in
                    cleaningCategory.activated.toggle()
                }
        )
    }
}

struct SettingCard_Previews: PreviewProvider {
    static var previews: some View {
        SettingCard(cleaningCategory: cleaningCategories[0])
    }
}

//struct SettingCardToggle: ToggleStyle {
//
//    @State var activated: Bool = true
//
//    @State var name: String = "분리수거"
//    @State var iconName: String = "DisposeTrash"
//
//    func makeBody(configuration: Configuration) -> some View {
//        Button {
//            configuration.isOn.toggle()
//        } label: {
//        icon: do {
//                ZStack {
//                    RoundedRectangle(cornerRadius: 10)
//
//                }
//                .frame(width: 114, height: 140.0)
//            }
//        }
//        .buttonStyle(PlainButtonStyle())
//        .opacity(0)
//    }
//}
