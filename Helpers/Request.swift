
import Foundation
import Alamofire



class Request{
    
static let shared = Request	()
    
    private init() {}
    
    func getUsers() -> DataRequest {
        
        return AF.request(Endpoints.shared.urlServerJose+Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil).response { response in
            debugPrint(response)
        }
        
    }
    
    func registerUser(user : User) {
        
        
        AF.request(Endpoints.shared.urlServerJose+Endpoints.shared.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: nil, interceptor:nil).response { response in
            debugPrint(response)
        }
    }
    
    func restorePassword(parameters:[String:String]) -> DataRequest {

       return AF.request(Endpoints.shared.urlServerJose+Endpoints.shared.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default)
        
        
    }
    
    func login(parameters:[String:String])  -> DataRequest{

        return AF.request(Endpoints.shared.urlServerJose+Endpoints.shared.login, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default).response{ response in
            debugPrint(response)
        }
    }
  
    func profileInfo(parameters:[String:String]) -> DataRequest {

        //let headers:HTTPHeaders = ["api_token":api_token]
        
        return AF.request(Endpoints.shared.urlServerJose + Endpoints.shared.getProfileInfo, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil)

    }
    func changePassword(parameters:[String:String]) -> DataRequest {
            
            return AF.request(Endpoints.shared.urlServerJose + Endpoints.shared.updatePassword, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil)

    }
    
    func delete(parameters:[String:String]) -> DataRequest {
            
            return AF.request(Endpoints.shared.urlServerJose + Endpoints.shared.delete, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default, headers: nil)

    }
    
}
