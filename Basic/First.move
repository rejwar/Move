module 0x1::Counter {
    use std::signer;

    // The Counter resource stores a u64 value.
    struct Counter has key {
        value: u64,
    }

    /// Initializes the counter in the sender's account if it doesn't already exist.
    public fun initialize(account: &signer) {
        if (!exists<Counter>(signer::address_of(account))) {
            move_to(account, Counter { value: 0 });
        }
    }

    /// Increments the counter stored in the sender's account.
    public fun increment(account: &signer) {
        let addr = signer::address_of(account);
        let counter_ref = borrow_global_mut<Counter>(addr);
        counter_ref.value = counter_ref.value + 1;
    }

    /// Returns the current counter value for the provided account address.
    public fun get_value(account: address): u64 {
        if (exists<Counter>(account)) {
            borrow_global<Counter>(account).value
        } else {
            0
        }
    }
}
