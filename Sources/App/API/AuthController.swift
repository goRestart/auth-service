import Vapor
import CoreService
import user_service_api

private struct Parameter {
  static let username = "username"
  static let password = "password"
}

struct AuthController {

  private let userServiceApiFactory: UserServiceApiFactory
  private let generateAuthToken: GenerateAuthToken
  private let authTokenViewMapper: AuthTokenViewMapper
  
  init(userServiceApiFactory: UserServiceApiFactory,
       generateAuthToken: GenerateAuthToken,
       authTokenViewMapper: AuthTokenViewMapper)
  {
    self.userServiceApiFactory = userServiceApiFactory
    self.generateAuthToken = generateAuthToken
    self.authTokenViewMapper = authTokenViewMapper
  }
  
  func login(_ request: Request) throws -> ResponseRepresentable {
    guard let username = request.data[Parameter.username]?.string,
      let password = request.data[Parameter.password]?.string else {
        return Response.missingParameters
    }
    let credentials = UserCredentials(
      username: username,
      password: password
    )
    
    let verificationResponse = userServiceApiFactory.make().verify(credentials)
    let credentialsAreValid = verificationResponse.status == .ok
    
    guard credentialsAreValid else {
      return verificationResponse
    }
  
    let token = generateAuthToken.generate(
      with: username
    )
    let authTokenViewModel = try authTokenViewMapper
      .map(token)
      .makeJSON()
    
    return try Response(status: .ok, json: authTokenViewModel)
  }
}
