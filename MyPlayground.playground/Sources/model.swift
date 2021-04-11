import Foundation

public struct coronaData:Decodable {
   public let Global: global
    public let Date: String
}
public struct global:Decodable {
    public let TotalDeaths:Double
    public let NewConfirmed:Double
    public let TotalConfirmed:Double
    public let NewDeaths:Double
    public let NewRecovered:Double
    public let TotalRecovered:Double
}
