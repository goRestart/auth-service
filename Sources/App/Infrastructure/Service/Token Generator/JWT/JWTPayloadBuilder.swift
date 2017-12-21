import JWT
import Vapor
import user_service_api

private struct JWTConstraints {
  static let issuer = "auth.restart-api.com"
}

struct JWTPayloadBuilder {

  private let hasher: HashProtocol
  
  init(hasher: HashProtocol) {
    self.hasher = hasher
  }
  
  func build(for user: User) throws -> JSON {
    let issuer = IssuerClaim(
      string: JWTConstraints.issuer
    )
    let timestamp = Int(Date().timeIntervalSince1970 * 1000)
    let issuedAt = IssuedAtClaim(
      seconds: timestamp
    )
    let subject = SubjectClaim(
      string: user.id.value
    )
    return JSON([
      issuer, issuedAt, subject, try jwtId(for: user)
    ])
  }
  
  private func jwtId(for user: User) throws -> JWTIDClaim {
    return JWTIDClaim(
      string: try hasher.make(user.id.value + JWTConstraints.issuer).makeString()
    )
  }
}
