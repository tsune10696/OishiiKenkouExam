//
//  CommentView.swift
//  OishiiKenkou
//
//  Created by Ippei.T on 2023/02/05.
//

import SwiftUI

// 記録コメントなどを表示する子ビュー
struct CommentView: View {
    
    var comment: String
    var rec: String
    
    var body: some View {
        // 記録コメントを表示する
        Text(comment)
            .fontWeight(.regular)
            .foregroundColor(.black)
            .padding(3)
        
        //記録日時を表示する
        HStack{
            Text("記録日時：")
            Text(rec)
        }
        .foregroundColor(.gray)
    }
}

