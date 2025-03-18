module SimpleLoan {
    resource struct Loan { amount: u64 }

    public fun take_loan(account: &signer, amount: u64) {
        move_to(account, Loan { amount });
    }
}
