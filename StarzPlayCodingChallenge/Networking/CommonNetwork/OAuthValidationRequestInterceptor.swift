//
//  OAuthValidationRequestInterceptor.swift
//  CodingChallenge
//
//  Created by Apple on 21/11/23.
//

import Alamofire

protocol OAuthValidationRequestInterceptorProtocol: RequestInterceptor {
}

/**  OAuthValidationRequestInterceptor : used to ensure the  OAuth **/
class OAuthValidationRequestInterceptor: OAuthValidationRequestInterceptorProtocol {

    let oAuthClient: OAuthClient

    init(with oAuthClient: OAuthClient) {
        self.oAuthClient = oAuthClient
    }

    func adapt( _ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {

        var request = urlRequest
//        guard let token = UserSessionInfo.shared.userAuthInfo?.access_token else {
//            completion(.success(urlRequest))
//            return
//        }
//
//        let bearerToken = "\(token)"
//        request.setValue(bearerToken, forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }

    func retry( _ request: Request, for session: Session, dueTo error: Error, completion: @escaping (RetryResult) -> Void) {

//        let response = request.task?.response as? HTTPURLResponse
//        if let statusCode = response?.statusCode, statusCode == 401, request.retryCount < RETRY_LIMIT {
//            if let authInfo = UserSessionInfo.shared.authInfo {
//                let refreshTokenRequestModel = RefreshTokenRequestModel(grant_type: "refresh_token", refresh_token: authInfo.refresh_token!)
//
//                let refreshTokenRequest = RefreshTokenRequest(parameters: refreshTokenRequestModel.jsonDictionary)
//                self.oAuthClient.refreshToken(request: refreshTokenRequest, success: { responseModel in
//                    let oAuthInfo = responseModel
//                    UserSessionInfo.shared.authInfo = oAuthInfo
//                    KeychainManager.shared.saveObject(oAuthInfo, forKey: AUTH_INFO)
//                    completion(.retryWithDelay(RETRY_DELAY))
//                }, failure: { [unowned self] _ in
//                    cancelOpreationAndLogout(completion: completion)
//                })
//            }
//        } else {
            completion(.doNotRetry)
//        }
    }

    private func cancelOpreationAndLogout(completion: (RetryResult) -> Void) {
        AF.cancelAllRequests()
        completion(.doNotRetry)
    }
}
