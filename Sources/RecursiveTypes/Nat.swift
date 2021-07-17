/// Type-level (compile-time) natural number, with a static property to retrieve the value as an integer at run-time.
protocol Nat {
    static var intVal: Int { get }
}

/// Uninhabited type representing the value 0 at compile time.
enum Zero: Nat {
    static var intVal: Int { 0 }
}

/// Uninhabited type representing an integer greater than 0 at compile-time.
enum Succ<Pred: Nat>: Nat {
    static var intVal: Int {
        Pred.intVal + 1
    }
}

// These aliases all seem to be fine, up to at least 64 deep:
typealias _0 = Zero
typealias _1 = Succ<Zero>
typealias _2 = Succ<Succ<Zero>>
typealias _4 = Succ<Succ<Succ<Succ<Zero>>>>
typealias _8 = Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Zero>>>>>>>>
typealias _16 = Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Zero>>>>>>>>>>>>>>>>
typealias _32 = Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Zero>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
typealias _64 = Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<
                Succ<Succ<Succ<Succ<Succ<Succ<Succ<Succ<Zero>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


typealias One = Succ<Zero>
typealias Plus1<T: Nat> = Succ<T>
typealias Plus2<T: Nat> = Plus1<Plus1<T>>
typealias Plus4<T: Nat> = Plus2<Plus2<T>>
typealias Plus8<T: Nat> = Plus4<Plus4<T>>

/// The compiler hangs if this type alias is **used**, but not if this declaration appears but is never applied:
typealias Plus16<T: Nat> = Plus8<Plus8<T>>

/// By applying `Plus16`, this line will hang the compiler:
//typealias Plus32<T: Nat> = Plus16<Plus16<T>>
