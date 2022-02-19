# Functions

> 함수는 작업의 가장 작은 단위이자 하나의 작은 프로그램


### 1. 함수의 정의와 호출
- 재정의(override)와 중복정의(overload)를 모두 지원

```swift
// 함수 정의
func 함수이름(매개변수...) -> 반환타입 {
    실행구문
    return 반환값
}

// 함수 호출
함수이름()
```

```swift
// 함수 정의
func hello(name: String) {
    print("Hello func!")
}

// 함수 호출
sayHello()
```