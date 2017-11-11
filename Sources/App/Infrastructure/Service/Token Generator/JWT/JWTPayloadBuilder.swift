import JWT
import Vapor

private struct JWTConstraints {
  static let issuer = "auth.restart-api.com"
}

struct JWTPayloadBuilder {

  private let hasher: HashProtocol
  
  init(hasher: HashProtocol) {
    self.hasher = hasher
  }
  
  func build(with identifier: String) -> JSON {
    let issuer = IssuerClaim(
      string: JWTConstraints.issuer
    )
    let issuedAt = IssuedAtClaim(
      seconds: Int(Date().timeIntervalSince1970)
    )
    let hashedId = try! hasher.make(
      identifier.lowercased()
    ).makeString()
    
    let subject = SubjectClaim(
      string: hashedId
    )
    
    return JSON([
      issuer, issuedAt, subject
    ])
  }
}
