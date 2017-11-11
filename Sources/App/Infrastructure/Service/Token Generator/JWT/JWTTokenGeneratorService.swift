import Vapor
import JWT

struct JWTTokenGeneratorService: TokenGeneratorService {
  
  private let jwtPayloadBuilder: JWTPayloadBuilder
  private let signer: Signer
  
  init(jwtPayloadBuilder: JWTPayloadBuilder,
       signer: Signer)
  {
    self.jwtPayloadBuilder = jwtPayloadBuilder
    self.signer = signer
  }
  
  func generate(with identifier: String) -> AuthToken {
    let payload = jwtPayloadBuilder.build(
      with: identifier
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
