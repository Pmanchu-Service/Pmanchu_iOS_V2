import Foundation

enum NetworkError: LocalizedError {
    case invalidURL
    case invalidResponse
    case authenticationFailed
    case invalidToken
    case decodingFailed
    case networkFailed(Error)
    case serverError(Int)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "유효하지 않은 URL입니다."
        case .invalidResponse:
            return "서버로부터 유효하지 않은 응답을 받았습니다."
        case .authenticationFailed:
            return "인증에 실패했습니다."
        case .invalidToken:
            return "유효하지 않은 토큰입니다."
        case .decodingFailed:
            return "데이터 디코딩에 실패했습니다."
        case .networkFailed(let error):
            return "네트워크 오류: \(error.localizedDescription)"
        case .serverError(let code):
            return "서버 오류 (상태 코드: \(code))"
        }
    }
}
