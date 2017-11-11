import Vapor
 
extension Config {
  public func setup() throws {
    Node.fuzzy = [JSON.self, Node.self]
  }
}
