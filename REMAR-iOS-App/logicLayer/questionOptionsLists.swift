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

func generateProtectedList() -> [String] {
    return ["Parba dos Lencois Maranhenses","Resex de Cururupu","APA Delta do Parnaiba","APA da Foz do Rio das Preguicas - Pequenos Lencois - Regiao Lagunar Adjacente","APA das Reentrancias Maranhenses","APA de Upaon-acu / Miritiba / Alto Preguicas","PE da ilha do Cardoso","Not in list"]
}

func generateOccupationList() -> [String] {
    return [
        "• I catch crabs and depend on them for my living",
        "• I catch crabs only occasionally for my own consumption",
        "• I work with crab meat processing",
        "• I work with crab commercialization",
        "• I am a local villager and do not normally catch mangrove crabs",
        "• I work for ICMBio and observed the andada myself",
        "• I work for ICMBio and report results of a crab fisher",
        "• I work for IBAMA and observed the andada myself",
        "• I work for IBAMA and report results of a crab fisher",
        "• I work in the city hall and observed the andada myself",
        "• I work in the city hall and report results of a crab fisher",
        "• I am a researcher and observed the andada myself",
        "• I am a researcher and report results of a crab fisher",
        "• I am a tourist",
        "• I work in tourism",
        "• Other",
        "• I do not want to specify"
      ]
}
