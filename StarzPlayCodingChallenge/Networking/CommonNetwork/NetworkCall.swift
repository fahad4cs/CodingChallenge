//
//  NetworkCall.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Foundation
import Alamofire

protocol NetworkCallProtocol {
    func request<R: RequestProtocol>(_ resource: R, completion: @escaping (Result<Data, AppError>) -> Void)
}

final class NetworkCall: NetworkCallProtocol {
    private let oAuthValidaterequestInterceptor: OAuthValidationRequestInterceptorProtocol?
    var authToken: Data = Data()

    init(interceptor: OAuthValidationRequestInterceptorProtocol? = nil) {
        oAuthValidaterequestInterceptor = interceptor
    }
    /**  request : funaction so send the network calls **/
    func request<R>(_ resource: R, completion: @escaping (Result<Data, AppError>) -> Void) where R: RequestProtocol {
        var httpHeaders: Alamofire.HTTPHeaders?
        if let headers = resource.headers?.map({ Alamofire.HTTPHeader(name: $0.key, value: $0.value) }) {
            httpHeaders = Alamofire.HTTPHeaders(headers)
        }

        let url = resource.url
        debugPrint(url)
        AF.request(url, method: resource.method.alamofireMethod,
                   parameters: resource.parameters,
                   encoding: resource.encoding.alamofirePramEncoding,
                   headers: httpHeaders,
                   interceptor: oAuthValidaterequestInterceptor,
                   requestModifier: { $0.timeoutInterval = 60 }).validate(statusCode: 200 ... 400)
            .response(completionHandler: { response in

                debugPrint(response.request as Any)
                debugPrint(response.request?.httpBody as Any)
                debugPrint(response)
                debugPrint(response.response?.allHeaderFields as Any)

                switch response.result {
                case .success:
                    if let statusCode = response.response?.statusCode {
                        if statusCode == 200 {                            debugPrint("status 200 run in success")
                            if let JSON = response.response?.allHeaderFields as? [String: Any] {
                                let keyExists = JSON["Authorization"]
                                if keyExists != nil {
                                    let authToken = JSON["Authorization"] as? String
                                    debugPrint("Auth Token is " + (authToken ?? "No Token"))
                                    var headerDict = [String: String]()
                                    headerDict["access_token"] = authToken
                                    debugPrint(headerDict)
                                    let jsonEncoder = JSONEncoder()
                                    do {
                                        self.authToken = try jsonEncoder.encode(headerDict)
//                                        let model = self.authToken.decode(into: AuthTokenResponseModel.self)
//                                        UserDefaults.standard.saveObject(model, forKey: USER_TOKEN)
                                    } catch {

                                    }
                                }
                            }
                            if let data = response.data {
                                completion(.success(data))
                            }
                        } else {
                            debugPrint("status \(statusCode) run in success")
                            if let data = response.data {
                                var errorModel = data.decode(into: ApiErrorResponseModel.self)
                                errorModel?.statusCode = statusCode
                                completion(.failure(AppError.apiError(errorModel!)))
                            }
                        }
                    }
                case .failure(_):
                    if let data = response.data {
                        if let errorResponseModel = data.decode(into: ApiErrorResponseModel.self) {
                            completion(.failure( AppError.apiError(errorResponseModel)))
                        } else {
                            completion(.failure( AppError.unknown))
                        }
                    }
                }
            })
    }
}

/**  HTTPMethod : type method **/
extension HTTPMethod {
    var alamofireMethod: Alamofire.HTTPMethod {
        switch self {
        case .get:
            return Alamofire.HTTPMethod.get
        case .post:
            return Alamofire.HTTPMethod.post
        case .put:
            return Alamofire.HTTPMethod.put
        case .patch:
            return Alamofire.HTTPMethod.patch
        case .delete:
            return Alamofire.HTTPMethod.delete
        }
    }
}
/**  RequestEncoding : Encoding **/
extension RequestEncoding {
    var alamofirePramEncoding: Alamofire.ParameterEncoding {
        switch self {
        case .url:
            return URLEncoding.default
        case .json:
            return JSONEncoding.default
        }
    }
}
