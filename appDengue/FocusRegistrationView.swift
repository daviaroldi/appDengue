//
//  FocusRegistrationView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI
import CoreLocation

//IF YOU WANT TO HAVE MORE THAN ONE INSTANCE OF A CLASS IN AN ENVIRONMENT, YOU NEED TO SPECIFY A KEYPATH
//struct Location1: EnvironmentKey {
//    static let defaultValue: locationDelegate = .init()
//}
//
//struct Location2: EnvironmentKey {
//    static let defaultValue: locationDelegate = .init()
//}
//
//extension EnvironmentValues {
//    var location1: locationDelegate {
//        get { self[Location1.self] }
//        set { self[Location1.self] = newValue }
//    }
//
//    var location2: locationDelegate {
//        get { self[Location2.self] }
//        set { self[Location2.self] = newValue }
//    }
//}

struct FocusRegistrationView: View {
    @EnvironmentObject var managerDelegate: locationDelegate
//    @Environment(\.location1) var location1
//    @Environment(\.location2) var location2
    
    @Binding var focusPoints: [Pin]
    @Binding var isViewActive: Bool
    
    private var currentDate: Date = Date()
    private var loggedAgent: Agent = Agent(47)
    private let dateFormatter = DateFormatter()
    private var formattedDate: String = ""
    
    @State private var focusPointAddress: String = ""
    @State private var focusPointDescription: String = ""

    init(focusPoints: Binding<[Pin]>, isViewActive: Binding<Bool>) {
        self._focusPoints = focusPoints
        self._isViewActive = isViewActive
        
        self.dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            StaticTextView(
                label: "Registro do agente",
                text: loggedAgent.id.description,
                placeholder: "Id")
            
            StaticTextView(
                label: "Data de registro",
                text: dateFormatter.string(from: currentDate),
                placeholder: "Data atual")
//                .environment(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Key Path@*/\.sizeCategory/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.extraExtraLarge/*@END_MENU_TOKEN@*/)
            
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
            

            
            TextEditor(text: $focusPointDescription)
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
                    //let newFocus = DengueFocus(1, focusPointAddress, currentDate, focusPointDescription, currentLocation)
                    if(managerDelegate.location == nil) {
                        return
                    }
                    
                    focusPoints.append(Pin(location: managerDelegate.location!))
                    isViewActive.toggle()
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

//struct FocusRegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        let focused: [Pin] = []
//        FocusRegistrationView(focusPoints: Binding.constant(focused))
//    }
//}
