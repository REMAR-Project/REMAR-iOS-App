//
//  questionLists.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 15/08/2021.
//

import Foundation

func generateMonths() -> [String] {
    return [NSLocalizedString("January", comment: ""),NSLocalizedString("February", comment: ""),NSLocalizedString("March", comment: ""),NSLocalizedString("April", comment: ""),NSLocalizedString("May", comment: ""),NSLocalizedString("June", comment: ""),NSLocalizedString("July", comment: ""),NSLocalizedString("August", comment: ""),NSLocalizedString("September", comment: ""),NSLocalizedString("October", comment: ""),NSLocalizedString("November", comment: ""),NSLocalizedString("December", comment: "")]
}

func generateIntensity() -> [String] {
    return [NSLocalizedString("VeryLow", comment: ""),NSLocalizedString("Low", comment: ""),NSLocalizedString("Medium", comment: ""),NSLocalizedString("High", comment: ""),NSLocalizedString("VeryHigh", comment: ""),NSLocalizedString("NotSure", comment: "")]
}

func generateWhens() -> [String] {
    return [NSLocalizedString("OnlyD", comment: ""),NSLocalizedString("OnlyN", comment: ""),NSLocalizedString("AtD&N", comment: ""),NSLocalizedString("DidNotLook", comment: "")]
}

func generateBerried() -> [String] {
    return [NSLocalizedString("YesBerried", comment: ""),NSLocalizedString("NoBerried", comment: ""),NSLocalizedString("DidNotLook", comment: "")]
}

func generateHabitatList(species: String) -> [String] {
    if (species == "Ucides cordatus") {
        return [NSLocalizedString("Mangrove",comment: ""),NSLocalizedString("Forest",comment: ""),NSLocalizedString("Beach",comment: ""),NSLocalizedString("Road",comment: ""),NSLocalizedString("Other",comment: "")]
    } else {
        return [NSLocalizedString("Mangrove",comment: ""),NSLocalizedString("Saltmarsh",comment: ""),NSLocalizedString("Forest",comment: ""),NSLocalizedString("Beach",comment: ""),NSLocalizedString("Road",comment: ""),NSLocalizedString("RiverBed",comment: ""),NSLocalizedString("RockyShore",comment: ""),NSLocalizedString("House",comment: ""),NSLocalizedString("Other",comment: "")]
    }
}

// State doesnt need to be localised as it is the same
func generateStateList() -> [String] {
    return ["Alagoas","Amapá","Bahia","Ceará","Espírito Santo","Maranhão","Paraná","Paraíba","Pará","Pernambuco","Piauí","Rio Grande do Norte","Rio de Janeiro","Santa Catarina","Sergipe","São Paulo"]
}

func generateCountyList(state: String) -> [String] {
    switch state {
    case "Rio Grande do Norte":
        return ["Areia Branca","Baia Formosa","Caicara do Norte","Canguaretama","Ceara-Mirim","Extremoz","Galinhos","Grossos","Guamare","Macau","Maxaranguape","Natal","Nisia Floresta","Parnamirim","Pedra Grande","Porto do Mangue","Rio do Fogo","Senador Georgino Avelino","Sao Bento do Norte","Sao Miguel de Touros","Tibau","Tibau do Sul","Touros","Not in list"]
    case "Maranhão":
        return ["Alcantara","Apicum-Acu","Araioses","Bacuri","Barreirinhas","Carutapera","Cedral","Cururupu","Candido Mendes","Godofredo Viana","Guimaraes","Humberto de Campos","Icatu","Luis Domingues","Paulino Neves","Paco do Lumiar","Porto Rico do Maranhao","Primeria Cruz","Raposa","Santo Amaro do Maranhao","Sao Jose de Ribamar","Sao Luis","Tutoia","Not in list"]
    case "Alagoas":
        return ["Barra de Santo Antônio","Barra de São Miguel","Coruripe","Feliz Deserto","Japaratinga","Jequiá da Praia","Maceió","Maragogi","Marechal Deodoro","Paripueira","Passo de Camaragibe","Piaçabuçu","Porto de Pedras","Roteiro","São Miguel dos Milagres","Not in list"]
    case "Amapá":
        return ["Amapá","Calçoene","Macapá","Oiapoque","Not in list"]
    case "Bahia":
        return ["Alcobaça","Belmonte","Cairu","Camaçari","Canavieiras","Candeias","Caravelas","Conde","Entre Rios","Esplanada","Igrapiúna","Ilhéus","Itacaré","Itaparica","Ituberá","Jaguaripe","Jandaíra","Lauro de Freitas","Madre de Deus","Maraú","Mata de São João","Mucuri","Nilo Peçanha","Nova Viçosa","Porto Seguro","Prado","Salinas da Margarida","Salvador","Santa Cruz Cabrália","Saubara","São Francisco do Conde","Una","Uruçuca","Valença","Vera Cruz","Not in list"]
    case "Ceará":
        return ["Acaraú","Amontada","Aquiraz","Aracati","Barroquinha","Beberibe","Camocim","Cascavel","Caucaia","Cruz","Fortaleza","Fortim","Icapí","Itapipoca","Itarema","Jijoca de Jericoacoara","Paracuru","Paraipaba","São Gonçalo do Amarante","Trairi","Not in list"]
    case "Espírito Santo":
        return ["Anchieta","Aracruz","Conceição da Barra","Fundão","Guarapari","Itapemirim","Linhares","Marataízes","Piúma","Presidente Kennedy","Serra","São Mateus","Vila Velha","Vitória","Not in list"]
    case "Paraná":
        return ["Guaraqueçaba","Guaratuba","Matinhos","Paranaguá","Pontal do Paraná","Not in list"]
    case "Paraíba":
        return ["Baía da Traição","Cabedelo","Conde","João Pessoa","Lucena","Marcação","Mataraca","Pitimbu","Rio Tinto","Santa Rita","Not in list"]
    case "Pará":
        return ["Augusto Corrêa","Bragança","Chaves","Magalhães Barata","Maracanã","Marapanim","Quatipuru","Salinópolis","Soure","São João de Pirabas","Tracuateua","Viseu","Not in list"]
    case "Pernambuco":
        return ["Barreiros","Cabo de Santo Agostinho","Fernando de Noronha","Goiana","Igarassu","Ilha de Itamaracá","Ipojuca","Jaboatão dos Guararapes","Olinda","Paulista","Recife","Sirinhaém","São José da Coroa Grande","Tamandaré","Not in list"]
    case "Piauí":
        return ["Cajueiro da Praia","Ilha Grande","Luís Correia","Parnaíba","Not in list"]
    case "Rio de Janeiro":
        return ["Angra dos Reis","Araruama","Armação dos Búzios","Arraial do Cabo","Cabo Frio","Campos dos Goytacazes","Carapebus","Casimiro de Abreu","Duque de Caxias","Guapimirim","Itaboraí","Itaguaí","Macaé","Magé","Mangaratiba","Maricá","Niterói","Parati","Quissamã","Rio das Ostras","Rio de Janeiro","Saquarema","São Francisco de Itabapoana","São Gonçalo","São João da Barra","Not in list"]
    case "Santa Catarina":
        return ["Araquari","Balneário Barra do Sul","Balneário Camboriú","Barra Velha","Biguaçu","Bombinhas","Florianópolis","Garopaba","Governador Celso Ramos","Imbituba","Itajaí","Itapema","Itapoá","Laguna","Navegantes","Palhoça","Paulo Lopes","Penha","Piçarras","Porto Belo","São Francisco do Sul","São José","Tijucas","Not in list"]
    case "Sergipe":
        return ["Aracaju","Barra dos Coqueiros","Brejo Grande","Estância","Itaporanga d'Ajuda","Pacatuba","Pirambu","Not in list"]
    case "São Paulo":
        return ["Bertioga","Canané","Caraguatatuba","Guarujá","Iguape","Ilha Comprida","Ilhabela","Itanhaém","Mongaguá","Peruíbe","Praia Grande","Santos","São Sebastião","São Vicente","Ubatuba","Not in list"]
    default:
        return ["Not in list"]
    }
}

func generateProtectedList() -> [String] {
    return ["Parba dos Lencois Maranhenses","Resex de Cururupu","APA Delta do Parnaiba","APA da Foz do Rio das Preguicas - Pequenos Lencois - Regiao Lagunar Adjacente","APA das Reentrancias Maranhenses","APA de Upaon-acu / Miritiba / Alto Preguicas","PE da ilha do Cardoso","Not in list"]
}

func generateOccupationList() -> [String] {
    return [
        NSLocalizedString("O1", comment: ""),
        NSLocalizedString("O2", comment: ""),
        NSLocalizedString("O3", comment: ""),
        NSLocalizedString("O4", comment: ""),
        NSLocalizedString("O5", comment: ""),
        NSLocalizedString("O6", comment: ""),
        NSLocalizedString("O7", comment: ""),
        NSLocalizedString("O8", comment: ""),
        NSLocalizedString("O9", comment: ""),
        NSLocalizedString("O10", comment: ""),
        NSLocalizedString("O11", comment: ""),
        NSLocalizedString("O12", comment: ""),
        NSLocalizedString("O13", comment: ""),
        NSLocalizedString("O14", comment: ""),
        NSLocalizedString("O15", comment: ""),
        NSLocalizedString("O0", comment: ""),
        NSLocalizedString("O00", comment: "")
      ]
}
