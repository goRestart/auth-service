import CoreService
import JWT

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
    return HS512(
      key: "4TMsSvPKpwUvvgY_f_5BcYfd73iRpiv0Pw3sF1z_TnAwu97YCnhe0ThaLtbxJiIWATmKxb7oKAQ".makeBytes()
    )
    // TODO: Get key via environment variables
  }
}
