//
//  BasketFunctions.swift
//  KioskProgram
//
//  Created by (^ㅗ^)7 iMac on 2023/07/25.
//

import Foundation

class BasketFunctions: Basket {
    
    override func showCurrentBasket() {
        if basketList.isEmpty {
            print("========================================")
            print("장바구니가 비어있습니다.")
        } else {
            print("========================================")
            print("-장바구니-")
            for i in (0..<basketList.count) {
                if case let .name(name) = basketList[i] {
                    print("\(i+1). \(name)")
                }
            }
        }
        print("총액 : \(total)")
    }

    //장바구니에 상품을 추가하는 메소드
    override func appendProduct(product : String, price : Int, num : Int) {
        basketList.append(.name(product))
        basketList.append(.price(price))
        basketList.append(.num(num))
        print("장바구니에 추가되었습니다.")
    }
    
    //장바구니의 상품을 삭제하는 메소드
    override func removeProduct() {
        print("========================================")
        print("-장바구니-")
        for i in (0..<basketList.count) {
            if case let .name(name) = basketList[i] {
                print("\(i+1). \(name)")
            }
        }
        print("========================================")
        print("삭제할 상품의 번호를 입력하세요. \n0번은 취소입니다.")
        let deleteNumber = Int(readLine() ?? "0")
        if deleteNumber!-1 >= basketList.count {
            print("========================================")
            print("삭제할 상품의 번호가 존재하지 않습니다.")
        } else if deleteNumber == 0 {
            print("========================================")
            print("취소되었습니다.")
        } else {
            basketList.remove(at: deleteNumber!-1)
            print("========================================")
            print("\(deleteNumber!)번 상품이 삭제되었습니다.")
        }
    }
    
    //장바구니의 모든 상품을 삭제하는 메소드
    override func removeEverything() {
        print("========================================")
        print("장바구니의 상품을 전체삭제 하시겠습니까?")
        print("1. Yes \n2. No")
        let chooseOpetion = Int(readLine() ?? "2")
        if chooseOpetion == 1 {
            basketList.removeAll()
            print("========================================")
            print("장바구니의 상품이 전체 삭제되었습니다.")
        } else {
            print("========================================")
            print("취소되었습니다.")
        }
    }
}
