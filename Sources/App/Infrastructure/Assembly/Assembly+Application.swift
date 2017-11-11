import CoreService
import Vapor

extension Assembly {
  public var application: Droplet {
    let droplet = try! Droplet(config)
    try! droplet.collection(authRouteCollection)
    return droplet
  }
  
  var config: Config {
    let config = try! Config()
    try! config.setup()
    return config
  }
  
  var hasher: HashProtocol {
    return CryptoHasher(
      hash: .sha256,
      encoding: .hex
    )
  }
}
