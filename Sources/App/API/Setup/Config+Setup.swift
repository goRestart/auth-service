import Vapor

extension Config {
  public func setup() throws {
    Node.fuzzy = [JSON.self, Node.self]

    try setupProviders()
  }
  
  // MARK: - Providers
  
  private func setupProviders() throws {

  }
}
