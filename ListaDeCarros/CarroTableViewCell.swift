//
//  CarroTableViewCell.swift
//  ListaDeCarros
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class CarroTableViewCell: UITableViewCell {

    @IBOutlet weak private var labelNomeCarro: UILabel!
    @IBOutlet weak private var labelFabricanteCarro: UILabel!
    @IBOutlet weak private var imageFotoCarro: UIImageView!
    
    public var nomeDoCarro = String(){
        didSet{
            self.labelNomeCarro.text = self.nomeDoCarro
        }
    }
    
    public var fabricanteDoCarro = String(){
        didSet{
            self.labelFabricanteCarro.text = self.fabricanteDoCarro
        }
    }
    
    public var imagemDoCarro = String(){
        didSet{
            self.imageFotoCarro.image = UIImage(named: self.imagemDoCarro)
        }
    }
    
    public var corDoCarro = String(){
        didSet{
            switch self.corDoCarro {
            case "vermelho":
                self.labelFabricanteCarro.textColor = UIColor.red
            case "azul":
                self.labelFabricanteCarro.textColor = UIColor.blue
            case "branco":
                self.labelNomeCarro.textColor = UIColor.white
                self.labelFabricanteCarro.textColor = UIColor.white
                self.backgroundColor = UIColor.gray
            case "laranja":
                self.labelFabricanteCarro.textColor = UIColor.orange
            case "preto":
                self.labelFabricanteCarro.textColor = UIColor.black
            default:
                self.labelFabricanteCarro.textColor = UIColor.black
            }
        }
    }
    
    
    public func setupCarrosCelula(atributosDeCarro : AtributosDoCarro){
//        labelNomeCarro.text = atributosDeCarro.nome
//        labelFabricanteCarro.text = atributosDeCarro.fabrica
        imageFotoCarro.image = UIImage(named: atributosDeCarro.imagem!)
        setupCor(cor: Cor(rawValue: atributosDeCarro.cor!)!)
//        switch atributosDeCarro.cor {
//        case "vermelho":
//            labelFabricanteCarro.textColor = UIColor.red
//        case "azul":
//            labelFabricanteCarro.textColor = UIColor.blue
//        case "branco":
//            labelNomeCarro.textColor = UIColor.white
//            labelFabricanteCarro.textColor = UIColor.white
//            backgroundColor = UIColor.gray
//        case "laranja":
//            labelFabricanteCarro.textColor = UIColor.orange
//        case "preto":
//            labelFabricanteCarro.textColor = UIColor.black
//        default:
//            labelFabricanteCarro.textColor = UIColor.black
//        }
    }
    
    private func setupCor(cor : Cor){
//        switch cor {
//        case .vermelho:
//            self.labelFabricanteCarro.textColor = UIColor.red
//        case .azul:
//            self.labelFabricanteCarro.textColor = UIColor.blue
//        case .branco:
//            self.labelNomeCarro.textColor = UIColor.white
//            self.labelFabricanteCarro.textColor = UIColor.white
//            self.backgroundColor = UIColor.gray
//        case .laranja:
//            self.labelFabricanteCarro.textColor = UIColor.orange
//        case .preto:
//            self.labelFabricanteCarro.textColor = UIColor.black
//        default:
//            self.labelFabricanteCarro.textColor = UIColor.black
//        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
enum Cor: String {
    case vermelho
    case azul
    case branco
    case laranja
    case preto
}
