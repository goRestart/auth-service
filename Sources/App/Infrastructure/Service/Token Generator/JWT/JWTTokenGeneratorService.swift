import Vapor
import JWT
import user_service_api

struct JWTTokenGeneratorService: TokenGeneratorService {
  
  private let jwtPayloadBuilder: JWTPayloadBuilder
  private let signer: Signer
  
  init(jwtPayloadBuilder: JWTPayloadBuilder,
       signer: Signer)
  {
    self.jwtPayloadBuilder = jwtPayloadBuilder
    self.signer = signer
  }
  
  func generate(for user: User) throws -> AuthToken {
    let payload = try jwtPayloadBuilder.build(
      for: user
    )
    
    let token = try! JWT(
      payload: payload,
      signer: signer
    ).createToken()
    
    return AuthToken(
      token: token
    )
  }
}
