import Vapor
import CoreService
import user_service_api

private struct Parameter {
  static let username = "username"
  static let password = "password"
}

struct AuthController {

  private let verifyUserCredentials: VerifyUserCredentials
  private let generateAuthToken: GenerateAuthToken
 
  init(verifyUserCredentials: VerifyUserCredentials,
       generateAuthToken: GenerateAuthToken)
  {
    self.verifyUserCredentials = verifyUserCredentials
    self.generateAuthToken = generateAuthToken
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
    
    guard let userResponse = try verifyUserCredentials.execute(with: credentials) else {
      return Response(status: .internalServerError)
    }
    guard let user = userResponse.user else {
      return userResponse.response
    }
    let token = try generateAuthToken.generate(for: user)
    return try token.makeResponse()
  }
}
