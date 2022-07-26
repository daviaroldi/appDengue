//
//  FocusRegistrationView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import CoreLocation

struct FocusRegistrationView: View {
    @Binding var focusPoints: [Pin]
    //var currentLocation: CLLocation
    
    private var currentDate: Date = Date()
    private var loggedAgent: Agent = Agent(47)
    
    @State private var focusPointAddress: String = ""
    @State private var focusPointDescription: String = ""

    init(focusPoints: Binding<[Pin]>) {
        self._focusPoints = focusPoints
        //self.currentLocation = currentLocation
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            StaticTextView(
                label: "Registro do agente",
                text: loggedAgent.id.description,
                placeholder: "Id")
            
            StaticTextView(
                label: "Data de registro",
                text: currentDate.description,
                placeholder: "Data atual")
            
            Group {
                Text("Passo 1:")
                    .foregroundColor(.orange)
                    .font(.body)
                    .fontWeight(.bold)
                
                Text("Adicione o endereço")
                    .foregroundColor(Color(red: 190/255, green: 190/255, blue: 190/255))
                    .font(.body)
                    .fontWeight(.bold)
            }
            
            TextField("Endereço do foco", text: $focusPointAddress)
                .foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255))
                .font(.callout)
            
            Text("Passo 2:")
                .foregroundColor(.orange)
                .font(.body)
                .fontWeight(.bold)
            
            Text("Adicione uma descrição")
                .foregroundColor(Color(red: 190/255, green: 190/255, blue: 190/255))
                .font(.body)
                .fontWeight(.bold)
            

            
            TextEditor(text: $focusPointAddress)
                .font(.callout)
                .foregroundColor(Color(red: 150/255, green: 150/255, blue: 150/255))
                .frame(height: 230)
                .lineLimit(50)
                .multilineTextAlignment(.leading)
                .padding(4)
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.secondary).opacity(0.2))
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
                
                Button {
                    print("Button 1")
                    //focusPoints.append(Pin(location: currentLocation))
                } label: {
                    Text("Salvar")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
                        .frame(maxWidth: 100)
                        .background(
                            Capsule()
                                .fill(Color(red: 238/255, green: 238/255, blue: 238/255))
                        )
                        .font(.headline)
                }
                .buttonStyle(PlainButtonStyle())
            }
            
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(EdgeInsets(top: 10, leading: 17, bottom: 5, trailing: 17))
        .navigationTitle("Registrar foco")
    }
}

struct FocusRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        let focused: [Pin] = []
        FocusRegistrationView(focusPoints: Binding.constant(focused))
    }
}
