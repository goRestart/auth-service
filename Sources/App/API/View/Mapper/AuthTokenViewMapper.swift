import Foundation

struct AuthTokenViewMapper {

  func map(_ from: AuthToken) -> AuthTokenViewModel {
    return AuthTokenViewModel(
      token: from.token
    )
  }
}
