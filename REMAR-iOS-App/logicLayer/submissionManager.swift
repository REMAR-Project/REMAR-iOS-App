//
//  submissionManager.swift
//  REMAR-iOS-App
//
//  Created by Lewis Watson on 22/08/2021.
//

import Foundation
import SwiftUI
import CoreData

struct sighting: Encodable {
    let valid = true
    let seen_by: String = ""
    let answers: [String] = []
}

class submissionManager {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest(entity: PendingSightings.entity(), sortDescriptors: []) var StoredData: FetchedResults<PendingSightings>
    
    func register() {
        
        let session = URLSession.shared
        let url = URL(string: "http://crab.napier.ac.uk/api/0.1/auth")!
        
        let phone_id = UUID()
        print("Registering Device " + phone_id.uuidString)
        
        // Set up the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data = Data("{\"phone\":{\"phone_id\":\"\(phone_id.uuidString)\",\"role\":\"fisherman\"}}".utf8)
        
        let json = [
            "phone":
                [
                    "phone_id" : phone_id.uuidString,
                    "role" : "fisherman"
                ]
        ]
        
        print("Registration Data: \(json)\n\n")
        
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        
        print("JSON: \(jsonData.description)\n\n")
        
        let task = session.uploadTask(with: request, from: data) { data, response, error in
            // Do something...
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
            }
        }
        
        task.resume()
        
    }
    
    func submit(answers: Answers, version: String, deviceID: UUID, bypass: String){
        print("Submitting Request...")
        
        var json: String
        
        let session = URLSession.shared
        let url = URL(string: "http://crab.napier.ac.uk/api/0.2/sightings")!
        var success: Bool = false
        
        // Set up the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if bypass == "" {
            json = generateJSON(answers: answers, version: version, deviceID: deviceID)
        } else {
            json = bypass
        }
        
        let jsonData = json.data(using: .utf8)!
        
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            // Do something...
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                if (httpResponse.statusCode == 200) {
                    success = true
                }
            }
            
            if (!success) {
                print("Request Failed... Saving to retry later")
                self.storeJSONString(jsonString: json)
            }
        }
        print(jsonData)
        
        task.resume()
    }
    
    func storeJSONString(jsonString: String) {
        
        //print(StoredData.first!.sightingJSON!)
        let managedObjectContext = PersistenceController.shared.container.viewContext
        
        let newSighting = PendingSightings(context: managedObjectContext)
        newSighting.sightingJSON = jsonString
        
        
        do {
            try managedObjectContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unexpected Error \(error)")
        }
        
    }
    
    func clearJSONSightings() {
        let managedObjectContext = PersistenceController.shared.container.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "PendingSightings")
        fetchRequest.returnsObjectsAsFaults = false
        
        let results = try? managedObjectContext.fetch(fetchRequest)
        for object in results! {
            guard let objectData = object as? NSManagedObject else {continue}
            managedObjectContext.delete(objectData)
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            let error = error as NSError
            fatalError("Unexpected Error \(error)")
        }
    }
    
    func generateDaysString(dayList: [dayItem], month: Int, year: String) -> [String] {
        
        var returnList: [String] = []
        
        for day in dayList {
            returnList.append("\(day.dayNumber)/\(month-day.monthOffset)/\(year) 00:00")
        }
        return returnList
        
    }
    
    func generateDayString(day: dayItem, month: Int, year: String) -> String {
        
        let string = "\(day.dayNumber)/\(month-day.monthOffset)/\(year) 00:00"
        return string
        
    }
    
    func additionalObservation(observation: String) -> String {
        if !observation.isEmpty {
            return "[\"Yes\",\"\(observation)\"]"
        } else {
            return "[\"No\"]"
        }
    }
    
    func timeOfDay(when: String) -> String {
        
        if (when == NSLocalizedString("OnlyD", comment: "")) {
            return "0"
        } else if (when == NSLocalizedString("OnlyN", comment: "")) {
            return "1"
        } else if (when == NSLocalizedString("AtD&N", comment: "")) {
            return "1"
        } else {
            return "3"
        }
    }
    
    func yearIndex(year: String) -> String {
        
        // This really isnt the best way to do this but have to match the way the android app/api functions
        switch year {
        case "2016":
            return "0"
        case "2017":
            return "1"
        case "2018":
            return "2"
        case "2019":
            return "3"
        case "2020":
            return "4"
        case "2021":
            return "5"
        case "2022":
            return "6"
        case "2023":
            return "7"
        case "2024":
            return "8"
        case "2025":
            return "9"
        case "2026":
            return "10"
        case "2027":
            return "11"
        case "2028":
            return "12"
        case "2029":
            return "13"
        case "2030":
            return "14"
        default:
            return ""
        }
        
    }
    
    func protectedArea(area: String) -> String {
        if area == NSLocalizedString("no", comment: "") {
            return "[\"1\",\"-1\"]"
        } else if area == NSLocalizedString("IDontKnow", comment: "") {
            return "[\"2\",\"-1\"]"
        } else {
            return "[\"0\",\"\(area)\"]"
        }
    }
    
    func generateHabitat(habitats: [String], species: String) -> String {
        
        let allHabitats = generateHabitatList(species: species)
        var string: String = ""
        
        for habitat in allHabitats {
            if habitats.contains(habitat) {
                string = string + "true, "
            } else {
                string = string + "false, "
            }
        }
        // Remove trailing ", " - two characters
        string = String(string.dropLast(2))
        
        return "\(string)"
    }
    
    
    func generateJSON(answers: Answers, version: String, deviceID: UUID) -> String {
        //let shape = [ "sightings": sighting.init()]
        
        switch version {
        case "1": // Complex Version
            
            print("Complex Version...")
            
            
            let sighting = "{\"sightings\":[{\"valid\": true, \"seen_by\": \"\(deviceID)\" ," + "\"answers\": [{" +
            "\"0\": [\"2.0\"]," + // App Version
            "\"1\": [\"\(version)\"]," +   //Version Index - nuestion count
            "\"2\": [\((answers.species == NSLocalizedString("UCCrab", comment: "") ? "\"0\"" : "\"1\""))]," + // Species
            "\"3\": [\"\(yearIndex(year: answers.year))\"]," + // Index of Year
            "\"4\": [\"\(answers.month-1)\"]," + // Index of Month
            "\"5\": \(generateDaysString(dayList: answers.days, month: answers.month, year: answers.year))," + //Days
            "\"6\": [\"\(generateDayString(day: answers.strongestDay, month: answers.month, year: answers.year))\"]," + // Strongest Day
            "\"7\": [\"\(answers.intensity)\"]," + // Intensity
            "\"8\": [\"\(timeOfDay(when: answers.when))\"]," + // index of time of day
            "\"9\": [\"\(answers.berried)\"]," + // Berried question
            "\"10\": [\"\(generateHabitat(habitats: answers.habitat, species: answers.species))\"]," + // Habitats
            "\"11\": [\"\(answers.state)\"]," + // State as string
            "\"12\": [\"\(answers.county)\"]," + // County as string
            "\"13\": \(protectedArea(area: answers.protectedZone))," + // Protected area
            "\"14\": [\"\(answers.occupation)\"]," + // Occupation as string
            "\"15\": \(additionalObservation(observation: answers.additional))," + // Additional Observation
            "\"16\": \(generateSubmissionDateTime())," + // Submission date and time
            "\"17\": []," + // Unused
            "\"18\": []}]}]}" // Unused
            
            do {
                let encodedDictionary = try JSONEncoder().encode(sighting)
                print(encodedDictionary)
            } catch {
                print("Error: ", error)
            }
            
            print(sighting)
            return sighting
            
        default:
            
            print("Basic Version...")
            
            let sighting = "{\"sightings\":[{\"valid\": true, \"seen_by\": \"\(deviceID)\" ," + "\"answers\": [{" +
            "\"0\": [\"2.0\"]," + // App Version
            "\"1\": [\"\(version)\"]," +   //Version Index - question count
            "\"2\": [\((answers.species == NSLocalizedString("UCCrab", comment: "") ? "\"0\"" : "\"1\""))]," + // Species
            "\"3\": [\"\(yearIndex(year: answers.year))\"]," + // Index of Year
            "\"4\": [\"\(answers.month-1)\"]," + // Index of Month
            "\"5\": \(generateDaysString(dayList: answers.days, month: answers.month, year: answers.year))," + //Days
            "\"6\": [\"\(answers.intensity)\"]," + // Intensity
            "\"7\": [\"\(answers.state)\"]," + // State as string
            "\"8\": [\"\(answers.county)\"]," + // County as string
            "\"9\": \(protectedArea(area: answers.protectedZone))," + // Protected area
            "\"10\": [\"\(answers.occupation)\"]," + // Occupation as string
            "\"11\": \(additionalObservation(observation: answers.additional))," + // Additional Observation
            "\"12\": \(generateSubmissionDateTime())," + // Submission date and time
            "\"13\": []," + // Unused
            "\"14\": []," + // Unused
            "\"15\": []," + // Unused
            "\"16\": []," + // Unused
            "\"17\": []," + // Unused
            "\"18\": []}]}]}" // Unused
            
            do {
                let encodedDictionary = try JSONEncoder().encode(sighting)
                print(encodedDictionary)
            } catch {
                print("Error: ", error)
            }
            
            print(sighting)
            return sighting
        }
        
        //print(shape)
    }
    
    /// Returns current date/time of in an array of strings - to be used by the generate JSON method
    func generateSubmissionDateTime() -> [String] {
        
        // Create Date formatter object, and set format
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Edit this if changing API to a specific date standard
        
        // Format current date to preset format then return from function
        let submissionDate = dateFormatter.string(from: Date())
        return [submissionDate]
    }
}
