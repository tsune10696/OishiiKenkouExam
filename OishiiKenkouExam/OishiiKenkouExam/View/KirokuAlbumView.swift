//
//  KirokuAlbumView.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import SwiftUI

//「料理記録アルバム」のビュー(4枚のビューをタブで束ねている)
struct KirokuAlbumView: View {
    var body: some View {
        TabView{
            AllView() //1枚目のビュー(全ての記録)
                .tabItem {
                    Image(systemName: "rectangle.stack")
                    Text("全ての記録")
                }
            MainDishView() //2枚目のビュー(主菜)
                .tabItem {
                    Image(systemName: "fish")
                    Text("主菜")
                }
            SideDishView() //3枚目のビュー(副菜)
                .tabItem {
                    Image(systemName: "leaf")
                    Text("副菜")
                }
                    
            SoupView() //4枚目のビュー(スープ)
                .tabItem {
                    Image(systemName: "cup.and.saucer")
                    Text("スープ")
                }
        }
        .accentColor(.green) //ここで色の指定
    }
}
