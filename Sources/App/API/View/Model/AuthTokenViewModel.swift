import JSON

struct AuthTokenViewModel {
  let token: String
}

// MARK: - JSONRepresentable

extension AuthTokenViewModel: JSONRepresentable {
  func makeJSON() throws -> JSON {
    var json = JSON()
    try json.set("token", token)
    return json
  }
}
