import CoreService

extension Assembly {
  var authRouteCollection: AuthRouteCollection {
    return AuthRouteCollection()
  }
  
  private var authController: AuthController {
    return AuthController()
  }
}
