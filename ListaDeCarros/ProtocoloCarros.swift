//
//  ProtocoloCarros.swift
//  ListaDeCarros
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import Foundation

struct CarrosDaLista: Decodable {
    var carros: [AtributosDoCarro]
    
    enum CodingKeys: String, CodingKey{
        case carros
    }
}

struct AtributosDoCarro: Decodable {
    var nome: String?
    var fabrica: String?
    var cor: String?
    var imagem: String?
    var valor: String?
    
    enum CodingKeys: String, CodingKey{
        case nome
        case fabrica
        case cor
        case imagem
        case valor
    }
    
    init(from decoder: Decoder) throws{
        let valores = try decoder.container(keyedBy: CodingKeys.self)
        
        nome = try valores.decodeIfPresent(String.self, forKey: .nome)
        fabrica = try valores.decodeIfPresent(String.self, forKey: .fabrica)
        cor = try valores.decodeIfPresent(String.self, forKey: .cor)
        imagem = try valores.decodeIfPresent(String.self, forKey: .imagem)
        valor = try valores.decode(String.self, forKey: .valor)
    }
}

extension CarrosDaLista{
    static func parse(_ data: Data) -> CarrosDaLista{
        var carrosDaLista = CarrosDaLista(carros: [AtributosDoCarro]())
        do {
            carrosDaLista = try JSONDecoder().decode(CarrosDaLista.self, from: data)
            
        } catch let error {
            print("Deu muito RUIM \(error)")
        }
        return carrosDaLista
    }
}
