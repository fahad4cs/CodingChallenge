//
//  Common.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation

// MARK: request type
let APP_JSON = "application/json"
let APP_MULTIPART = "multipart/form-data"
let OK_TEXT = "Ok"



let NO_INTERNET = "Internet Connection not Available!"
let UNKNOWN = "The operation could not be completed. Please try again later."
let REWARD_FETCH_ERROR = "Something is wrong in getting rewards details, Please try later"
let ERROR_MSG = "Oops!!Something went wrong."
let INVALID_RESPONSE = "Invalid reponse from server"
let UN_AUTHORIZED = "Unauthorized"
let BAD_REQUEST = "Bad request"
let DATA_NNOT_FOUND = "Data not found"


// MARK: - Client ID and secret key
let CLIENT_ID = ""
let SECRET_KEY = "aaWH58dGVirwwPsjeQnwk3pf"
let RETRY_LIMIT = 5
let RETRY_DELAY: TimeInterval = 1

struct StoryboardName {
    static let Main = "Main"
}


struct CellIdentifier {
    static let LIST_CELLL = "ListCell"
}


enum PopUpMessage: String {
    case NO_BUTTON = "No"
    case YES = "Yes"
    case SUCCESS = "Success"
    case DELETE_TITLE = "Delete"
}
