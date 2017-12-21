import Foundation
import user_service_api

struct GenerateAuthToken {
  
  private let tokenGeneratorService: TokenGeneratorService
  
  init(tokenGeneratorService: TokenGeneratorService) {
    self.tokenGeneratorService = tokenGeneratorService
  }
  
  func generate(for user: User) throws -> AuthToken {
    return try tokenGeneratorService.generate(for: user)
  }
}
