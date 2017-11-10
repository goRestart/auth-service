import Vapor
import CoreService
import user_service_api

private struct Parameter {
  static let username = "username"
  static let password = "password"
}

struct AuthController {

  private let userApi: UserApi
  private let generateAuthToken: GenerateAuthToken
  
  init(userApi: UserApi,
       generateAuthToken: GenerateAuthToken)
  {
    self.userApi = userApi
    self.generateAuthToken = generateAuthToken
  }
  
  func login(_ request: Request) -> ResponseRepresentable {
    guard let username = request.data[Parameter.username]?.string,
      let password = request.data[Parameter.password]?.string else {
        return Response.missingParameters
    }
    let credentials = UserCredentials(
      username: username,
      password: password
    )
    
    let verificationResponse = userApi.verify(credentials)
    let credentialsAreValid = verificationResponse.status == .ok
    
    guard credentialsAreValid else {
      return verificationResponse
    }
    
    let token = generateAuthToken.generate(with: "userId")
    return "token = \(token)"
  }
}
