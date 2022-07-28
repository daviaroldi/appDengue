//
//  StaticTextView.swift
//  appDengue
//
//  Created by aluno13 on 26/07/22.
//

import SwiftUI

struct StaticTextView: View {
    let label: String
    let text: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label)
                .foregroundColor(.orange)
                .font(.body)
                .fontWeight(.bold)
            TextField(placeholder, text: Binding.constant(text))
                .disabled(true)
                .disableAutocorrection(true)
                .font(.callout)
                .foregroundColor(Color.init(red: 130/255, green: 130/255, blue: 130/255))
                .padding(.all, 6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.secondary).opacity(1))
        }
    }
}

struct StaticTextView_Previews: PreviewProvider {
    static var previews: some View {
        StaticTextView(label: "lbl", text: "text", placeholder: "phc")
    }
}
