import CoreService
import JWT
import Vapor

extension Assembly {
  var jwtTokenGeneratorService: TokenGeneratorService {
    return JWTTokenGeneratorService(
      jwtPayloadBuilder: jwtPayloadBuilder,
      signer: signer
    )
  }
  
  private var jwtPayloadBuilder: JWTPayloadBuilder {
    return JWTPayloadBuilder(
      hasher: hasher
    )
  }
  
  private var signer: Signer {
    guard let appConfig = config["app"] else {
      fatalError()
    }
    guard let signerKey = appConfig["SIGNER_KEY"]?.string else {
      fatalError("You must configure the signer key for the service")
    }
    return HS512(
      key: signerKey.makeBytes()
    )
  }
}
