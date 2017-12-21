import Foundation
import user_service_api

protocol TokenGeneratorService {
  func generate(for user: User) throws -> AuthToken
}
