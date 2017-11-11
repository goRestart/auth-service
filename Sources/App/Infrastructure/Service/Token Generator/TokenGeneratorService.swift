import Foundation

protocol TokenGeneratorService {
  func generate(with identifier: String) -> AuthToken
}
