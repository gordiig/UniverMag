//
//  User.swift
//  UNIVERmag
//
//  Created by Dmitry Gorin on 26.03.2018.
//  Copyright © 2018 gordiig. All rights reserved.
//

import Foundation
import UIKit

class User: NSObject
{
    // MARK: - Vairables
    var ID = 0
    var username = "Username"
    var firstName: String?
    var lastName: String?
    var dateOfRegistration = Date()
    private var password = "Password"
    var imgUrl: URL?
    var img: UIImage?
    var about: String?
    var phoneNumber = "+7 (999) 999-99-99"
    var email = "zzz@zzz.zz"
    var city = "City"
    
    // MARK: - Decodable struct
    struct UserStruct: Decodable
    {
        var id: Int
        var user_name: String
        var first_name: String?
        var last_name: String?
        var date_of_registration: String
        var password: String
        var img_url: URL?
        var about: String?
        var phone_number: String
        var email: String
        var city: String
    }
 
    
    // MARKL - inits
    init?(fromData data: Data)
    {
        super.init()
        
        let decoder = JSONDecoder()
        do
        {
            let newUser = try decoder.decode(UserStruct.self, from: data)
            self.fillFromUserStruct(userStruct: newUser)
        }
        catch let err
        {
            print("ERROR in making user from newUser")
            print("ERROR: \(err)")
            print("loc desc: \(err.localizedDescription)")
            
            return nil
        }
    }
    
    func fillFromUserStruct(userStruct val: UserStruct)
    {
        self.ID = val.id
        self.username = val.user_name
        self.firstName = val.first_name
        self.lastName = val.last_name
        self.password = val.password
        self.imgUrl = val.img_url
        self.about = val.about
        self.phoneNumber = val.phone_number
        self.email = val.email
        self.city = val.city
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.dateOfRegistration = dateFormatter.date(from: val.date_of_registration)!
    }
}
