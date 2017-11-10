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
      userApi: userApi,
      generateAuthToken: generateAuthToken
    )
  }
  
  private var userApi: UserApi {
    return UserServiceApiFactory.make()
  }
}
