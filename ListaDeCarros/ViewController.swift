//
//  ViewController.swift
//  ListaDeCarros
//
//  Created by Rodrigo Martins on 02/04/19.
//  Copyright © 2019 Rodrigo Martins. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableViewCarros: UITableView!
    
    var arrayDeCarros = [AtributosDoCarro]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableViewCarros.delegate = self
        tableViewCarros.dataSource = self
        
        let nibDaCelula = UINib(nibName: "CarroTableViewCell", bundle: nil)
        tableViewCarros.register(nibDaCelula, forCellReuseIdentifier: "carroCell")
        arrayDeCarros = retornaArrayDeCarros()
    }
    
    func retornaArrayDeCarros() -> [AtributosDoCarro]{
        let arquivoJSON = Bundle.main.url(forResource: "Carros", withExtension: "json")!
        
        let dadosDoJSON: Data = try! Data(contentsOf: arquivoJSON)
        
        let carros = CarrosDaLista.parse(dadosDoJSON)
        
        return carros.carros
    }
    
    func criaAlerta(titulo: String, mensagem: String){
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alerta, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as? DetalhesCarroViewController
        let dados = sender as? AtributosDoCarro
        
        destino?.dadosCarro = dados
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayDeCarros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "carroCell") as! CarroTableViewCell
        
//        cell.nomeDoCarro = arrayDeCarros[indexPath.row].nome!
//        cell.fabricanteDoCarro = arrayDeCarros[indexPath.row].fabrica!
//        cell.corDoCarro = arrayDeCarros[indexPath.row].cor!
//        cell.imagemDoCarro = arrayDeCarros[indexPath.row].imagem!
        
        cell.setupCarrosCelula(atributosDeCarro: arrayDeCarros[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        criaAlerta(titulo: "Valor do \(arrayDeCarros[indexPath.row].nome!)", mensagem: "Fabicante: \(arrayDeCarros[indexPath.row].fabrica!) \n Valor: \(arrayDeCarros[indexPath.row].valor!)")

        let dados = arrayDeCarros[indexPath.row]
        self.performSegue(withIdentifier: "segueDetalheCarro", sender: dados)
        
    }
    
}

