//
//  Endpoints.swift
//  Contactos
//
//  Created by user177257 on 2/2/21.
//  Copyright © 2021 alumnos. All rights reserved.
//

import Foundation
class Endpoints {
    
    private init() {}
    
    static let shared = Endpoints()
    
    //let baseUrl = "https://superapi.netlify.app"
    let urlServerJose = "http://79.159.179.214/api/users"
    //User´s Petitions
    let register:String = "/register"
    let login:String = "/login"
    let restorePassword:String = "/restore/password"
    let updatePassword:String = "/updatePassword"
    let getProfileInfo:String = "/getProfileInfo"
    let updateProfile:String = "/updateProfile"
    let all:String = "/all"
}
