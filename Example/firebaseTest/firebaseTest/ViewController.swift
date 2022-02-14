//
//  ViewController.swift
//  firebaseTest
//
//  Created by heyji on 2022/01/26.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet var dataLabel: UILabel!
    @IBOutlet var numberOfCustomers: UILabel!
    let db = Database.database().reference()
    
    var customers: [Customer] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        updateLable()
//        saveBasicTypes()
//        saveCustomers()
        fetchCustomers()
//        updateBasicTypes()
        deleteBasicTypes()
    }
    
    func updateLable() {
        db.child("firstData").observeSingleEvent(of: .value) { snapshot in
            print("--> \(snapshot)")
            
            let value = snapshot.value as? String ?? ""
            
            DispatchQueue.main.async {
                self.dataLabel.text = value
            }
        }
    }
    
    @IBAction func createCustomer(_ sender: Any) {
        saveCustomers()
    }
    
    @IBAction func fetchCustomer(_ sender: Any) {
        fetchCustomers()
    }
    
    @IBAction func updateCustomer(_ sender: Any) {
        updateCustomer()
    }
    
    func updateCustomer() {
        guard customers.isEmpty == false else { return }
        customers[0].name = "Min"
        
        let dictionary = customers.map { $0.toDictionary }
        db.updateChildValues(["customers": dictionary])
    }
    
    @IBAction func deleteCustomer(_ sender: Any) {
        deleteCustomer()
    }
    
    func deleteCustomer() {
        db.child("customers").removeValue()
    }
}

extension ViewController {
    func saveBasicTypes() {
        db.child("int").setValue(3)
        db.child("double").setValue(3.5)
        db.child("str").setValue("string value - 여러분 안녕")
        db.child("array").setValue(["a", "b", "c"])
        db.child("dict").setValue(["id": "anyID", "age": 10, "city": "seoul"])
    }
    
    func saveCustomers() {
        let books = [Book(title: "Good to Great", author: "Someone"), Book(title: "Hacking Growth", author: "Somebody")]
        let customer1 = Customer(id: "\(Customer.id)", name: "Son", books: books)
        Customer.id += 1
        let customer2 = Customer(id: "\(Customer.id)", name: "Dele", books: books)
        Customer.id += 1
        let customer3 = Customer(id: "\(Customer.id)", name: "Kane", books: books)
        Customer.id += 1
        
        db.child("customers").child(customer1.id).setValue(customer1.toDictionary)
        db.child("customers").child(customer2.id).setValue(customer2.toDictionary)
        db.child("customers").child(customer3.id).setValue(customer3.toDictionary)
    }
}

extension ViewController {
    func fetchCustomers() {
        db.child("customers").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.value)
            do {
                let data = try JSONSerialization.data(withJSONObject: snapshot.value, options: [])
                let decoder = JSONDecoder()
                let customers: [Customer] = try decoder.decode([Customer].self, from: data)
                self.customers = customers
                
                DispatchQueue.main.async {
                    self.numberOfCustomers.text = "# of Customers: \(customers.count)"
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController {
    func updateBasicTypes() {        
        db.updateChildValues(["int": 6])
        db.updateChildValues(["double": 5.4])
        db.updateChildValues(["str": "변경된 스트링"])
    }
    
    func deleteBasicTypes() {
        db.child("int").removeValue()
        db.child("double").removeValue()
        db.child("str").removeValue()
    }
}

struct Customer: Codable {
    let id: String
    var name: String
    let books: [Book]
    
    // 바로 보낼 수 없을 거라 예상해서 딕셔너리를 만들어줌
    var toDictionary: [String: Any] {
        let booksArray = books.map { $0.toDictionary }
        let dict: [String: Any] = ["id": id, "name": name, "books": booksArray]
        return dict
    }
    
    static var id: Int = 0
}

struct Book: Codable {
    let title: String
    let author: String
    
    var toDictionary: [String: Any] {
        let dict: [String: Any] = ["title": title, "author": author]
        return dict
    }
}
