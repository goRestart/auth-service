import CoreService

extension Assembly {
  var authRouteCollection: AuthRouteCollection {
    return AuthRouteCollection(
      authController: authController
    )
  }
  
  private var authController: AuthController {
    return AuthController()
  }
}
