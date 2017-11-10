import Vapor

private struct Endpoint {
  static let login = "/login"
}

struct AuthRouteCollection: RouteCollection  {
  
  func build(_ builder: RouteBuilder) throws {
    builder.post(Endpoint.login) { _ in
      return "ok"
    }
  }
}
