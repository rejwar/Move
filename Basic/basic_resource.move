module BasicResource {
    resource struct Resource { data: u64 }

    public fun create_resource(account: &signer, value: u64) {
        move_to(account, Resource { data: value });
    }
}
