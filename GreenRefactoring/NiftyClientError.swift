import Foundation
enum NiftyClientError: Error {
    case connectionError(Error)
    
    case responseParseError(Error)
    
//    case apiError(GitHubAPIError)
}
