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

func generateProtectedList(state: String) -> [String] {
    
    if (state == "Alagoas"){
        return ["APA de Piaçabuçu","Resex Lagoa do Jequiá","APA Costa dos Corais","APA de Santa Rita","Not in list"]
    } else if (state == "Amapá"){
        return ["ESEC de Maracá-Jipioca","Parna do Cabo Orange","Rebio do Lago Piratuba","Not in list"]
    } else if (state == "Bahia"){
        return ["Parna do Monte Pascoal","Rebio de Una","Resex baia de Iguape","Resex Cassurubá","Resex do Corumbau","Resex de Canavieiras","Revis Rio dos Frades","Revis de Una","APA Baía de Camamu","APA Baía de Todos os Santos","APA Caraíva/Trancoso","APA Costa de Itacaré/Serra Grande","APA Lagoa Encantada","APA Lagoas de Guarajuba","APA Plataforma Continental do Litoral Norte","APA Ponta da Baleia/Abrolhos","APA Santo Antônio","PARNA do Descobrimento","Not in list"]
    } else if (state == "Ceará") {
        return ["Parna de Jericoacoara","Resex Batoque","APA Delta do Parnaíba","APA do Estuário do Rio Mundaú","APA do Manguezal da Barra Grande","APA do Rio Pacoti","APA Serra de Ibiapaba","Not in list"]
    } else if (state == "Espírito Santo") {
        return ["APA Costa das Algas","Revis de Santa Cruz","APA Conceição da Barra","APA do Maciço Central","APA Municipal Manguezal Sul da Serra","ESEC Municipal Ilha do Lameirão","PE de Itaúnas","PNM de Jacarenema","PNM do Manguezal de Itanguá","PNM Dom Luiz Gonzaga Fernandes","RDS Municipal do Manguezal de Cariacica","RDS Municipal Papagaio","RDS Municipal Piraque-Açú e Piraque-Mirim","Not in list"]
    } else if (state == "Maranhão") {
        return ["Parna dos Lençois Maranhenses","Resex de Cururupu","APA Delta do Parnaíba","APA da Baixada Maranhense","APA da Foz do Rio das Preguiças - Pequenos Lençóis - Região Lagunar Adjacente","APA das Reentrâncias Maranhenses","APA de Upaon-açu/Miritiba/Alto Preguiças","PE da Ilha do Cardoso","Not in list"]
    } else if (state == "Paraná") {
        return ["APA de Guaraqueçaba","ESEC de Guaraqueçaba","Parna do Superagui","APA Estadual de Guaratuba","ESEC do Guaraguaçu","PARNA de Saint-Hilaire/Lange","REBIO Bom Jesus","Not in list"]
    } else if (state == "Paraíba") {
        return ["APA da Barra de Mamanguape","ARIE Manguezais da Foz do Rio Mamanguape","Flona da Restinga de Cabedelo","Resex Acaú- Goiana","ARIE da Barra do Rio Camaratuba","PE do Jacarapé","Not in list"]
    } else if (state == "Pará") {
        return ["Resex de São João da Ponta","Resex Mãe Grande de Curuça","Resex Araí Peroba","Resex Chocoaré- Mato Grosso","Resex Gurupi-Piriá","Resex Maracanã","Resex Marinha Cuinarana","Resex Marinha de Tracuateua","Resex Marinha de Caeté-Taperaçú","Marinha Mestre Lucindo","RESEX Marinha Mocapajuba","Resex Soure","APA de Algodoal-Maiandeua","APA do Arquipélago do Marajó","Not in list"]
    } else if (state == "Pernambuco") {
        return ["Resex Acaú- Goiana","Parna Marinho de Fernando de Noronha","APA de Sirinhaém","Not in list"]
    } else if (state == "Piauí") {
        return ["Resex Delta do Parnaíba","APA Serra de Ibiapaba","Not in list"]
    } else if (state == "Rio Grande do Norte") {
        return ["APA Bonfim/Guaraíra","APA de Jenipabu","PE da Lagoa do Açu","RDS Estadual Ponta do Tubarão","Not in list"]
    } else if (state == "Rio de Janeiro") {
        return ["APA de Cairuçu","APA de Guapi-Mirim","ESEC da Guanabara","APA da Bacia do Rio Macacu","APA da Bacia do Rio São João - Mico Leão","APA da Orla Marítima da Baía de Sepetiba","APA da Serra da Capoeira Grande","APA das Brisas","APA de Tamoios","APA do Morro do Silvério","APA da Estrela","APA Suruí","REBIO Estadual de Guaratiba","Not in list"]
    } else if (state == "Santa Catarina") {
        return ["APA da Baleia Franca","APA de Anhatomirim","ESEC de Carijós","Resex do Pirajubaé","PE Acarai","PE da Serra do Tabuleiro","PNM da Caieira","RDS da Ilha do Morro do Amaral","Not in list"]
    } else if (state == "Sergipe") {
        return ["Rebio de Santa Izabel","FLONA do Ibura","RPPN do Caju","Not in list"]
    } else if (state == ""){
        return ["APA de Cananéia-Iguapé-Peruíbe","ARIE Ilha do Ameixal","Resex Mandira","APA Ilha Comprida","APA Marinha do Litoral Norte","ARIE do Guará","ESEC Juréia-Itatins","PE da Serra do Mar","PE do Itinguçu","PE Lagamar de Cananeia","PE Restinga de Bertioga","RDS da Barra do Una","RDS Itapanhapima","RESEX Ilha do Tumba","RESEX Taquari","Not in list"]
    } else { return ["Not in list"] }
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
