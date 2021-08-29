//
//  submissionManager.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 22/08/2021.
//

import Foundation

struct sighting: Encodable {
    let valid = true
    let seen_by: String = ""
    let answers: [String] = []
    
}

class submissionManager {
    
    func generateJSON(answers: Answers) {
        let shape = [ "sightings": sighting.init()]
        //let shape = ["a":"aa"]
        
        do {
            let encodedDictionary = try JSONEncoder().encode(shape)
            print(encodedDictionary)
        } catch {
            print("Error: ", error)
        }
        
        //print(shape)
    }
    
    func generateJSONN(answers: Answers){
        let replyanswers = ["0": "A",
                            "1": "AA",
                            "2": "AAA",
                            "3": "AAAA",
                            "4": "AAA",
                            "5": "AA",
                            "6": "A",
                            "7": "",
                            "8": "",
                            "9": "",
                            "10": "",
                            "11": "",
                            "12": "",
                            "13": "",
                            "14": "",
                            "15": "",
                            "16": "",
                            "17": "",
                            "18": ""
        ]
        
        print("OK: \(replyanswers["6"])")
    }
    
    func submit() {
        // Create a URLRequest for an API endpoint
        let url = URL(string: "http://localhost:5000")!
        var request = URLRequest(url: url)

        
        // Serialize HTTP Body data as JSON
        let body = ["user_id": "12"]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        // Create the HTTP request
        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in

            if let error = error {
                // Handle HTTP request error
                print("ERROR:\n\(error)")
            } else if let data = data {
                // Handle HTTP request response
                print("RESPONSE:\n\(data)")
            } else {
                // Handle unexpected error
                print("Unexpected error...")
            }
        }
        
        task.resume()
        
    }
    
}
