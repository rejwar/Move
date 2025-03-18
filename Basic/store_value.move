module StoreValue {
    resource struct MyValue { value: u64 }

    public fun store(account: &signer, val: u64) {
        move_to(account, MyValue { value: val });
    }
}
