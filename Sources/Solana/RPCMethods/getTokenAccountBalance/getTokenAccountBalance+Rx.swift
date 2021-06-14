import Foundation
import RxSwift

public extension Solana {
    func getTokenAccountBalance(pubkey: String, commitment: Commitment? = nil) -> Single<TokenAccountBalance> {
        Single.create { emitter in
            self.getTokenAccountBalance(pubkey: pubkey, commitment: commitment) {
                switch $0 {
                case .success(let balance):
                    emitter(.success(balance))
                case .failure(let error):
                    emitter(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}
