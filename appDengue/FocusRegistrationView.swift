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
    
    @Binding var focusPoints: [Pin]
    @Binding var isViewActive: Bool
    
    private var currentDate: Date = Date()
    private var loggedAgent: Agent = Agent(47)
    private let dateFormatter = DateFormatter()
    private var formattedDate: String = ""
    private var focusSeverityNamesArray: [String] = Severity.getArraySeverityNames()
    
    @State private var focusPointAddress: String = ""
    @State private var focusPointDescription: String = ""
    @State private var focusSeverityIndex: Int = 0

    init(focusPoints: Binding<[Pin]>, isViewActive: Binding<Bool>) {
        self._focusPoints = focusPoints
        self._isViewActive = isViewActive
        
        self.dateFormatter.dateFormat = "dd/MM/yyyy - HH:mm"
    }
    
    public var body: some View {
        VStack(alignment: .leading) {
            Group {
                StaticTextView(
                    label: "Registro do agente",
                    text: loggedAgent.id.description,
                    placeholder: "Id")
                
                StaticTextView(
                    label: "Data de registro",
                    text: dateFormatter.string(from: currentDate),
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
                    .padding(.all, 6)
                    .overlay(RoundedRectangle(cornerRadius: 6)
                        .stroke(Color.secondary).opacity(1))
                
                Group {
                    Text("Passo 2:")
                        .foregroundColor(.orange)
                        .font(.body)
                        .fontWeight(.bold)
                    
                    Text("Severidade do foco")
                        .foregroundColor(Color(red: 190/255, green: 190/255, blue: 190/255))
                        .font(.body)
                        .fontWeight(.bold)
                }
                
                Picker(selection: $focusSeverityIndex, label: Text("")) {
                    ForEach(0 ..< self.focusSeverityNamesArray.count) {
                        Text(self.focusSeverityNamesArray[$0])
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
                
            Text("Passo 3:")
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
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.secondary).opacity(1))
            
            Spacer()
            
            HStack(alignment: .center) {
                Spacer()
            }
            
            Group {
                HStack(alignment: .center) {
                    Spacer()
                
                    Button {
                        if(managerDelegate.location == nil) {
                            return
                        }
                        
                        focusPoints.append(Pin(location: managerDelegate.location!, severity: Severity.getSeverityByIndex(index: focusSeverityIndex)))
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
            }

            Spacer()
        }
        .padding(EdgeInsets(top: 10, leading: 17, bottom: 5, trailing: 17))
        .navigationTitle("Registrar foco")
    }
}

struct FocusRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        let focused: [Pin] = []
        NavigationView {
            FocusRegistrationView(focusPoints: Binding.constant(focused), isViewActive: Binding.constant(true))
        }
        .environment(\.colorScheme, .dark)
        
    }
}
