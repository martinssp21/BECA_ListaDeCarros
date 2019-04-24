//
//  DetalhesCarroViewController.swift
//  ListaDeCarros
//
//  Created by Rodrigo Martins on 03/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class DetalhesCarroViewController: UIViewController {

    @IBOutlet weak private var imageDetalhe: UIImageView!
    @IBOutlet weak private var labelDetalheNome: UILabel!
    @IBOutlet weak private var labelDetalheFabrica: UILabel!
    @IBOutlet weak private var labelDetalheValor: UILabel!
    
    public var dadosCarro: AtributosDoCarro?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelDetalheNome.text = dadosCarro?.nome
        labelDetalheFabrica.text = dadosCarro?.fabrica
        labelDetalheValor.text = dadosCarro?.valor
        imageDetalhe.image = UIImage(named: dadosCarro!.imagem ?? "")
        switch dadosCarro?.cor {
        case "vermelho":
            self.view.backgroundColor = UIColor.red
        case "azul":
            self.view.backgroundColor = UIColor.blue
        case "branco":
            labelDetalheNome.textColor = UIColor.white
            labelDetalheFabrica.textColor = UIColor.white
            labelDetalheValor.textColor = UIColor.white
            self.view.backgroundColor = UIColor.gray
        case "laranja":
            self.view.backgroundColor = UIColor.orange
        case "preto":
            labelDetalheNome.textColor = UIColor.white
            labelDetalheFabrica.textColor = UIColor.white
            labelDetalheValor.textColor = UIColor.white
            self.view.backgroundColor = UIColor.black
        default:
            labelDetalheNome.textColor = UIColor.white
            labelDetalheFabrica.textColor = UIColor.white
            labelDetalheValor.textColor = UIColor.white
            self.view.backgroundColor = UIColor.black
        }
    }


}
