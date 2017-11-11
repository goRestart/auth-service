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
      userServiceApiFactory: userServiceApiFactory,
      generateAuthToken: generateAuthToken,
      authTokenViewMapper: authTokenViewMapper
    )
  }
  
  private var userServiceApiFactory: UserServiceApiFactory {
    return UserServiceApiFactory()
  }
}
