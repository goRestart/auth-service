import CoreService
import user_service_api

extension Assembly {
  var authRouteCollection: AuthRouteCollection {
    return AuthRouteCollection(
      authController: authController
    )
  }
  
  private var authController: AuthController {
    return AuthController(
      verifyUserCredentials: verifyUserCredentials,
      generateAuthToken: generateAuthToken
    )
  }
  
  private var verifyUserCredentials: VerifyUserCredentials {
    return VerifyUserCredentials()
  }
}
