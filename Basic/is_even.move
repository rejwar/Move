module IsEven {
    public fun is_even(number: u64): bool {
        // Check if a number is even
        return number % 2 == 0;
    }
}
