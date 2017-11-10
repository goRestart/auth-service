import Foundation

struct GenerateAuthToken {
  
  private let tokenGeneratorService: TokenGeneratorService
  
  init(tokenGeneratorService: TokenGeneratorService) {
    self.tokenGeneratorService = tokenGeneratorService
  }
  
  func generate(with userId: String) -> AuthToken {
    return tokenGeneratorService.generate(with: userId)
  }
}
