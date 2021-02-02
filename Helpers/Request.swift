
import Foundation
import Alamofire



class Request{
    
static let shared = Request	()
    
    private init() {}
    
    func getUsers() -> DataRequest {
        
        return AF.request(Endpoints.shared.baseUrl+Endpoints.shared.all, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor:nil)
        
    }
    
    func registerUser(user:[String  : String]) {
        
        
        AF.request(Endpoints.shared.baseUrl+Endpoints.shared.register, method: .post, parameters: user, encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        }
    }
    
    func restorePassword(parameters:[String:String]) {

        /*AF.request(Endpoints.shared.baseUrl+Endpoints.shared.restorePassword, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default).response { response in
            debugPrint(response)
        
        }*/
    }
    
    func login(parameters:[String:String])  -> DataRequest{

        return AF.request(Endpoints.shared.baseUrl+Endpoints.shared.login, method: .post, parameters:parameters , encoder: JSONParameterEncoder.default)
    }
  

}
