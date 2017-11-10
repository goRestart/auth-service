import Vapor

private struct Endpoint {
  static let login = "/login"
}

struct AuthRouteCollection: RouteCollection  {
  
  private let authController: AuthController
  
  init(authController: AuthController) {
    self.authController = authController
  }
  
  func build(_ builder: RouteBuilder) throws {
    builder.post(Endpoint.login) { request in
      return try authController.login(request)
    }
  }
}
