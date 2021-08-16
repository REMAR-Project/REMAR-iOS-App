//
//  questionLists.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 15/08/2021.
//

import Foundation

func generateHabitatList(species: String) -> [String] {
    if (species == "Ucides cordatus") {
        return ["Mangrove","Forest","Beach","Road","Other"]
    } else {
        return ["Mangrove","Saltmarsh","Forest","Beach","Road","River Bed","Rocky Shore","House","Other"]
    }
}

func generateStateList(species: String) -> [String] {
    return ["Alagoas","Amapa","Bahia","Ceara","Espirito Santo","Maranhao","Parana","Paraiba","Para","Pernambuco","Rio Grande do Norte","Rio de Janeiro","Santa Catarina","Sergipe","Sao Paulo"]
}

func generateCountyList(species: String) -> [String] {
    if (species == "Ucides cordatus") {
        return ["Areia Branca","Baia Formosa","Caicara do Norte","Canguaretama","Ceara-Mirim","Extremoz","Galinhos","Grossos","Guamare","Macau","Maxaranguape","Natal","Nisia Floresta","Parnamirim","Pedra Grande","Porto do Mangue","Rio do Fogo","Senador Georgino Avelino","Sao Bento do Norte","Sao Miguel de Touros","Tibau","Tibau do Sul","Touros","Not in list"]
    } else {
        return ["Alcantara","Apicum-Acu","Araioses","Bacuri","Barreirinhas","Carutapera","Cedral","Cururupu","Candido Mendes","Godofredo Viana","Guimaraes","Humberto de Campos","Icatu","Luis Domingues","Paulino Neves","Paco do Lumiar","Porto Rico do Maranhao","Primeria Cruz","Raposa","Santo Amaro do Maranhao","Sao Jose de Ribamar","Sao Luis","Tutoia","Not in list"]
    }
}
