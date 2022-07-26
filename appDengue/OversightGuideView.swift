//
//  OversightGuideView.swift
//  appDengue
//
//  Created by aluno13 on 25/07/22.
//

import SwiftUI

struct OversightGuideView: View {
    var body: some View {
        ScrollView(.vertical) {
            VStack (alignment: .leading){
                
                Divider()
                
                HStack (spacing: 16) {
                    Image("pneu")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(
                            Color(red: 230/255, green: 230/255, blue: 230/255)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
        
                    VStack(alignment: .leading) {
                        Text("Pneus Velhos")
                            .foregroundColor(.orange)
                        Text("Entregue seus pneus velhos ao serviço de limpeza urbana ou guarde-os sem água em local coberto")
                            .foregroundColor(.gray)
                    }
                }
                
                Divider()
                
                HStack (spacing: 16) {
                    Image("planta")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background(
                            Color.white
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
    
                    VStack(alignment: .leading) {
                        Text("Plantas e Jardins")
                            .foregroundColor(.orange)
                        Text("Evite ter bromélias e outras plantas que acumulam água, ou retire semanalmente a água das folhas. Mantenha os pratinhos dos vasos de planta limpos e encha de areia até a borda.")
                            .foregroundColor(.gray)
                    }
                }
                HStack (spacing: 16) {
                    Image("garrafa")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .background(
                            Color.white
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                   
                    VStack(alignment: .leading) {
                        Text("Garrafas e latas")
                            .foregroundColor(.orange)
                        Text("Inspecionar todas as áreas da propriedade e retirar dos locais descobertos qualquer objeto descartado que possa acumular água.")
                            .foregroundColor(.gray)
                    }
                }
                HStack (spacing: 16) {
                    Image("poco")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(
                            Color(red: 230/255, green: 230/255, blue: 230/255)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
                        
                    VStack(alignment: .leading) {
                        Text("Caixas de água, cisterna e poços")
                            .foregroundColor(.orange)
                        Text("Mantenha-as bem fechadas. Poços lacrar com concreto, caso haja um cano este deve ser vedado com uma tela.")
                            .foregroundColor(.gray)
                    }
                }
                HStack (spacing: 16) {
                    Image("grama")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(
                            Color(red: 230/255, green: 230/255, blue: 230/255)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
               
                    VStack(alignment: .leading) {
                        Text("Áreas de propriedade")
                            .foregroundColor(.orange)
                        Text("Cacos de vidro em muros, cavidades em cercas de pedra, muros, pedras, árvores e outros devem ser tampadas com barro ou cimento. Evitar deixar baldes, carrinhos de mão e outros utensílios que acumulam água ao relento. Inspecionar todas as áreas da propriedade, inclusive reservas legais, e retirar dos locais descobertos.")
                            .foregroundColor(.gray)
                    }
                }
                HStack (spacing: 16) {
                    Image("grama")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .background(
                            Color(red: 230/255, green: 230/255, blue: 230/255)
                        )
                        .clipShape(
                            RoundedRectangle(cornerRadius: 20)
                        )
               
                    VStack(alignment: .leading) {
                        Text("Calhas")
                            .foregroundColor(.orange)
                        Text("Verificar se não estão entupidas. Limpe-as (Principalmente no período chuvoso). nivele-as, remova folhas, galhos e tudo que possa impedir a água de correr pelas calhas.")
                            .foregroundColor(.gray)
                    }
                }
        }
            .padding(8)

        }
        .navigationTitle("Guia de inspeção")
    }
}

struct OversightGuideView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OversightGuideView()
        }
    }
}
