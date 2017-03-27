import Foundation
enum Result<T,Error:Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value:T) {
        self = .success(value)
    }
    
    init(error:Error) {
        self = .failure(error)
    }
}

enum TestResult<T,M,R> {
    case success(T)
    case failure(M)
    case hohoho(R)
    case hihihi(T)
}
