//
//  OversightGuideView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI

struct OversightGuideView: View {
    
    let oversightsurban: [OversightModel] = [
        OversightModel(imageName: "pneu", name: "Pneus Velhos", description: "Entregue seus pneus velhos ao serviço de limpeza urbana ou guarde-os sem água em local coberto"),
        OversightModel(imageName: "vaso", name: "Plantas e Jardins", description: "Evite ter bromélias e outras plantas que acumulam água, ou retire semanalmente a água das folhas. Mantenha os pratinhos dos vasos de planta limpos e encha de areia até a borda."),
        OversightModel(imageName: "garrafa", name: "Garrafas e latas", description: "Inspecionar todas as áreas da propriedade e retirar dos locais descobertos qualquer objeto descartado que possa acumular água."),
        OversightModel(imageName: "poco", name: "Caixas de água, cisterna e poços", description: "Mantenha-as bem fechadas. Poços lacrar com concreto, caso haja um cano este deve ser vedado com uma tela."),
        OversightModel(imageName: "grama", name: "Áreas de propriedade", description: "Cacos de vidro em muros, cavidades em cercas de pedra, muros, pedras, árvores e outros devem ser tampadas com barro ou cimento. Evitar deixar baldes, carrinhos de mão e outros utensílios que acumulam água ao relento. Inspecionar todas as áreas da propriedade, inclusive reservas legais, e retirar dos locais descobertos."),
        OversightModel(imageName: "calha", name: "Calhas", description: "Verificar se não estão entupidas. Limpe-as (Principalmente no período chuvoso). nivele-as, remova folhas, galhos e tudo que possa impedir a água de correr pelas calhas."),
        OversightModel(imageName: "laje", name: "Laje", description: "Não deixe água acumulada sobre a laje. mantenha-as sempre secas, caso tenha um desvio complete com terra."),
        OversightModel(imageName: "piscina", name: "Piscina", description: "Mantenha a piscina sempre limpa. Use cloro para tratar a água e o filtro periodicamente. Caso estejam em desuso. Limpar uma vez por semana, Devem estar cobertas se não estiverem sendo usadas. Se estiverem vazias, colocar sal no ponto mais raso.")
    ]
    
    let oversightsrural: [OversightModel] = [
        OversightModel(imageName: "pneu", name: "Pneus Velhos", description: "Entregue seus pneus velhos ao serviço de limpeza urbana ou guarde-os sem água em local coberto"),
        OversightModel(imageName: "vaso", name: "Plantas e Jardins", description: "Evite ter bromélias e outras plantas que acumulam água, ou retire semanalmente a água das folhas. Mantenha os pratinhos dos vasos de planta limpos e encha de areia até a borda."),
        OversightModel(imageName: "garrafa", name: "Garrafas e latas", description: "Inspecionar todas as áreas da propriedade e retirar dos locais descobertos qualquer objeto descartado que possa acumular água."),
        OversightModel(imageName: "poco", name: "Caixas de água, cisterna e poços", description: "Mantenha-as bem fechadas. Poços lacrar com concreto, caso haja um cano este deve ser vedado com uma tela."),
        OversightModel(imageName: "grama", name: "Áreas de propriedade", description: "Cacos de vidro em muros, cavidades em cercas de pedra, muros, pedras, árvores e outros devem ser tampadas com barro ou cimento. Evitar deixar baldes, carrinhos de mão e outros utensílios que acumulam água ao relento. Inspecionar todas as áreas da propriedade, inclusive reservas legais, e retirar dos locais descobertos."),
        OversightModel(imageName: "calha", name: "Calhas", description: "Verificar se não estão entupidas. Limpe-as (Principalmente no período chuvoso). nivele-as, remova folhas, galhos e tudo que possa impedir a água de correr pelas calhas."),
        OversightModel(imageName: "laje", name: "Laje", description: "Não deixe água acumulada sobre a laje. mantenha-as sempre secas, caso tenha um desvio complete com terra."),
        OversightModel(imageName: "piscina", name: "Piscina", description: "Mantenha a piscina sempre limpa. Use cloro para tratar a água e o filtro periodicamente. Caso estejam em desuso. Limpar uma vez por semana, Devem estar cobertas se não estiverem sendo usadas. Se estiverem vazias, colocar sal no ponto mais raso.")
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            
            Divider()
            
            VStack {
                HStack {
                    Text ("Selecione o tipo de ambiente para realizar a inspeção:")
                        .lineLimit(3)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.leading, 20)
                .padding(.bottom, 32)
                
                HStack(spacing: 20) {
                    
                    NavigationLink(
                        destination: OversigthOptionsView(selectedoption: oversightsurban, descriptionTitle: "Urbano"),
                        label: {
                            VStack{
                                Image("urban")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 95, height: 95)
                                
                                Text("Urbano")
                                    .font(.system(size:16))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.orange)
                                    .padding(.top, 10)
                                //                                .background(Color.orange)
                                //                                    .clipShape(Capsule())
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.429, height: UIScreen.main.bounds.width * 0.429)
                            .background(Color.gray.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                        })
                    
//                    Spacer()
                    
                    NavigationLink(
                        destination: OversigthOptionsView(selectedoption: oversightsrural, descriptionTitle: "Rural"),
                        label: {
                            VStack {
                                Image("rural")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 95, height: 105)
                                    
                            
                                
                                Text("Rural")
                                    .font(.system(size:16))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.orange)
//
                            }
                            .frame(width: UIScreen.main.bounds.width * 0.429, height: UIScreen.main.bounds.width * 0.429)
                            .background(Color.gray.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            
                            
                        })
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Guia de inspeção")
        }
    }
}

struct OversightGuideView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OversightGuideView()
        }
        .environment(\.colorScheme, .dark)
    }
}
